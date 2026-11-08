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
    required this.subtitle,
    required this.builder,
  });

  /// Identifiant unique, utilisé dans l'adresse (/projets/<id>).
  /// Sans espaces ni accents, et différent pour chaque enfant.
  final String id;

  /// Titre de la carte dans la page parente.
  final String title;

  /// Sous-titre de la carte dans la page parente.
  final String subtitle;

  /// Fonction qui construit la page enfant.
  /// `MaPage.new` signifie « appelle le constructeur de MaPage ».
  final Widget Function() builder;
}
