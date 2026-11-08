import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ═════════════════════════════════════════════════════════════════════
//  STYLES DE HEADER / FOOTER
//  Chaque route choisit le sien (voir `header:` et `footer:` plus bas).
//  Ajouter un style = une valeur ici + un case dans app_shell.dart
//  (le `switch` exhaustif refuse de compiler si tu oublies).
// ═════════════════════════════════════════════════════════════════════

/// Quel header afficher en haut de la page.
enum HeaderStyle {
  none, //     aucun header (page plein écran)
  standard, // titre + bouton retour (si sous-page) + réglages + thème
  minimal, //  titre + bouton retour (si sous-page), sans actions
}

/// Quel footer afficher en bas de la page.
enum FooterStyle {
  none, //       aucun footer
  navigation, // barre de navigation
  simple, //     petite bande de texte, sans navigation
}

// ═════════════════════════════════════════════════════════════════════
//  REGISTRE DES PAGES
//
//  Le router ne décrit que la STRUCTURE : où on va et comment les pages
//  sont liées. Ce qui est AFFICHÉ (textes, icônes, onglets) est décidé
//  par le header et le footer eux-mêmes.
//
//  CHAMPS
//  ┌─────────────┬─────────────┬───────────────────────────────────────┐
//  │ path        │ OBLIGATOIRE │ adresse interne ('/projets').         │
//  │             │             │ '/projets/:id' = adresse avec un      │
//  │             │             │ paramètre (:id) rempli à la volée.    │
//  │ title       │ OBLIGATOIRE │ nom de la page. Valeur de base que le │
//  │             │             │ header/footer peuvent utiliser,       │
//  │             │             │ modifier ou ignorer.                  │
//  │ header      │ facultatif  │ style du header (défaut: standard).   │
//  │ footer      │ facultatif  │ style du footer (défaut: navigation). │
//  │ parent      │ facultatif  │ renseigné = SOUS-PAGE (bouton retour  │
//  │             │             │ vers le parent, onglet parent actif). │
//  └─────────────┴─────────────┴───────────────────────────────────────┘
//
//  AJOUTER UNE PAGE :
//    1. une entrée ici
//    2. un fichier dans lib/pages/
//    3. un `case` dans le switch de app_router.dart
//    4. (si elle doit avoir un onglet) l'ajouter dans footer.dart
// ═════════════════════════════════════════════════════════════════════
enum AppRoute {
  home(path: '/', title: 'Accueil'),

  // /projets      -> liste de cartes
  // /projets/:id  -> UNE seule route pour TOUS les projets enfants
  projects(path: '/projets', title: 'Projets'),
  projectDetail(path: '/projets/:id', title: 'Projet', parent: projects),

  // Stages : chaque sous-page a SA propre route, écrite à la main.
  internships(path: '/stages', title: 'Stages et alternance'),
  internshipA(
    path: '/stages/entreprise-a',
    title: 'Entreprise A',
    parent: internships,
  ),
  internshipB(
    path: '/stages/entreprise-b',
    title: 'Entreprise B',
    parent: internships,
  ),

  // Plein écran : ni header ni footer.
  about(
    path: '/a-propos',
    title: 'À propos',
    header: HeaderStyle.none,
    footer: FooterStyle.none,
  ),

  // Header minimal + footer simple.
  settings(
    path: '/reglages',
    title: 'Réglages',
    header: HeaderStyle.minimal,
    footer: FooterStyle.simple,
    parent: home,
  ),
  // /bdd      -> liste de cartes
  // /bdd/:id  -> UNE seule route pour TOUTES les sous-pages
  bdd(path: '/bdd', title: 'Données'),
  bddDetail(path: '/bdd/:id', title: 'Donnée', parent: bdd);

  const AppRoute({
    required this.path,
    required this.title,
    this.header = HeaderStyle.standard,
    this.footer = FooterStyle.navigation,
    this.parent,
  });

  final String path;
  final String title;
  final HeaderStyle header;
  final FooterStyle footer;
  final AppRoute? parent; // non null = sous-page

  /// Page racine de la hiérarchie (projectDetail -> projects).
  AppRoute get root => parent?.root ?? this;

  /// Navigation sûre (jamais d'adresse écrite à la main) :
  ///   AppRoute.projects.go(context);
  ///   AppRoute.projectDetail.go(context, params: {'id': 'alpha'});
  void go(BuildContext context, {Map<String, String> params = const {}}) =>
      context.goNamed(name, pathParameters: params);
}
