import 'package:flutter/widgets.dart';

/// Carte d'identité d'une sous-page AUTOMATIQUE.
///
/// Principe : c'est la page ENFANT qui décrit comment elle apparaît dans la
/// liste du parent. Le parent ne connaît pas les textes : il parcourt une
/// liste de SubPageEntry et fabrique une carte par entrée.
///
///   page enfant  --(définit)-->  SubPageEntry  --(lue par)-->  page parent
///
/// Exemple (dans le fichier de la page enfant) :
///   static const entry = SubPageEntry(
///     id: 'alpha',                // adresse : /projets/alpha
///     title: 'Projet Alpha',      // titre de la carte
///     subtitle: 'Une appli.',     // sous-titre de la carte
///     builder: ProjetAlphaPage.new, // comment construire la page
///   );
class SubPageEntry {
  const SubPageEntry({
    required this.id,
    required this.title,
    this.subtitle, // facultatif : pas de description si null
    required this.builder,
  });

  final String id;
  final String title;
  final String? subtitle;

  /// Fonction qui construit la page enfant.
  /// `MaPage.new` signifie « appelle le constructeur de MaPage ».
  final Widget Function() builder;
}
