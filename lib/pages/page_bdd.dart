import 'package:flutter/material.dart';

import '../core/router/app_route.dart';
import '../core/router/sub_page_entry.dart';
import '../core/widgets/sub_pages_view.dart';
import 'bdd/personne.dart';
import 'bdd/logement.dart';

/// /bdd      -> liste de cartes
/// /bdd/:id  -> sous-page correspondante
///
/// AJOUTER UNE SOUS-PAGE :
///   1. Crée pages/bdd/xxx.dart avec un `static final entry`.
///   2. Importe-la ci-dessus et ajoute `Xxx.entry,` dans `_entries`.
class BddPage extends StatelessWidget {
  const BddPage({super.key, this.id});

  final String? id;

  static final _entries = <SubPageEntry>[
    Personne.entry,
    Logement.entry
  ];

  @override
  Widget build(BuildContext context) => SubPagesView(
    id: id,
    entries: _entries,
    onOpen: (context, id) =>
        AppRoute.bddDetail.go(context, params: {'id': id}),
    onBack: (context) => AppRoute.bdd.go(context),
  );
}