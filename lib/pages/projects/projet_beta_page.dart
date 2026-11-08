import 'package:flutter/material.dart';

import '../../core/router/sub_page_entry.dart';
import '../../core/theme/tokens.dart';
import '../../core/widgets/page_container.dart';

/// SOUS-PAGE AUTOMATIQUE de Projets.
///
/// Elle fait DEUX choses :
///   1. `entry` : décrit sa carte dans la liste du parent (titre, sous-titre).
///   2. `build` : le contenu de la page quand on ouvre la carte.
///
/// Pour l'enregistrer : ajouter `ProjetBetaPage.entry` dans `_entries`
/// de pages/projects_page.dart.
class ProjetBetaPage extends StatelessWidget {
  const ProjetBetaPage({super.key});

  /// Infos de la carte affichée dans la page parente (Projets).
  static const entry = SubPageEntry(
    id: 'beta', //          adresse : /projets/beta (unique, sans espace)
    title: 'Projet Beta', //      titre de la carte
    subtitle: 'Site web portfolio.', //   sous-titre de la carte
    builder: ProjetBetaPage.new, //  construit cette page
  );

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return PageContainer(
      children: [
        Text('Projet Beta', style: text.headlineLarge),
        const SizedBox(height: AppSizes.s3),
        Text('Description détaillée du projet Beta.', style: text.bodyLarge),
      ],
    );
  }
}
