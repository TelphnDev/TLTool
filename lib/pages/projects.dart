import 'package:flutter/material.dart';

import '../core/router/app_route.dart';
import '../core/router/sub_page_entry.dart';
import '../core/theme/tokens.dart';
import '../core/widgets/info_card.dart';
import '../core/widgets/page_container.dart';
import 'projects/projet_beta_page.dart';
import 'projects/projet_gamma_page.dart';

/// PAGE PARENTE AUTOMATIQUE — toute la logique est dans ce fichier.
///
/// Cette même page est utilisée par DEUX routes (voir app_router.dart) :
///
///   /projets        -> id == null -> affiche la LISTE de cartes
///   /projets/alpha  -> id == 'alpha' -> affiche la sous-page "alpha"
///
/// Comment la liste est construite :
///   1. `_entries` liste les pages enfants (une ligne par enfant).
///   2. Chaque enfant a un `entry` (SubPageEntry) qui donne titre/sous-titre.
///   3. Le parent fabrique une carte par entrée, sans connaître les textes.
///   4. Un clic sur une carte navigue vers /projets/id.
///
/// AJOUTER UN PROJET :
///   1. Crée pages/projects/projet_xxx_page.dart (copie un existant).
///   2. Change son `entry` (id unique, title, subtitle) et son contenu.
///   3. Importe-le ci-dessus et ajoute `ProjetXxxPage.entry,` dans `_entries`.
///   Rien d'autre : ni route, ni AppRoute, ni switch à modifier.
class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key, this.id});

  /// Identifiant de la sous-page à afficher (null = afficher la liste).
  final String? id;

  /// Liste des enfants. L'ordre ici = l'ordre des cartes à l'écran.
  static const _entries = <SubPageEntry>[
    ProjetBetaPage.entry,
    ProjetGammaPage.entry,
  ];

  @override
  Widget build(BuildContext context) {
    // Pas d'id : on est sur /projets -> la liste.
    if (id == null) return _buildList(context);

    // Un id : on cherche l'enfant correspondant et on le construit.
    for (final e in _entries) {
      if (e.id == id) return e.builder();
    }

    // Id inconnu (ex: /projets/nimportequoi).
    return _buildNotFound(context);
  }

  /// La liste : une carte par entrée de `_entries`.
  Widget _buildList(BuildContext context) {
    return PageContainer(
      children: [
        for (final e in _entries) ...[
          InfoCard(
            title: e.title, //       <- vient de l'enfant
            subtitle: e.subtitle, // <- vient de l'enfant
            // Va vers /projets/<id> (route AppRoute.projectDetail).
            onTap: () => AppRoute.projectDetail.go(context, params: {'id': e.id}),
          ),
          const SizedBox(height: AppSizes.s3),
        ],
      ],
    );
  }

  /// Affichée si l'id demandé n'existe pas dans `_entries`.
  Widget _buildNotFound(BuildContext context) {
    return PageContainer(
      children: [
        Text('Projet introuvable', style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: AppSizes.s4),
        FilledButton(
          onPressed: () => AppRoute.projects.go(context),
          child: const Text('Retour aux projets'),
        ),
      ],
    );
  }
}
