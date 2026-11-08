import 'package:flutter/material.dart';

import '../../../../data/bdd/database.dart' as bdd;
import '../../../../data/bdd/depots.dart';
import '../logement_edit_page.dart';

/// Ouvre un sélecteur de logement avec recherche.
/// Retourne le logement choisi (ou créé), ou null si annulé.
Future<bdd.Logement?> choisirLogement(
  BuildContext context, {
  int? selectionId,
  bool permettreCreation = true,
}) {
  return showModalBottomSheet<bdd.Logement>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    showDragHandle: false,
    clipBehavior: Clip.antiAlias,
    builder: (ctx) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(ctx).viewInsets.bottom),
      child: SizedBox(
        height: MediaQuery.of(ctx).size.height * 0.7,
        child: _Selecteur(
          selectionId: selectionId,
          permettreCreation: permettreCreation,
        ),
      ),
    ),
  );
}

class _Selecteur extends StatefulWidget {
  const _Selecteur({this.selectionId, required this.permettreCreation});

  final int? selectionId;
  final bool permettreCreation;

  @override
  State<_Selecteur> createState() => _SelecteurState();
}

class _SelecteurState extends State<_Selecteur> {
  String _q = '';
  final _ctrl = TextEditingController();
  late Stream<List<bdd.Logement>> _stream = depotLogements.chercher(_q);

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _setQuery(String v) => setState(() {
        _q = v;
        _stream = depotLogements.chercher(_q);
      });

  Future<void> _creer() async {
    final navigator = Navigator.of(context);
    final cree = await navigator.push<bdd.Logement>(
      MaterialPageRoute(
        builder: (_) => LogementEditPage(adresseInitiale: _q.trim()),
      ),
    );
    if (cree != null && mounted) navigator.pop(cree);
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final q = _q.trim();

    return Column(
      children: [
        // ───── Header (poignée + titre + recherche) ─────
        Container(
          width: double.infinity,
          padding: const EdgeInsets.fromLTRB(20, 12, 12, 14),
          decoration: BoxDecoration(
            color: cs.surfaceContainerLow,
            border: Border(bottom: BorderSide(color: cs.outlineVariant)),
          ),
          child: Column(
            children: [
              Container(
                width: 32,
                height: 4,
                margin: const EdgeInsets.only(bottom: 10, right: 8),
                decoration: BoxDecoration(
                  color: cs.outlineVariant,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Choisir un logement',
                      style: tt.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  IconButton(
                    tooltip: 'Fermer',
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: TextField(
                  controller: _ctrl,
                  autofocus: true,
                  onChanged: _setQuery,
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    hintText: 'Adresse, porte, code…',
                    prefixIcon: const Icon(Icons.search, size: 22),
                    suffixIcon: q.isEmpty
                        ? null
                        : IconButton(
                            icon: const Icon(Icons.close, size: 20),
                            onPressed: () {
                              _ctrl.clear();
                              _setQuery('');
                            },
                          ),
                    filled: true,
                    fillColor: cs.surfaceContainerHighest,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        if (widget.permettreCreation)
          ListTile(
            leading: CircleAvatar(
              backgroundColor: cs.primary,
              foregroundColor: cs.onPrimary,
              child: const Icon(Icons.add),
            ),
            title: Text(q.isEmpty ? 'Nouveau logement' : 'Créer « $q »'),
            subtitle: const Text('Ajouter un logement qui n\'existe pas encore'),
            onTap: _creer,
          ),
        const Divider(height: 1),
        Expanded(
          child: StreamBuilder<List<bdd.Logement>>(
            stream: _stream,
            builder: (context, snapshot) {
              final logements = snapshot.data ?? const <bdd.Logement>[];
              if (logements.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Text(
                      q.isEmpty
                          ? 'Aucun logement pour le moment'
                          : 'Aucun logement trouvé',
                      style: tt.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
                    ),
                  ),
                );
              }
              return ListView.builder(
                itemCount: logements.length,
                itemBuilder: (context, i) {
                  final l = logements[i];
                  final choisi = l.idLogement == widget.selectionId;
                  return ListTile(
                    selected: choisi,
                    leading: const Icon(Icons.home_outlined),
                    title: Text(l.adresse),
                    subtitle: Text('Porte ${l.porte}'),
                    trailing: choisi ? const Icon(Icons.check) : null,
                    onTap: () => Navigator.pop(context, l),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

/// Champ de formulaire « Logement » : affiche le choix et ouvre le sélecteur.
/// À placer dans un Form (il valide qu'un logement est choisi).
class ChampLogement extends StatelessWidget {
  const ChampLogement({
    super.key,
    required this.valeur,
    required this.onChange,
  });

  final bdd.Logement? valeur;
  final ValueChanged<bdd.Logement> onChange;

  @override
  Widget build(BuildContext context) {
    return FormField<bdd.Logement>(
      initialValue: valeur,
      validator: (v) => v == null ? 'Choisis un logement' : null,
      builder: (state) {
        final l = valeur;
        return InkWell(
          borderRadius: BorderRadius.circular(4),
          onTap: () async {
            final choix = await choisirLogement(
              context,
              selectionId: l?.idLogement,
            );
            if (choix != null) {
              onChange(choix);
              state.didChange(choix);
            }
          },
          child: InputDecorator(
            isEmpty: l == null,
            decoration: InputDecoration(
              labelText: 'Logement',
              prefixIcon: const Icon(Icons.home_outlined),
              suffixIcon: const Icon(Icons.search),
              border: const OutlineInputBorder(),
              errorText: state.errorText,
            ),
            child: Text(
              l == null ? '' : '${l.adresse} · porte ${l.porte}',
              overflow: TextOverflow.ellipsis,
            ),
          ),
        );
      },
    );
  }
}
