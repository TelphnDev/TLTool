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
/// Pour l'enregistrer : ajouter `ProjetAlphaPage.entry` dans `_entries`
/// de pages/projects_page.dart.
class ProjetAlphaPage extends StatelessWidget {
  const ProjetAlphaPage({super.key});

  /// Infos de la carte affichée dans la page parente (Projets).
  static const entry = SubPageEntry(
    id: 'alpha', //          adresse : /projets/alpha (unique, sans espace)
    title: 'Projet Alpha', //      titre de la carte
    subtitle: 'Application mobile de suivi.', //   sous-titre de la carte
    builder: ProjetAlphaPage.new, //  construit cette page
  );

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return PageContainer(
      children: [
        Text('Projet Alpha', style: text.headlineLarge),
        const SizedBox(height: AppSizes.s3),
        Text('Description détaillée du projet Alpha.', style: text.bodyLarge),
      ],
    );
  }
}
