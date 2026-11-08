import 'package:flutter/material.dart';

import '../../core/router/sub_page_entry.dart';
import '../../data/bdd/database.dart' as bdd;
import '../../data/bdd/depots.dart';
import 'gabarits.dart';
import 'logement_edit_page.dart';
import 'widgets/bdd_widgets.dart';

enum _Tri { adresse, porte }

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
  // --- état des filtres
  String _recherche = '';
  bool _avecCode = false;
  bool _avecInfos = false;
  bool _sansPersonne = false;
  _Tri _tri = _Tri.adresse;

  // --- données (recréées à chaque changement de filtre)
  late Stream<List<LigneLogement>> _stream = _requete();

  Stream<List<LigneLogement>> _requete() => depotLogements.liste(
        recherche: _recherche,
        avecCode: _avecCode,
        avecInfos: _avecInfos,
        sansPersonne: _sansPersonne,
        triParPorte: _tri == _Tri.porte,
      );

  /// Modifie un filtre puis recharge la liste.
  void _changerFiltre(VoidCallback maj) {
    setState(() {
      maj();
      _stream = _requete();
    });
  }

  // --- actions

  void _ajouter() {
    Navigator.of(context).push(
      MaterialPageRoute<bdd.Logement>(
        builder: (_) => const LogementEditPage(),
      ),
    );
  }

  void _ouvrirFiche(LigneLogement ligne) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _LogementDetailPage(id: ligne.logement.idLogement),
      ),
    );
  }

  // --- affichage

  Widget _carte(LigneLogement ligne) {
    final cs = Theme.of(context).colorScheme;
    final l = ligne.logement;
    final nb = ligne.nbPersonnes;
    final aCode = l.code != null && l.code!.isNotEmpty;

    return CarteListe(
      onTap: () => _ouvrirFiche(ligne),
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
          LigneCompacte(icone: Icons.key_outlined, texte: 'Code : ${l.code}'),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: _badgeOccupants(nb),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageListe<LigneLogement>(
      stream: _stream,
      carte: _carte,
      hintRecherche: 'Adresse, porte, code, infos…',
      onRecherche: (v) => _changerFiltre(() => _recherche = v),
      iconeAjout: Icons.add_home_outlined,
      onAjouter: _ajouter,
      singulier: 'logement',
      pluriel: 'logements',
      iconeVide: Icons.home_work_outlined,
      titreVide: 'Aucun logement',
      filtres: [
        FilterChip(
          label: const Text('Avec code'),
          selected: _avecCode,
          onSelected: (v) => _changerFiltre(() => _avecCode = v),
        ),
        FilterChip(
          label: const Text('Avec infos'),
          selected: _avecInfos,
          onSelected: (v) => _changerFiltre(() => _avecInfos = v),
        ),
        FilterChip(
          label: const Text('Sans personne'),
          selected: _sansPersonne,
          onSelected: (v) => _changerFiltre(() => _sansPersonne = v),
        ),
        ChipTri<_Tri>(
          valeur: _tri,
          options: const {_Tri.adresse: 'adresse', _Tri.porte: 'porte'},
          onChange: (t) => _changerFiltre(() => _tri = t),
        ),
      ],
      filtresActifs: _avecCode || _avecInfos || _sansPersonne,
      onReinitialiser: () => _changerFiltre(() {
        _recherche = '';
        _avecCode = false;
        _avecInfos = false;
        _sansPersonne = false;
      }),
    );
  }
}

/// Pastille « 3 personnes » / « Aucune personne ».
Widget _badgeOccupants(int nb) => BadgePill(
      icone: Icons.person_outline,
      discret: nb == 0,
      texte: nb == 0 ? 'Aucune personne' : '$nb personne${nb > 1 ? 's' : ''}',
    );

// ======================================================================
// Fiche détaillée
// ======================================================================

class _LogementDetailPage extends StatelessWidget {
  const _LogementDetailPage({required this.id});

  final int id;

  void _modifier(BuildContext context, FicheLogement fiche) {
    Navigator.of(context).push(
      MaterialPageRoute<bdd.Logement>(
        builder: (_) => LogementEditPage(existant: fiche.logement),
      ),
    );
  }

  void _supprimer(BuildContext context, FicheLogement fiche) {
    final l = fiche.logement;
    supprimerAvecConfirmation(
      context,
      titre: 'Supprimer ce logement ?',
      message: '${l.adresse} (porte ${l.porte}) sera supprimé.',
      supprimer: () => depotLogements.supprimer(id),
      erreur:
          'Suppression impossible : ce logement est lié à des personnes ou des visites.',
    );
  }

  FicheContenu _contenu(BuildContext context, FicheLogement fiche) {
    final cs = Theme.of(context).colorScheme;
    final l = fiche.logement;
    final occupants = fiche.occupants;
    final nb = occupants.length;
    final aCode = l.code != null && l.code!.isNotEmpty;
    final aInfos =
        l.infoSuplementaire != null && l.infoSuplementaire!.isNotEmpty;

    return FicheContenu(
      avatar: CircleAvatar(
        radius: 40,
        backgroundColor: cs.primary,
        foregroundColor: cs.onPrimary,
        child: const Icon(Icons.home_outlined, size: 36),
      ),
      titre: l.adresse,
      sousTitre: 'Porte ${l.porte}',
      badges: [_badgeOccupants(nb)],
      sections: [
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageFiche<FicheLogement>(
      creerStream: () => depotLogements.fiche(id),
      introuvable: 'Logement introuvable',
      contenu: (fiche) => _contenu(context, fiche),
      onModifier: (fiche) => _modifier(context, fiche),
      onSupprimer: (fiche) => _supprimer(context, fiche),
    );
  }
}
