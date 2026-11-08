// ======================================================================
// GABARITS : les 3 « modèles » de page de l'application.
//
//   PageListe<T>     → liste avec recherche, filtres, bouton Ajouter
//   PageFiche<T>     → fiche détaillée (bandeau + sections)
//   PageFormulaire   → formulaire (bandeau + sections + bouton Enregistrer)
//
// Une vraie page (personne.dart, logement.dart…) ne fait que remplir un
// gabarit : elle décrit CE QU'ELLE AFFICHE, pas COMMENT c'est mis en page.
// ======================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../core/widgets/page_container.dart';
import 'widgets/bdd_widgets.dart';

// ======================================================================
// PageListe
// ======================================================================

/// Liste avec barre de recherche, puces de filtre et bouton « Ajouter ».
///
/// La page garde l'état des filtres et fournit le [stream] à jour.
/// Le gabarit gère : champ de recherche, chargement, erreur, liste vide,
/// compteur et bouton « Réinitialiser ».
class PageListe<T> extends StatefulWidget {
  const PageListe({
    super.key,
    required this.stream,
    required this.carte,
    required this.hintRecherche,
    required this.onRecherche,
    required this.iconeAjout,
    required this.onAjouter,
    required this.singulier,
    required this.pluriel,
    required this.iconeVide,
    required this.titreVide,
    this.filtres = const [],
    this.filtresActifs = false,
    this.onReinitialiser,
  });

  /// Données à afficher (à recréer quand un filtre change).
  final Stream<List<T>> stream;

  /// Construit la carte d'un élément.
  final Widget Function(T element) carte;

  final String hintRecherche;

  /// Appelé à chaque frappe dans la recherche.
  final ValueChanged<String> onRecherche;

  final IconData iconeAjout;
  final VoidCallback onAjouter;

  /// Pour le compteur : « 1 personne » / « 3 personnes ».
  final String singulier;
  final String pluriel;

  /// Affichés quand il n'y a aucune donnée : « Aucune personne ».
  final IconData iconeVide;
  final String titreVide;

  /// Puces affichées sous la recherche (FilterChip, ChipTri…).
  final List<Widget> filtres;

  /// true si au moins un filtre (hors recherche) est actif.
  final bool filtresActifs;

  /// Appelé par « Réinitialiser » : la page remet ses filtres à zéro.
  /// (La recherche est vidée automatiquement par le gabarit.)
  final VoidCallback? onReinitialiser;

  @override
  State<PageListe<T>> createState() => _PageListeState<T>();
}

class _PageListeState<T> extends State<PageListe<T>> {
  final _ctrl = TextEditingController();
  String _recherche = '';

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  void _changer(String v) {
    setState(() => _recherche = v);
    widget.onRecherche(v);
  }

  void _reinitialiser() {
    _ctrl.clear();
    setState(() => _recherche = '');
    widget.onReinitialiser?.call();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final filtreActif = _recherche.isNotEmpty || widget.filtresActifs;

    return PageContainer(
      children: [
        // --- recherche + Ajouter
        Row(
          children: [
            Expanded(
              child: SearchBar(
                controller: _ctrl,
                hintText: widget.hintRecherche,
                leading: const Icon(Icons.search),
                elevation: const WidgetStatePropertyAll(0),
                trailing: [
                  if (_recherche.isNotEmpty)
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () {
                        _ctrl.clear();
                        _changer('');
                      },
                    ),
                ],
                onChanged: _changer,
              ),
            ),
            const SizedBox(width: 12),
            FilledButton.icon(
              onPressed: widget.onAjouter,
              icon: Icon(widget.iconeAjout),
              label: const Text('Ajouter'),
            ),
          ],
        ),
        const SizedBox(height: 12),

        // --- puces de filtre
        if (widget.filtres.isNotEmpty || filtreActif)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (final f in widget.filtres)
                  Padding(padding: const EdgeInsets.only(right: 8), child: f),
                if (filtreActif)
                  ActionChip(
                    avatar: const Icon(Icons.filter_alt_off, size: 18),
                    label: const Text('Réinitialiser'),
                    onPressed: _reinitialiser,
                  ),
              ],
            ),
          ),
        const SizedBox(height: 16),

        // --- résultats
        StreamBuilder<List<T>>(
          stream: widget.stream,
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

            final elements = snapshot.data!;
            if (elements.isEmpty) {
              return EtatVide(
                icone: filtreActif ? Icons.search_off : widget.iconeVide,
                titre: filtreActif ? 'Aucun résultat' : widget.titreVide,
                message: filtreActif
                    ? 'Essaie de modifier ta recherche ou tes filtres.'
                    : 'Utilise le bouton « Ajouter » pour commencer.',
              );
            }

            final n = elements.length;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 4, bottom: 8),
                  child: Text(
                    '$n ${n > 1 ? widget.pluriel : widget.singulier}',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge
                        ?.copyWith(color: cs.onSurfaceVariant),
                  ),
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: n,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (_, i) => widget.carte(elements[i]),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

