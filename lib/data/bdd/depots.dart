import 'package:drift/drift.dart';

import 'database.dart' as bdd;

// ======================================================================
// Modèles
// ======================================================================

class LignePersonne {
  const LignePersonne(this.personne, this.logement);
  final bdd.Personne personne;
  final bdd.Logement logement;
}

class LigneLogement {
  const LigneLogement(this.logement, this.nbPersonnes);
  final bdd.Logement logement;
  final int nbPersonnes;
}

/// Un logement avec la liste de ses occupants (pour la fiche).
class FicheLogement {
  const FicheLogement(this.logement, this.occupants);
  final bdd.Logement logement;
  final List<bdd.Personne> occupants;
}

// ======================================================================
// Helpers de filtrage
// ======================================================================

/// Chaque mot de [q] doit apparaître dans au moins une des [colonnes].
/// Retourne null si [q] est vide.
Expression<bool>? _tousLesMots(
  String q,
  List<GeneratedColumn<String>> colonnes,
) {
  Expression<bool>? res;
  for (final mot in q.trim().split(RegExp(r'\s+'))) {
    if (mot.isEmpty) continue;
    final m = '%$mot%';
    final unMot = colonnes.map((c) => c.like(m)).reduce((a, b) => a | b);
    res = res == null ? unMot : res & unMot;
  }
  return res;
}

Expression<bool> _nonVide(GeneratedColumn<String> c) =>
    c.isNotNull() & c.length.isBiggerThanValue(0);

/// Combine les filtres non nuls avec un ET. Retourne null s'il n'y en a aucun.
Expression<bool>? _et(List<Expression<bool>?> filtres) {
  final f = filtres.whereType<Expression<bool>>();
  return f.isEmpty ? null : f.reduce((a, b) => a & b);
}

// ======================================================================
// Personnes
// ======================================================================

class PersonneDepot {
  JoinedSelectStatement<HasResultSet, dynamic> _jointure() {
    final p = bdd.db.personnes;
    final l = bdd.db.logements;
    return bdd.db.select(p).join([
      innerJoin(l, l.idLogement.equalsExp(p.idLogement)),
    ]);
  }

  LignePersonne _lire(TypedResult r) => LignePersonne(
        r.readTable(bdd.db.personnes),
        r.readTable(bdd.db.logements),
      );

  Stream<List<LignePersonne>> liste({
    String recherche = '',
    int? idLogement,
    bool avecCommentaire = false,
    bool triParPrenom = false,
  }) {
    final p = bdd.db.personnes;
    final l = bdd.db.logements;

    final query = _jointure();
    final where = _et([
      _tousLesMots(recherche, [p.prenom, p.nom, p.numeroTel, l.adresse]),
      if (idLogement != null) p.idLogement.equals(idLogement),
      if (avecCommentaire) _nonVide(p.commentaire),
    ]);
    if (where != null) query.where(where);

    final (premier, second) =
        triParPrenom ? (p.prenom, p.nom) : (p.nom, p.prenom);
    query.orderBy([OrderingTerm.asc(premier), OrderingTerm.asc(second)]);

    return query.watch().map((rows) => rows.map(_lire).toList());
  }

  Stream<LignePersonne?> fiche(int id) {
    final query = _jointure()..where(bdd.db.personnes.idPersonne.equals(id));
    return query
        .watch()
        .map((rows) => rows.isEmpty ? null : _lire(rows.first));
  }

  Future<void> enregistrer({
    bdd.Personne? existant,
    required String prenom,
    required String nom,
    required String tel,
    required int idLogement,
    String? commentaire,
  }) async {
    final db = bdd.db;
    if (existant != null) {
      await (db.update(db.personnes)
            ..where((t) => t.idPersonne.equals(existant.idPersonne)))
          .write(
        bdd.PersonnesCompanion(
          prenom: Value(prenom),
          nom: Value(nom),
          numeroTel: Value(tel),
          idLogement: Value(idLogement),
          commentaire: Value(commentaire),
        ),
      );
    } else {
      await db.into(db.personnes).insert(
            bdd.PersonnesCompanion.insert(
              prenom: prenom,
              nom: nom,
              numeroTel: tel,
              idLogement: idLogement,
              commentaire: Value(commentaire),
            ),
          );
    }
  }

