import 'package:drift/drift.dart' hide Column, Table;
import 'package:flutter/material.dart';

import '../../core/router/sub_page_entry.dart';
import '../../core/widgets/page_container.dart';
import '../../data/bdd/database.dart' as bdd;
import 'logement_edit_page.dart';
import 'widgets/bdd_widgets.dart';

enum _Tri { adresse, porte }

class _Ligne {
  const _Ligne(this.logement, this.nbPersonnes);
  final bdd.Logement logement;
  final int nbPersonnes;
}

// ======================================================================
// Liste
// ======================================================================

class Logement extends StatefulWidget {
  const Logement({super.key});

  static final entry = SubPageEntry(
    id: 'logement',
    title: 'Logements',
    builder: () => const Logement(),
  );

  @override
  State<Logement> createState() => _LogementState();
}

class _LogementState extends State<Logement> {
  final _searchCtrl = TextEditingController();

  String _recherche = '';
  bool _avecCode = false;
  bool _avecInfos = false;
  bool _sansPersonne = false;
  _Tri _tri = _Tri.adresse;

  late Stream<List<_Ligne>> _stream = _buildStream();

  @override
  void dispose() {
    _searchCtrl.dispose();
    super.dispose();
  }

  Stream<List<_Ligne>> _buildStream() {
    final l = bdd.db.logements;
    final p = bdd.db.personnes;
    final nb = p.idPersonne.count();

    final query = bdd.db.select(l).join([
      leftOuterJoin(p, p.idLogement.equalsExp(l.idLogement)),
    ])
      ..addColumns([nb]);

    Expression<bool>? where;
    void et(Expression<bool> e) => where = where == null ? e : where! & e;

    final q = _recherche.trim();
    if (q.isNotEmpty) {
      for (final mot in q.split(RegExp(r'\s+'))) {
        final m = '%$mot%';
        et(l.adresse.like(m) |
        l.porte.like(m) |
        l.code.like(m) |
        l.infoSuplementaire.like(m));
      }
    }
    if (_avecCode) {
      et(l.code.isNotNull() & l.code.length.isBiggerThanValue(0));
    }
    if (_avecInfos) {
      et(l.infoSuplementaire.isNotNull() &
      l.infoSuplementaire.length.isBiggerThanValue(0));
    }
    if (where != null) query.where(where!);

    query.groupBy(
      [l.idLogement],
      having: _sansPersonne ? nb.equals(0) : null,
    );

    final premier = _tri == _Tri.adresse ? l.adresse : l.porte;
    final second = _tri == _Tri.adresse ? l.porte : l.adresse;
    query.orderBy([
      OrderingTerm(expression: premier, mode: OrderingMode.asc),
      OrderingTerm(expression: second, mode: OrderingMode.asc),
    ]);

    return query.watch().map(
          (rows) => [
        for (final r in rows) _Ligne(r.readTable(l), r.read(nb) ?? 0),
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
      (_avecCode ? 1 : 0) + (_avecInfos ? 1 : 0) + (_sansPersonne ? 1 : 0);

  void _reinitialiserFiltres() {
    _searchCtrl.clear();
    _rafraichir(() {
      _recherche = '';
      _avecCode = false;
      _avecInfos = false;
      _sansPersonne = false;
    });
  }

  void _ajouter() {
    Navigator.of(context).push(
      MaterialPageRoute<bdd.Logement>(
        builder: (_) => const LogementEditPage(),
      ),
    );
  }

  void _ouvrirFiche(_Ligne ligne) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _LogementDetailPage(id: ligne.logement.idLogement),
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
                hintText: 'Adresse, porte, code, infos…',
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
              icon: const Icon(Icons.add_home_outlined),
              label: const Text('Ajouter'),
            ),
          ],
        ),
        const SizedBox(height: 12),

        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              FilterChip(
                label: const Text('Avec code'),
                selected: _avecCode,
                onSelected: (v) => _rafraichir(() => _avecCode = v),
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('Avec infos'),
                selected: _avecInfos,
                onSelected: (v) => _rafraichir(() => _avecInfos = v),
              ),
              const SizedBox(width: 8),
              FilterChip(
                label: const Text('Sans personne'),
                selected: _sansPersonne,
                onSelected: (v) => _rafraichir(() => _sansPersonne = v),
              ),
              const SizedBox(width: 8),
              PopupMenuButton<_Tri>(
                tooltip: 'Trier par',
                initialValue: _tri,
                onSelected: (t) => _rafraichir(() => _tri = t),
                itemBuilder: (_) => const [
                  PopupMenuItem(
                      value: _Tri.adresse, child: Text('Trier par adresse')),
                  PopupMenuItem(
                      value: _Tri.porte, child: Text('Trier par porte')),
                ],
                child: Chip(
                  avatar: const Icon(Icons.sort, size: 18),
                  label: Text(
                    _tri == _Tri.adresse ? 'Tri : adresse' : 'Tri : porte',
                  ),
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
                icone: filtre ? Icons.search_off : Icons.home_work_outlined,
                titre: filtre ? 'Aucun résultat' : 'Aucun logement',
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
                    '${lignes.length} logement${lignes.length > 1 ? 's' : ''}',
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
                    final l = lignes[i].logement;
                    final nb = lignes[i].nbPersonnes;
                    final aCode = l.code != null && l.code!.isNotEmpty;
                    return CarteListe(
                      onTap: () => _ouvrirFiche(lignes[i]),
                      leading: CircleAvatar(
                        radius: 24,
                        backgroundColor: cs.primaryContainer,
                        foregroundColor: cs.onPrimaryContainer,
                        child: const Icon(Icons.home_outlined),
                      ),
                      children: [
                        Text(
                          l.adresse,
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        LigneCompacte(
                          icone: Icons.door_front_door_outlined,
                          texte: 'Porte ${l.porte}',
                        ),
                        if (aCode)
                          LigneCompacte(
                            icone: Icons.key_outlined,
                            texte: 'Code : ${l.code}',
                          ),
                        const SizedBox(height: 8),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: BadgePill(
                            icone: Icons.person_outline,
                            discret: nb == 0,
                            texte: nb == 0
                                ? 'Aucune personne'
                                : '$nb personne${nb > 1 ? 's' : ''}',
                          ),
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

class _LogementDetailPage extends StatefulWidget {
  const _LogementDetailPage({required this.id});

  final int id;

  @override
  State<_LogementDetailPage> createState() => _LogementDetailPageState();
}

class _LogementDetailPageState extends State<_LogementDetailPage> {
  late final Stream<bdd.Logement?> _logementStream =
  (bdd.db.select(bdd.db.logements)
    ..where((t) => t.idLogement.equals(widget.id)))
      .watchSingleOrNull();

  late final Stream<List<bdd.Personne>> _occupantsStream =
  (bdd.db.select(bdd.db.personnes)
    ..where((t) => t.idLogement.equals(widget.id))
    ..orderBy([
          (t) => OrderingTerm.asc(t.nom),
          (t) => OrderingTerm.asc(t.prenom),
    ]))
      .watch();

  void _modifier(bdd.Logement l) {
    Navigator.of(context).push(
      MaterialPageRoute<bdd.Logement>(
        builder: (_) => LogementEditPage(existant: l),
      ),
    );
  }

  Future<void> _supprimer(bdd.Logement l) async {
    final ok = await confirmer(
      context,
      titre: 'Supprimer ce logement ?',
      message: '${l.adresse} (porte ${l.porte}) sera supprimé.',
    );
    if (!ok || !mounted) return;

    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);
    try {
      await (bdd.db.delete(bdd.db.logements)
        ..where((t) => t.idLogement.equals(widget.id)))
          .go();
      navigator.pop();
    } catch (_) {
      messenger.showSnackBar(
        const SnackBar(
          content: Text(
            'Suppression impossible : ce logement est lié à des personnes ou des visites.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return StreamBuilder<bdd.Logement?>(
      stream: _logementStream,
      builder: (context, snapLogement) {
        if (!snapLogement.hasData) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: snapLogement.connectionState == ConnectionState.waiting
                  ? const CircularProgressIndicator()
                  : const Text('Logement introuvable'),
            ),
          );
        }
        final l = snapLogement.data!;
        final aCode = l.code != null && l.code!.isNotEmpty;
        final aInfos =
            l.infoSuplementaire != null && l.infoSuplementaire!.isNotEmpty;

        return StreamBuilder<List<bdd.Personne>>(
          stream: _occupantsStream,
          builder: (context, snapOccupants) {
            final occupants = snapOccupants.data ?? const <bdd.Personne>[];
            final nb = occupants.length;

            return Scaffold(
              appBar: AppBar(
                title: const Text('Fiche logement'),
                actions: [
                  IconButton(
                    tooltip: 'Modifier',
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () => _modifier(l),
                  ),
                  IconButton(
                    tooltip: 'Supprimer',
                    icon: const Icon(Icons.delete_outline),
                    onPressed: () => _supprimer(l),
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
                      child: const Icon(Icons.home_outlined, size: 36),
                    ),
                    titre: l.adresse,
                    sousTitre: 'Porte ${l.porte}',
                    badges: [
                      BadgePill(
                        icone: Icons.person_outline,
                        discret: nb == 0,
                        texte: nb == 0
                            ? 'Aucune personne'
                            : '$nb personne${nb > 1 ? 's' : ''}',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SectionCard(
                    titre: 'Accès',
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
                        )
                      else
                        const Padding(
                          padding: EdgeInsets.only(top: 6),
                          child: TexteMuet('Aucun code renseigné'),
                        ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SectionCard(
                    titre: 'Informations',
                    children: [
                      aInfos
                          ? SelectableText(
                        l.infoSuplementaire!,
                        style: Theme.of(context).textTheme.bodyLarge,
                      )
                          : const TexteMuet('Aucune information supplémentaire'),
                    ],
                  ),
                  const SizedBox(height: 12),
                  SectionCard(
                    titre: 'Occupants ($nb)',
                    children: [
                      if (occupants.isEmpty)
                        const TexteMuet('Aucune personne rattachée')
                      else
                        for (final p in occupants)
                          ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: CircleAvatar(
                              backgroundColor: cs.primaryContainer,
                              foregroundColor: cs.onPrimaryContainer,
                              child: Text(initialesDe(p.prenom, p.nom)),
                            ),
                            title: Text('${p.prenom} ${p.nom}'),
                            subtitle: Text(formaterTel(p.numeroTel)),
                          ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}