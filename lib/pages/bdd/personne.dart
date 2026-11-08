import 'package:drift/drift.dart' hide Column, Table;
import 'package:flutter/material.dart';

import '../../core/router/sub_page_entry.dart';
import '../../core/widgets/page_container.dart';
import '../../data/bdd/database.dart' as bdd;
import 'personne_edit_page.dart';
import 'widgets/bdd_widgets.dart';
import 'widgets/selecteur_logement.dart';

enum _Tri { nom, prenom }

class _Ligne {
  const _Ligne(this.personne, this.logement);
  final bdd.Personne personne;
  final bdd.Logement logement;
}

// ======================================================================
// Liste
// ======================================================================

class Personne extends StatefulWidget {
  const Personne({super.key});

  static final entry = SubPageEntry(
    id: 'personne',
    title: 'Personnes',
    // pas de subtitle : la carte n'affiche pas de description
    builder: () => const Personne(),
  );

  @override
  State<Personne> createState() => _PersonneState();
}

class _PersonneState extends State<Personne> {
  final _searchCtrl = TextEditingController();

  String _recherche = '';
  bdd.Logement? _logementFiltre;
  bool _avecCommentaire = false;
  _Tri _tri = _Tri.nom;

  late Stream<List<_Ligne>> _stream = _buildStream();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Stream<List<_Ligne>> _buildStream() {
    final p = bdd.db.personnes;
    final l = bdd.db.logements;

    final query = bdd.db.select(p).join([
      innerJoin(l, l.idLogement.equalsExp(p.idLogement)),
    ]);

    Expression<bool>? where;
    void et(Expression<bool> e) => where = where == null ? e : where! & e;

    // Chaque mot doit correspondre (ex. « marie dupont »)
    final q = _recherche.trim();
    if (q.isNotEmpty) {
      for (final mot in q.split(RegExp(r'\s+'))) {
        final m = '%$mot%';
        et(p.prenom.like(m) |
        p.nom.like(m) |
        p.numeroTel.like(m) |
        l.adresse.like(m));
      }
    }
    if (_logementFiltre != null) {
      et(p.idLogement.equals(_logementFiltre!.idLogement));
    }
    if (_avecCommentaire) {
      et(p.commentaire.isNotNull() & p.commentaire.length.isBiggerThanValue(0));
    }
    if (where != null) query.where(where!);

    final premier = _tri == _Tri.nom ? p.nom : p.prenom;
    final second = _tri == _Tri.nom ? p.prenom : p.nom;
    query.orderBy([
      OrderingTerm(expression: premier, mode: OrderingMode.asc),
      OrderingTerm(expression: second, mode: OrderingMode.asc),
    ]);

    return query.watch().map(
          (rows) => [
        for (final r in rows) _Ligne(r.readTable(p), r.readTable(l)),
      ],
    );
  }

  void _rafraichir(VoidCallback maj) {
    setState(() {
      maj();
      _stream = _buildStream();
    });
  }

  int get _nbFiltres =>
      (_logementFiltre != null ? 1 : 0) + (_avecCommentaire ? 1 : 0);

  void _reinitialiserFiltres() {
    _searchCtrl.clear();
    _rafraichir(() {
      _recherche = '';
      _logementFiltre = null;
      _avecCommentaire = false;
    });
  }

  Future<void> _choisirFiltreLogement() async {
    final l = await choisirLogement(
      context,
      selectionId: _logementFiltre?.idLogement,
      permettreCreation: false,
    );
    if (l != null) _rafraichir(() => _logementFiltre = l);
  }

  void _ajouter() {
    Navigator.of(context).push(
      MaterialPageRoute<bool>(
        builder: (_) => PersonneEditPage(logement: _logementFiltre),
      ),
    );
  }