/// Puce « Tri : nom » avec menu. [options] : valeur → libellé court.
///
///   ChipTri<_Tri>(
///     valeur: _tri,
///     options: {_Tri.nom: 'nom', _Tri.prenom: 'prénom'},
///     onChange: (t) => _rafraichir(() => _tri = t),
///   )
class ChipTri<E> extends StatelessWidget {
  const ChipTri({
    super.key,
    required this.valeur,
    required this.options,
    required this.onChange,
  });

  final E valeur;
  final Map<E, String> options;
  final ValueChanged<E> onChange;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<E>(
      tooltip: 'Trier par',
      initialValue: valeur,
      onSelected: onChange,
      itemBuilder: (_) => [
        for (final o in options.entries)
          PopupMenuItem<E>(value: o.key, child: Text('Trier par ${o.value}')),
      ],
      child: Chip(
        avatar: const Icon(Icons.sort, size: 18),
        label: Text('Tri : ${options[valeur]}'),
      ),
    );
  }
}

// ======================================================================
// PageFiche
// ======================================================================

/// Ce que la page veut afficher dans la fiche.
class FicheContenu {
  const FicheContenu({
    required this.avatar,
    required this.titre,
    required this.sections,
    this.sousTitre,
    this.badges = const [],
  });

  final Widget avatar;
  final String titre;
  final String? sousTitre;
  final List<Widget> badges;

  /// Les SectionCard sous le bandeau (l'espacement est géré par le gabarit).
  final List<Widget> sections;
}

/// Fiche détaillée : bandeau avec retour / modifier / supprimer + sections.
/// Gère le chargement et le cas « introuvable ».
class PageFiche<T> extends StatefulWidget {
  const PageFiche({
    super.key,
    required this.creerStream,
    required this.introuvable,
    required this.contenu,
    required this.onModifier,
    required this.onSupprimer,
  });

  /// Appelé une seule fois pour ouvrir le flux de données.
  final Stream<T?> Function() creerStream;

  /// Message si la donnée n'existe plus (« Personne introuvable »).
  final String introuvable;

  final FicheContenu Function(T donnee) contenu;
  final void Function(T donnee) onModifier;
  final void Function(T donnee) onSupprimer;

  @override
  State<PageFiche<T>> createState() => _PageFicheState<T>();
}

class _PageFicheState<T> extends State<PageFiche<T>> {
  late final Stream<T?> _stream = widget.creerStream();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<T?>(
      stream: _stream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
            ),
            body: Center(
              child: snapshot.connectionState == ConnectionState.waiting
                  ? const CircularProgressIndicator()
                  : Text(widget.introuvable),
            ),
          );
        }

        final donnee = snapshot.data!;
        final c = widget.contenu(donnee);

        return Scaffold(
          body: ColonneCentree(
            children: [
              EnteteDetail(
                onRetour: () => Navigator.of(context).maybePop(),
                actions: [
                  BoutonRond(
                    icone: Icons.edit_outlined,
                    tooltip: 'Modifier',
                    onPressed: () => widget.onModifier(donnee),
                  ),
                  BoutonRond(
                    icone: Icons.delete_outline,
                    tooltip: 'Supprimer',
                    danger: true,
                    onPressed: () => widget.onSupprimer(donnee),
                  ),
                ],
                avatar: c.avatar,
                titre: c.titre,
                sousTitre: c.sousTitre,
                badges: c.badges,
              ),
              for (final section in c.sections) ...[
                const SizedBox(height: 12),
                section,
              ],
            ],
          ),
        );
      },
    );
  }
}

