import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'database.g.dart';

@DataClassName('Logement')
class Logements extends Table {
  IntColumn get idLogement => integer().autoIncrement()();
  TextColumn get adresse => text().withLength(max: 150)();
  TextColumn get porte => text().withLength(max: 50)();
  TextColumn get code => text().withLength(max: 50).nullable()();
  TextColumn get infoSuplementaire => text().nullable()();
}

@DataClassName('ParametreAnalyse')
class ParametreAnalyses extends Table {
  IntColumn get idParametreAnalyse => integer().autoIncrement()();
  TextColumn get nom => text().withLength(max: 50)();
  TextColumn get description => text().withLength(max: 50).nullable()();
  TextColumn get unite => text().withLength(max: 50)();
  TextColumn get categorie => text().withLength(max: 50)();
  TextColumn get periodiciteMois => text().withLength(max: 50).nullable()();
}

@DataClassName('Visite')
class Visites extends Table {
  IntColumn get idVisite => integer().autoIncrement()();
  TextColumn get status => text().withLength(max: 500)();
  BoolColumn get present => boolean()();
  TextColumn get commentaire => text().nullable()();
  TextColumn get resultat => text().withLength(max: 50)();
  BoolColumn get travaille => boolean()();
  DateTimeColumn get date => dateTime().named('date_')();
  IntColumn get dureeMinutes => integer()();
  IntColumn get valeur => integer()();
  IntColumn get idLogement =>
      integer().references(Logements, #idLogement)();
}

@DataClassName('Contenue')
class Contenues extends Table {
  IntColumn get idContenue => integer().autoIncrement()();
  TextColumn get type => text().withLength(max: 10)();
  TextColumn get path => text()();
}

@DataClassName('EtatLieux')
class EtatLieuxs extends Table {
  IntColumn get idEtatParametre => integer().autoIncrement()();
  TextColumn get resultat => text().withLength(max: 50)();
  IntColumn get valeur => integer()();
  DateTimeColumn get date => dateTime().named('date_')();
  IntColumn get idVisite => integer().references(Visites, #idVisite)();
  IntColumn get idLogement =>
      integer().references(Logements, #idLogement)();
}

@DataClassName('Personne')
class Personnes extends Table {
  IntColumn get idPersonne => integer().autoIncrement()();
  TextColumn get numeroTel => text().withLength(max: 10)();
  TextColumn get prenom => text().withLength(max: 50)();
  TextColumn get nom => text().withLength(max: 50)();
  TextColumn get commentaire => text().nullable()();
  IntColumn get idLogement =>
      integer().references(Logements, #idLogement)();
}

@DataClassName('OrdreVisite')
class OrdreVisites extends Table {
  IntColumn get idOrdreVisite => integer().autoIncrement()();
  IntColumn get idPersonne =>
      integer().references(Personnes, #idPersonne)();
  IntColumn get idLogement =>
      integer().references(Logements, #idLogement)();
}

@DataClassName('ContenuSource')
class ContenuSources extends Table {
  IntColumn get idContenue =>
      integer().references(Contenues, #idContenue)();
  IntColumn get idEtatParametre =>
      integer().references(EtatLieuxs, #idEtatParametre)();

  @override
  Set<Column> get primaryKey => {idContenue, idEtatParametre};
}

@DataClassName('VerifEtat')
class VerifEtats extends Table {
  IntColumn get idParametreAnalyse =>
      integer().references(ParametreAnalyses, #idParametreAnalyse)();
  IntColumn get idEtatParametre =>
      integer().references(EtatLieuxs, #idEtatParametre)();
  TextColumn get resultat => text().withLength(max: 50)();
  IntColumn get valeur => integer()();
  TextColumn get commentaire => text().nullable()();

  @override
  Set<Column> get primaryKey => {idParametreAnalyse, idEtatParametre};
}

@DataClassName('ResultatVisite')
class Resultats extends Table {
  IntColumn get idPersonne =>
      integer().references(Personnes, #idPersonne)();
  IntColumn get idVisite => integer().references(Visites, #idVisite)();

  @override
  Set<Column> get primaryKey => {idPersonne, idVisite};
}

@DriftDatabase(tables: [
  Logements,
  ParametreAnalyses,
  Visites,
  Contenues,
  EtatLieuxs,
  Personnes,
  OrdreVisites,
  ContenuSources,
  VerifEtats,
  Resultats,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'tl_tool_db'));

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    beforeOpen: (details) async {
      // SQLite n'applique pas les clés étrangères par défaut
      await customStatement('PRAGMA foreign_keys = ON');
    },
  );
}

/// Instance unique de la base, utilisable partout via cet import.
final db = AppDatabase();