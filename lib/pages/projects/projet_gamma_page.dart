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
/// Pour l'enregistrer : ajouter `ProjetGammaPage.entry` dans `_entries`
/// de pages/projects_page.dart.
class ProjetGammaPage extends StatelessWidget {
  const ProjetGammaPage({super.key});

  /// Infos de la carte affichée dans la page parente (Projets).
  static const entry = SubPageEntry(
    id: 'gamma', //          adresse : /projets/gamma (unique, sans espace)
    title: 'Projet Gamma', //      titre de la carte
    subtitle: 'Bot Discord.', //   sous-titre de la carte
    builder: ProjetGammaPage.new, //  construit cette page
  );

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return PageContainer(
      children: [
        Text('Projet Gamma', style: text.headlineLarge),
        const SizedBox(height: AppSizes.s3),
        Text('Description détaillée du projet Gamma.', style: text.bodyLarge),
      ],
    );
  }
}