/// Confirmation → suppression → retour à la liste (ou message d'erreur).
Future<void> supprimerAvecConfirmation(
  BuildContext context, {
  required String titre,
  required String message,
  required Future<void> Function() supprimer,
  required String erreur,
}) async {
  final ok = await confirmer(context, titre: titre, message: message);
  if (!ok || !context.mounted) return;

  final navigator = Navigator.of(context);
  final messenger = ScaffoldMessenger.of(context);
  try {
    await supprimer();
    navigator.pop();
  } catch (_) {
    messenger.showSnackBar(SnackBar(content: Text(erreur)));
  }
}

// ======================================================================
// PageFormulaire
// ======================================================================

/// Formulaire : bandeau + sections + bouton Enregistrer.
///
/// Le gabarit valide les champs, affiche le chargement et les erreurs.
/// [onEnregistrer] n'a qu'à écrire en base puis fermer la page.
class PageFormulaire extends StatefulWidget {
  const PageFormulaire({
    super.key,
    required this.titre,
    required this.icone,
    required this.sections,
    required this.libelleBouton,
    required this.onEnregistrer,
  });

  final String titre;
  final IconData icone;
  final List<Widget> sections;
  final String libelleBouton;
  final Future<void> Function() onEnregistrer;

  @override
  State<PageFormulaire> createState() => _PageFormulaireState();
}

class _PageFormulaireState extends State<PageFormulaire> {
  final _formKey = GlobalKey<FormState>();
  bool _enCours = false;

  Future<void> _valider() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _enCours = true);
    try {
      await widget.onEnregistrer();
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Enregistrement impossible : $e')),
        );
      }
    }
    if (mounted) setState(() => _enCours = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ColonneCentree(
          children: [
            EnteteFormulaire(titre: widget.titre, icone: widget.icone),
            const SizedBox(height: 16),
            for (final section in widget.sections) ...[
              section,
              const SizedBox(height: 12),
            ],
            const SizedBox(height: 8),
            FilledButton.icon(
              onPressed: _enCours ? null : _valider,
              icon: _enCours
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.check),
              label: Text(widget.libelleBouton),
            ),
          ],
        ),
      ),
    );
  }
}

/// Champ de formulaire standard (remplace TextFormField + InputDecoration).
///
///   ChampTexte(controller: _adresse, label: 'Adresse',
///              icone: Icons.home_outlined, obligatoire: true, maxLength: 150)
class ChampTexte extends StatelessWidget {
  const ChampTexte({
    super.key,
    required this.controller,
    required this.label,
    this.icone,
    this.obligatoire = false,
    this.maxLength,
    this.lignes = 1,
    this.capitalisation = TextCapitalization.none,
    this.clavier,
    this.formatters = const [],
    this.validator,
  });

  final TextEditingController controller;
  final String label;
  final IconData? icone;

  /// Affiche « Champ obligatoire » si vide (ignoré si [validator] est fourni).
  final bool obligatoire;
  final int? maxLength;

  /// > 1 : champ multiligne.
  final int lignes;
  final TextCapitalization capitalisation;
  final TextInputType? clavier;
  final List<TextInputFormatter> formatters;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: lignes,
      keyboardType: clavier,
      textCapitalization: capitalisation,
      inputFormatters: [
        if (maxLength != null) LengthLimitingTextInputFormatter(maxLength),
        ...formatters,
      ],
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: icone == null ? null : Icon(icone),
        alignLabelWithHint: lignes > 1,
        border: const OutlineInputBorder(),
      ),
      validator: validator ?? (obligatoire ? champObligatoire : null),
    );
  }
}