  Future<void> supprimer(int id) async {
    final db = bdd.db;
    await (db.delete(db.personnes)..where((t) => t.idPersonne.equals(id))).go();
  }
}

// ======================================================================
// Logements
// ======================================================================

class LogementDepot {
  /// Liste avec le nombre d'occupants.
  Stream<List<LigneLogement>> liste({
    String recherche = '',
    bool avecCode = false,
    bool avecInfos = false,
    bool sansPersonne = false,
    bool triParPorte = false,
  }) {
    final l = bdd.db.logements;
    final p = bdd.db.personnes;
    final nb = p.idPersonne.count();

    final query = bdd.db.select(l).join([
      leftOuterJoin(p, p.idLogement.equalsExp(l.idLogement)),
    ])
      ..addColumns([nb]);

    final where = _et([
      _tousLesMots(
          recherche, [l.adresse, l.porte, l.code, l.infoSuplementaire]),
      if (avecCode) _nonVide(l.code),
      if (avecInfos) _nonVide(l.infoSuplementaire),
    ]);
    if (where != null) query.where(where);

    query.groupBy([l.idLogement], having: sansPersonne ? nb.equals(0) : null);

    final (premier, second) =
        triParPorte ? (l.porte, l.adresse) : (l.adresse, l.porte);
    query.orderBy([OrderingTerm.asc(premier), OrderingTerm.asc(second)]);

    return query.watch().map(
          (rows) => [
            for (final r in rows) LigneLogement(r.readTable(l), r.read(nb) ?? 0),
          ],
        );
  }

  /// Liste simple pour le sélecteur de logement.
  Stream<List<bdd.Logement>> chercher(String recherche) {
    final l = bdd.db.logements;
    final query = bdd.db.select(l);
    final where = _tousLesMots(recherche, [l.adresse, l.porte, l.code]);
    if (where != null) query.where((_) => where);
    query.orderBy([
      (t) => OrderingTerm.asc(t.adresse),
      (t) => OrderingTerm.asc(t.porte),
    ]);
    return query.watch();
  }

  /// Fiche : le logement et ses occupants, dans un seul flux.
  Stream<FicheLogement?> fiche(int id) {
    final l = bdd.db.logements;
    final p = bdd.db.personnes;

    final query = bdd.db.select(l).join([
      leftOuterJoin(p, p.idLogement.equalsExp(l.idLogement)),
    ])
      ..where(l.idLogement.equals(id))
      ..orderBy([OrderingTerm.asc(p.nom), OrderingTerm.asc(p.prenom)]);

    return query.watch().map((rows) {
      if (rows.isEmpty) return null;
      return FicheLogement(
        rows.first.readTable(l),
        [for (final r in rows) r.readTableOrNull(p)].whereType<bdd.Personne>().toList(),
      );
    });
  }

  /// Crée ou met à jour, puis retourne le logement enregistré.
  Future<bdd.Logement> enregistrer({
    bdd.Logement? existant,
    required String adresse,
    required String porte,
    String? code,
    String? infos,
  }) async {
    final db = bdd.db;
    final int id;
    if (existant != null) {
      id = existant.idLogement;
      await (db.update(db.logements)..where((t) => t.idLogement.equals(id)))
          .write(
        bdd.LogementsCompanion(
          adresse: Value(adresse),
          porte: Value(porte),
          code: Value(code),
          infoSuplementaire: Value(infos),
        ),
      );
    } else {
      id = await db.into(db.logements).insert(
            bdd.LogementsCompanion.insert(
              adresse: adresse,
              porte: porte,
              code: Value(code),
              infoSuplementaire: Value(infos),
            ),
          );
    }
    return (db.select(db.logements)..where((t) => t.idLogement.equals(id)))
        .getSingle();
  }

  Future<void> supprimer(int id) async {
    final db = bdd.db;
    await (db.delete(db.logements)..where((t) => t.idLogement.equals(id))).go();
  }
}

// Instances utilisées par les pages.
final depotPersonnes = PersonneDepot();
final depotLogements = LogementDepot();
