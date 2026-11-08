import 'package:flutter/material.dart';

import '../../core/router/sub_page_entry.dart';
import '../../data/bdd/database.dart' as bdd;
import '../../data/bdd/depots.dart';
import 'gabarits.dart';
import 'personne_edit_page.dart';
import 'widgets/bdd_widgets.dart';
import 'widgets/selecteur_logement.dart';

enum _Tri { nom, prenom }

// ======================================================================
// Liste
// ======================================================================

class Personne extends StatefulWidget {
  const Personne({super.key});

  static final entry = SubPageEntry(
    id: 'personne',
    title: 'Personnes',
    builder: () => const Personne(),
  );

  @override
  State<Personne> createState() => _PersonneState();
}

class _PersonneState extends State<Personne> {
  // --- état des filtres
  String _recherche = '';
  bdd.Logement? _logementFiltre;
  bool _avecCommentaire = false;
  _Tri _tri = _Tri.nom;

  // --- données (recréées à chaque changement de filtre)
  late Stream<List<LignePersonne>> _stream = _requete();

  Stream<List<LignePersonne>> _requete() => depotPersonnes.liste(
        recherche: _recherche,
        idLogement: _logementFiltre?.idLogement,
        avecCommentaire: _avecCommentaire,
        triParPrenom: _tri == _Tri.prenom,
      );

  /// Modifie un filtre puis recharge la liste.
  void _changerFiltre(VoidCallback maj) {
    setState(() {
      maj();
      _stream = _requete();
    });
  }

  // --- actions

  Future<void> _choisirLogement() async {
    final l = await choisirLogement(
      context,
      selectionId: _logementFiltre?.idLogement,
      permettreCreation: false,
    );
    if (l != null) _changerFiltre(() => _logementFiltre = l);
  }

  void _ajouter() {
    Navigator.of(context).push(
      MaterialPageRoute<bool>(
        builder: (_) => PersonneEditPage(logement: _logementFiltre),
      ),
    );
  }

  void _ouvrirFiche(LignePersonne ligne) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => _PersonneDetailPage(id: ligne.personne.idPersonne),
      ),
    );
  }

  // --- affichage

  Widget _chipLogement() {
    final l = _logementFiltre;
    if (l == null) {
      return ActionChip(
        avatar: const Icon(Icons.home_outlined, size: 18),
        label: const Text('Logement'),
        onPressed: _choisirLogement,
      );
    }
    return InputChip(
      avatar: const Icon(Icons.home_outlined, size: 18),
      label: Text('${l.adresse} · ${l.porte}'),
      selected: true,
      onPressed: _choisirLogement,
      onDeleted: () => _changerFiltre(() => _logementFiltre = null),
    );
  }

  Widget _carte(LignePersonne ligne) {
    final cs = Theme.of(context).colorScheme;
    final p = ligne.personne;
    final l = ligne.logement;

    return CarteListe(
      onTap: () => _ouvrirFiche(ligne),
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
  }

  @override
  Widget build(BuildContext context) {
    return PageListe<LignePersonne>(
      stream: _stream,
      carte: _carte,
      hintRecherche: 'Nom, prénom, téléphone, adresse…',
      onRecherche: (v) => _changerFiltre(() => _recherche = v),
      iconeAjout: Icons.person_add_alt_1,
      onAjouter: _ajouter,
      singulier: 'personne',
      pluriel: 'personnes',
      iconeVide: Icons.groups_outlined,
      titreVide: 'Aucune personne',
      filtres: [
        _chipLogement(),
        FilterChip(
          label: const Text('Avec commentaire'),
          selected: _avecCommentaire,
          onSelected: (v) => _changerFiltre(() => _avecCommentaire = v),
        ),
        ChipTri<_Tri>(
          valeur: _tri,
          options: const {_Tri.nom: 'nom', _Tri.prenom: 'prénom'},
          onChange: (t) => _changerFiltre(() => _tri = t),
        ),
      ],
      filtresActifs: _logementFiltre != null || _avecCommentaire,
      onReinitialiser: () => _changerFiltre(() {
        _recherche = '';
        _logementFiltre = null;
        _avecCommentaire = false;
      }),
    );
  }
}

// ======================================================================
// Fiche détaillée
// ======================================================================

class _PersonneDetailPage extends StatelessWidget {
  const _PersonneDetailPage({required this.id});

  final int id;

  void _modifier(BuildContext context, LignePersonne ligne) {
    Navigator.of(context).push(
      MaterialPageRoute<bool>(
        builder: (_) => PersonneEditPage(
          personne: ligne.personne,
          logement: ligne.logement,
        ),
      ),
    );
  }

  void _supprimer(BuildContext context, LignePersonne ligne) {
    supprimerAvecConfirmation(
      context,
      titre: 'Supprimer cette personne ?',
      message: '${ligne.personne.prenom} ${ligne.personne.nom} sera supprimé(e).',
      supprimer: () => depotPersonnes.supprimer(id),
      erreur: 'Suppression impossible : cette personne est liée à des visites.',
    );
  }

  FicheContenu _contenu(BuildContext context, LignePersonne ligne) {
    final cs = Theme.of(context).colorScheme;
    final p = ligne.personne;
    final l = ligne.logement;
    final aCode = l.code != null && l.code!.isNotEmpty;
    final aInfos =
        l.infoSuplementaire != null && l.infoSuplementaire!.isNotEmpty;
    final aCommentaire = p.commentaire != null && p.commentaire!.isNotEmpty;

    return FicheContenu(
      avatar: CircleAvatar(
        radius: 40,
        backgroundColor: cs.primary,
        foregroundColor: cs.onPrimary,
        child: Text(
          initialesDe(p.prenom, p.nom),
          style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w600),
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
      sections: [
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageFiche<LignePersonne>(
      creerStream: () => depotPersonnes.fiche(id),
      introuvable: 'Personne introuvable',
      contenu: (ligne) => _contenu(context, ligne),
      onModifier: (ligne) => _modifier(context, ligne),
      onSupprimer: (ligne) => _supprimer(context, ligne),
    );
  }
}