  void _ouvrirFiche(_Ligne ligne) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _PersonneDetailPage(id: ligne.personne.idPersonne),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return PageContainer(
      children: [
        Row(
          children: [
            Expanded(
              child: SearchBar(
                controller: _searchCtrl,
                hintText: 'Nom, prénom, téléphone, adresse…',
                leading: const Icon(Icons.search),
                elevation: const WidgetStatePropertyAll(0),
                trailing: [
                  if (_recherche.isNotEmpty)
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        _searchCtrl.clear();
                        _rafraichir(() => _recherche = '');
                      },
                    ),
                ],
                onChanged: (v) => _rafraichir(() => _recherche = v),
              ),
            ),
            const SizedBox(width: 12),
            FilledButton.icon(
              onPressed: _ajouter,
              icon: const Icon(Icons.person_add_alt_1),
              label: const Text('Ajouter'),
            ),
          ],
        ),
        const SizedBox(height: 12),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              if (_logementFiltre == null)
                ActionChip(
                  avatar: const Icon(Icons.home_outlined, size: 18),
                  label: const Text('Logement'),
                  onPressed: _choisirFiltreLogement,
                )
              else
                InputChip(
                  avatar: const Icon(Icons.home_outlined, size: 18),
                  label: Text(
                    '${_logementFiltre!.adresse} · ${_logementFiltre!.porte}',
                  ),
                  selected: true,
                  onPressed: _choisirFiltreLogement,
                  onDeleted: () => _rafraichir(() => _logementFiltre = null),
                ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('Avec commentaire'),
                selected: _avecCommentaire,
                onSelected: (v) => _rafraichir(() => _avecCommentaire = v),
              ),
              const SizedBox(width: 8),
              PopupMenuButton<_Tri>(
                tooltip: 'Trier par',
                initialValue: _tri,
                onSelected: (t) => _rafraichir(() => _tri = t),
                itemBuilder: (_) => const [
                  PopupMenuItem(value: _Tri.nom, child: Text('Trier par nom')),
                  PopupMenuItem(
                      value: _Tri.prenom, child: Text('Trier par prénom')),
                ],
                child: Chip(
                  avatar: const Icon(Icons.sort, size: 18),
                  label: Text(_tri == _Tri.nom ? 'Tri : nom' : 'Tri : prénom'),
                ),
              ),
              if (_nbFiltres > 0 || _recherche.isNotEmpty) ...[
                const SizedBox(width: 8),
                ActionChip(
                  avatar: const Icon(Icons.filter_alt_off, size: 18),
                  label: const Text('Réinitialiser'),
                  onPressed: _reinitialiserFiltres,
                ),
              ],
            ],
          ),
        ),
        const SizedBox(height: 16),

        StreamBuilder<List<_Ligne>>(
          stream: _stream,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Padding(
                padding: const EdgeInsets.all(24),
                child: Text('Erreur : ${snapshot.error}'),
              );
            }
            if (!snapshot.hasData) {
              return const Padding(
                padding: EdgeInsets.all(32),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            final lignes = snapshot.data!;
            if (lignes.isEmpty) {
              final filtre = _recherche.isNotEmpty || _nbFiltres > 0;
              return EtatVide(
                icone: filtre ? Icons.search_off : Icons.groups_outlined,
                titre: filtre ? 'Aucun résultat' : 'Aucune personne',
                message: filtre
                    ? 'Essaie de modifier ta recherche ou tes filtres.'
                    : 'Utilise le bouton « Ajouter » pour commencer.',
              );
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4, bottom: 8),
                  child: Text(
                    '${lignes.length} personne${lignes.length > 1 ? 's' : ''}',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: cs.onSurfaceVariant),
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: lignes.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (context, i) {
                    final p = lignes[i].personne;
                    final l = lignes[i].logement;
                    return CarteListe(
                      onTap: () => _ouvrirFiche(lignes[i]),
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundColor: cs.primaryContainer,
                        foregroundColor: cs.onPrimaryContainer,
                        child: Text(
                          initialesDe(p.prenom, p.nom),
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      children: [
                        Text(
                          '${p.prenom} ${p.nom}',
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        LigneCompacte(
                          icone: Icons.phone_outlined,
                          texte: formaterTel(p.numeroTel),
                        ),
                        LigneCompacte(
                          icone: Icons.home_outlined,
                          texte: '${l.adresse} · porte ${l.porte}',
                        ),
                      ],
                    );
                  },
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

// ======================================================================
// Fiche détaillée
// ======================================================================

class _PersonneDetailPage extends StatefulWidget {
  const _PersonneDetailPage({required this.id});

  final int id;

  @override
  State<_PersonneDetailPage> createState() => _PersonneDetailPageState();
}

class _PersonneDetailPageState extends State<_PersonneDetailPage> {
  late final Stream<_Ligne?> _stream = _watchLigne();

  Stream<_Ligne?> _watchLigne() {
    final p = bdd.db.personnes;
    final l = bdd.db.logements;
    final query = bdd.db.select(p).join([
      innerJoin(l, l.idLogement.equalsExp(p.idLogement)),
    ])
      ..where(p.idPersonne.equals(widget.id));

    return query.watch().map(
          (rows) => rows.isEmpty
          ? null
          : _Ligne(rows.first.readTable(p), rows.first.readTable(l)),
    );
  }

  void _modifier(_Ligne ligne) {
    Navigator.of(context).push(
      MaterialPageRoute<bool>(
        builder: (_) => PersonneEditPage(
          personne: ligne.personne,
          logement: ligne.logement,
        ),
      ),
    );
  }

  Future<void> _supprimer(_Ligne ligne) async {
    final ok = await confirmer(
      context,
      titre: 'Supprimer cette personne ?',
      message:
      '${ligne.personne.prenom} ${ligne.personne.nom} sera supprimé(e).',
    );
    if (!ok || !mounted) return;

    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);
    try {
      await (bdd.db.delete(bdd.db.personnes)
        ..where((t) => t.idPersonne.equals(widget.id)))
          .go();
      navigator.pop();
    } catch (_) {
      messenger.showSnackBar(
        const SnackBar(
          content: Text(
            'Suppression impossible : cette personne est liée à des visites.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return StreamBuilder<_Ligne?>(
      stream: _stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: snapshot.connectionState == ConnectionState.waiting
                  ? const CircularProgressIndicator()
                  : const Text('Personne introuvable'),
            ),
          );
        }

        final ligne = snapshot.data!;
        final p = ligne.personne;
        final l = ligne.logement;
        final aCode = l.code != null && l.code!.isNotEmpty;
        final aInfos =
            l.infoSuplementaire != null && l.infoSuplementaire!.isNotEmpty;
        final aCommentaire = p.commentaire != null && p.commentaire!.isNotEmpty;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Fiche personne'),
            actions: [
              IconButton(
                tooltip: 'Modifier',
                icon: const Icon(Icons.edit_outlined),
                onPressed: () => _modifier(ligne),
              ),
              IconButton(
                tooltip: 'Supprimer',
                icon: const Icon(Icons.delete_outline),
                onPressed: () => _supprimer(ligne),
              ),
            ],
          ),
          body: ColonneCentree(
            children: [
              EnteteDetail(
                avatar: CircleAvatar(
                  radius: 40,
                  backgroundColor: cs.primary,
                  foregroundColor: cs.onPrimary,
                  child: Text(
                    initialesDe(p.prenom, p.nom),
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                titre: '${p.prenom} ${p.nom}',
                sousTitre: formaterTel(p.numeroTel),
                badges: [
                  BadgePill(
                    icone: Icons.home_outlined,
                    texte: '${l.adresse} · porte ${l.porte}',
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SectionCard(
                titre: 'Coordonnées',
                children: [
                  InfoLigne(
                    icone: Icons.phone_outlined,
                    label: 'Téléphone',
                    valeur: formaterTel(p.numeroTel),
                    aCopier: p.numeroTel,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              SectionCard(
                titre: 'Logement',
                children: [
                  InfoLigne(
                    icone: Icons.home_outlined,
                    label: 'Adresse',
                    valeur: l.adresse,
                    aCopier: l.adresse,
                  ),
                  InfoLigne(
                    icone: Icons.door_front_door_outlined,
                    label: 'Porte',
                    valeur: l.porte,
                  ),
                  if (aCode)
                    InfoLigne(
                      icone: Icons.key_outlined,
                      label: 'Code',
                      valeur: l.code!,
                      aCopier: l.code,
                    ),
                  if (aInfos)
                    InfoLigne(
                      icone: Icons.info_outline,
                      label: 'Infos supplémentaires',
                      valeur: l.infoSuplementaire!,
                    ),
                ],
              ),
              const SizedBox(height: 12),
              SectionCard(
                titre: 'Commentaire',
                children: [
                  aCommentaire
                      ? SelectableText(
                    p.commentaire!,
                    style: Theme.of(context).textTheme.bodyLarge,
                  )
                      : const TexteMuet('Aucun commentaire'),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}