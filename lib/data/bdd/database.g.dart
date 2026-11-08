// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $LogementsTable extends Logements
    with TableInfo<$LogementsTable, Logement> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LogementsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idLogementMeta = const VerificationMeta(
    'idLogement',
  );
  @override
  late final GeneratedColumn<int> idLogement = GeneratedColumn<int>(
    'id_logement',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _adresseMeta = const VerificationMeta(
    'adresse',
  );
  @override
  late final GeneratedColumn<String> adresse = GeneratedColumn<String>(
    'adresse',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 150),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _porteMeta = const VerificationMeta('porte');
  @override
  late final GeneratedColumn<String> porte = GeneratedColumn<String>(
    'porte',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
    'code',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _infoSuplementaireMeta = const VerificationMeta(
    'infoSuplementaire',
  );
  @override
  late final GeneratedColumn<String> infoSuplementaire =
      GeneratedColumn<String>(
        'info_suplementaire',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  @override
  List<GeneratedColumn> get $columns => [
    idLogement,
    adresse,
    porte,
    code,
    infoSuplementaire,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'logements';
  @override
  VerificationContext validateIntegrity(
    Insertable<Logement> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_logement')) {
      context.handle(
        _idLogementMeta,
        idLogement.isAcceptableOrUnknown(data['id_logement']!, _idLogementMeta),
      );
    }
    if (data.containsKey('adresse')) {
      context.handle(
        _adresseMeta,
        adresse.isAcceptableOrUnknown(data['adresse']!, _adresseMeta),
      );
    } else if (isInserting) {
      context.missing(_adresseMeta);
    }
    if (data.containsKey('porte')) {
      context.handle(
        _porteMeta,
        porte.isAcceptableOrUnknown(data['porte']!, _porteMeta),
      );
    } else if (isInserting) {
      context.missing(_porteMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
        _codeMeta,
        code.isAcceptableOrUnknown(data['code']!, _codeMeta),
      );
    }
    if (data.containsKey('info_suplementaire')) {
      context.handle(
        _infoSuplementaireMeta,
        infoSuplementaire.isAcceptableOrUnknown(
          data['info_suplementaire']!,
          _infoSuplementaireMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idLogement};
  @override
  Logement map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Logement(
      idLogement: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_logement'],
      )!,
      adresse: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}adresse'],
      )!,
      porte: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}porte'],
      )!,
      code: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}code'],
      ),
      infoSuplementaire: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}info_suplementaire'],
      ),
    );
  }

  @override
  $LogementsTable createAlias(String alias) {
    return $LogementsTable(attachedDatabase, alias);
  }
}

class Logement extends DataClass implements Insertable<Logement> {
  final int idLogement;
  final String adresse;
  final String porte;
  final String? code;
  final String? infoSuplementaire;
  const Logement({
    required this.idLogement,
    required this.adresse,
    required this.porte,
    this.code,
    this.infoSuplementaire,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_logement'] = Variable<int>(idLogement);
    map['adresse'] = Variable<String>(adresse);
    map['porte'] = Variable<String>(porte);
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || infoSuplementaire != null) {
      map['info_suplementaire'] = Variable<String>(infoSuplementaire);
    }
    return map;
  }

  LogementsCompanion toCompanion(bool nullToAbsent) {
    return LogementsCompanion(
      idLogement: Value(idLogement),
      adresse: Value(adresse),
      porte: Value(porte),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      infoSuplementaire: infoSuplementaire == null && nullToAbsent
          ? const Value.absent()
          : Value(infoSuplementaire),
    );
  }

  factory Logement.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Logement(
      idLogement: serializer.fromJson<int>(json['idLogement']),
      adresse: serializer.fromJson<String>(json['adresse']),
      porte: serializer.fromJson<String>(json['porte']),
      code: serializer.fromJson<String?>(json['code']),
      infoSuplementaire: serializer.fromJson<String?>(
        json['infoSuplementaire'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idLogement': serializer.toJson<int>(idLogement),
      'adresse': serializer.toJson<String>(adresse),
      'porte': serializer.toJson<String>(porte),
      'code': serializer.toJson<String?>(code),
      'infoSuplementaire': serializer.toJson<String?>(infoSuplementaire),
    };
  }

  Logement copyWith({
    int? idLogement,
    String? adresse,
    String? porte,
    Value<String?> code = const Value.absent(),
    Value<String?> infoSuplementaire = const Value.absent(),
  }) => Logement(
    idLogement: idLogement ?? this.idLogement,
    adresse: adresse ?? this.adresse,
    porte: porte ?? this.porte,
    code: code.present ? code.value : this.code,
    infoSuplementaire: infoSuplementaire.present
        ? infoSuplementaire.value
        : this.infoSuplementaire,
  );
  Logement copyWithCompanion(LogementsCompanion data) {
    return Logement(
      idLogement: data.idLogement.present
          ? data.idLogement.value
          : this.idLogement,
      adresse: data.adresse.present ? data.adresse.value : this.adresse,
      porte: data.porte.present ? data.porte.value : this.porte,
      code: data.code.present ? data.code.value : this.code,
      infoSuplementaire: data.infoSuplementaire.present
          ? data.infoSuplementaire.value
          : this.infoSuplementaire,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Logement(')
          ..write('idLogement: $idLogement, ')
          ..write('adresse: $adresse, ')
          ..write('porte: $porte, ')
          ..write('code: $code, ')
          ..write('infoSuplementaire: $infoSuplementaire')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idLogement, adresse, porte, code, infoSuplementaire);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Logement &&
          other.idLogement == this.idLogement &&
          other.adresse == this.adresse &&
          other.porte == this.porte &&
          other.code == this.code &&
          other.infoSuplementaire == this.infoSuplementaire);
}

class LogementsCompanion extends UpdateCompanion<Logement> {
  final Value<int> idLogement;
  final Value<String> adresse;
  final Value<String> porte;
  final Value<String?> code;
  final Value<String?> infoSuplementaire;
  const LogementsCompanion({
    this.idLogement = const Value.absent(),
    this.adresse = const Value.absent(),
    this.porte = const Value.absent(),
    this.code = const Value.absent(),
    this.infoSuplementaire = const Value.absent(),
  });
  LogementsCompanion.insert({
    this.idLogement = const Value.absent(),
    required String adresse,
    required String porte,
    this.code = const Value.absent(),
    this.infoSuplementaire = const Value.absent(),
  }) : adresse = Value(adresse),
       porte = Value(porte);
  static Insertable<Logement> custom({
    Expression<int>? idLogement,
    Expression<String>? adresse,
    Expression<String>? porte,
    Expression<String>? code,
    Expression<String>? infoSuplementaire,
  }) {
    return RawValuesInsertable({
      if (idLogement != null) 'id_logement': idLogement,
      if (adresse != null) 'adresse': adresse,
      if (porte != null) 'porte': porte,
      if (code != null) 'code': code,
      if (infoSuplementaire != null) 'info_suplementaire': infoSuplementaire,
    });
  }

  LogementsCompanion copyWith({
    Value<int>? idLogement,
    Value<String>? adresse,
    Value<String>? porte,
    Value<String?>? code,
    Value<String?>? infoSuplementaire,
  }) {
    return LogementsCompanion(
      idLogement: idLogement ?? this.idLogement,
      adresse: adresse ?? this.adresse,
      porte: porte ?? this.porte,
      code: code ?? this.code,
      infoSuplementaire: infoSuplementaire ?? this.infoSuplementaire,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idLogement.present) {
      map['id_logement'] = Variable<int>(idLogement.value);
    }
    if (adresse.present) {
      map['adresse'] = Variable<String>(adresse.value);
    }
    if (porte.present) {
      map['porte'] = Variable<String>(porte.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (infoSuplementaire.present) {
      map['info_suplementaire'] = Variable<String>(infoSuplementaire.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LogementsCompanion(')
          ..write('idLogement: $idLogement, ')
          ..write('adresse: $adresse, ')
          ..write('porte: $porte, ')
          ..write('code: $code, ')
          ..write('infoSuplementaire: $infoSuplementaire')
          ..write(')'))
        .toString();
  }
}

class $ParametreAnalysesTable extends ParametreAnalyses
    with TableInfo<$ParametreAnalysesTable, ParametreAnalyse> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ParametreAnalysesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idParametreAnalyseMeta =
      const VerificationMeta('idParametreAnalyse');
  @override
  late final GeneratedColumn<int> idParametreAnalyse = GeneratedColumn<int>(
    'id_parametre_analyse',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nomMeta = const VerificationMeta('nom');
  @override
  late final GeneratedColumn<String> nom = GeneratedColumn<String>(
    'nom',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _uniteMeta = const VerificationMeta('unite');
  @override
  late final GeneratedColumn<String> unite = GeneratedColumn<String>(
    'unite',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categorieMeta = const VerificationMeta(
    'categorie',
  );
  @override
  late final GeneratedColumn<String> categorie = GeneratedColumn<String>(
    'categorie',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _periodiciteMoisMeta = const VerificationMeta(
    'periodiciteMois',
  );
  @override
  late final GeneratedColumn<String> periodiciteMois = GeneratedColumn<String>(
    'periodicite_mois',
    aliasedName,
    true,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idParametreAnalyse,
    nom,
    description,
    unite,
    categorie,
    periodiciteMois,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'parametre_analyses';
  @override
  VerificationContext validateIntegrity(
    Insertable<ParametreAnalyse> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_parametre_analyse')) {
      context.handle(
        _idParametreAnalyseMeta,
        idParametreAnalyse.isAcceptableOrUnknown(
          data['id_parametre_analyse']!,
          _idParametreAnalyseMeta,
        ),
      );
    }
    if (data.containsKey('nom')) {
      context.handle(
        _nomMeta,
        nom.isAcceptableOrUnknown(data['nom']!, _nomMeta),
      );
    } else if (isInserting) {
      context.missing(_nomMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('unite')) {
      context.handle(
        _uniteMeta,
        unite.isAcceptableOrUnknown(data['unite']!, _uniteMeta),
      );
    } else if (isInserting) {
      context.missing(_uniteMeta);
    }
    if (data.containsKey('categorie')) {
      context.handle(
        _categorieMeta,
        categorie.isAcceptableOrUnknown(data['categorie']!, _categorieMeta),
      );
    } else if (isInserting) {
      context.missing(_categorieMeta);
    }
    if (data.containsKey('periodicite_mois')) {
      context.handle(
        _periodiciteMoisMeta,
        periodiciteMois.isAcceptableOrUnknown(
          data['periodicite_mois']!,
          _periodiciteMoisMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idParametreAnalyse};
  @override
  ParametreAnalyse map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ParametreAnalyse(
      idParametreAnalyse: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_parametre_analyse'],
      )!,
      nom: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nom'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      unite: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unite'],
      )!,
      categorie: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}categorie'],
      )!,
      periodiciteMois: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}periodicite_mois'],
      ),
    );
  }

  @override
  $ParametreAnalysesTable createAlias(String alias) {
    return $ParametreAnalysesTable(attachedDatabase, alias);
  }
}

class ParametreAnalyse extends DataClass
    implements Insertable<ParametreAnalyse> {
  final int idParametreAnalyse;
  final String nom;
  final String? description;
  final String unite;
  final String categorie;
  final String? periodiciteMois;
  const ParametreAnalyse({
    required this.idParametreAnalyse,
    required this.nom,
    this.description,
    required this.unite,
    required this.categorie,
    this.periodiciteMois,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_parametre_analyse'] = Variable<int>(idParametreAnalyse);
    map['nom'] = Variable<String>(nom);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['unite'] = Variable<String>(unite);
    map['categorie'] = Variable<String>(categorie);
    if (!nullToAbsent || periodiciteMois != null) {
      map['periodicite_mois'] = Variable<String>(periodiciteMois);
    }
    return map;
  }

  ParametreAnalysesCompanion toCompanion(bool nullToAbsent) {
    return ParametreAnalysesCompanion(
      idParametreAnalyse: Value(idParametreAnalyse),
      nom: Value(nom),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      unite: Value(unite),
      categorie: Value(categorie),
      periodiciteMois: periodiciteMois == null && nullToAbsent
          ? const Value.absent()
          : Value(periodiciteMois),
    );
  }

  factory ParametreAnalyse.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ParametreAnalyse(
      idParametreAnalyse: serializer.fromJson<int>(json['idParametreAnalyse']),
      nom: serializer.fromJson<String>(json['nom']),
      description: serializer.fromJson<String?>(json['description']),
      unite: serializer.fromJson<String>(json['unite']),
      categorie: serializer.fromJson<String>(json['categorie']),
      periodiciteMois: serializer.fromJson<String?>(json['periodiciteMois']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idParametreAnalyse': serializer.toJson<int>(idParametreAnalyse),
      'nom': serializer.toJson<String>(nom),
      'description': serializer.toJson<String?>(description),
      'unite': serializer.toJson<String>(unite),
      'categorie': serializer.toJson<String>(categorie),
      'periodiciteMois': serializer.toJson<String?>(periodiciteMois),
    };
  }

  ParametreAnalyse copyWith({
    int? idParametreAnalyse,
    String? nom,
    Value<String?> description = const Value.absent(),
    String? unite,
    String? categorie,
    Value<String?> periodiciteMois = const Value.absent(),
  }) => ParametreAnalyse(
    idParametreAnalyse: idParametreAnalyse ?? this.idParametreAnalyse,
    nom: nom ?? this.nom,
    description: description.present ? description.value : this.description,
    unite: unite ?? this.unite,
    categorie: categorie ?? this.categorie,
    periodiciteMois: periodiciteMois.present
        ? periodiciteMois.value
        : this.periodiciteMois,
  );
  ParametreAnalyse copyWithCompanion(ParametreAnalysesCompanion data) {
    return ParametreAnalyse(
      idParametreAnalyse: data.idParametreAnalyse.present
          ? data.idParametreAnalyse.value
          : this.idParametreAnalyse,
      nom: data.nom.present ? data.nom.value : this.nom,
      description: data.description.present
          ? data.description.value
          : this.description,
      unite: data.unite.present ? data.unite.value : this.unite,
      categorie: data.categorie.present ? data.categorie.value : this.categorie,
      periodiciteMois: data.periodiciteMois.present
          ? data.periodiciteMois.value
          : this.periodiciteMois,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ParametreAnalyse(')
          ..write('idParametreAnalyse: $idParametreAnalyse, ')
          ..write('nom: $nom, ')
          ..write('description: $description, ')
          ..write('unite: $unite, ')
          ..write('categorie: $categorie, ')
          ..write('periodiciteMois: $periodiciteMois')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idParametreAnalyse,
    nom,
    description,
    unite,
    categorie,
    periodiciteMois,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ParametreAnalyse &&
          other.idParametreAnalyse == this.idParametreAnalyse &&
          other.nom == this.nom &&
          other.description == this.description &&
          other.unite == this.unite &&
          other.categorie == this.categorie &&
          other.periodiciteMois == this.periodiciteMois);
}

class ParametreAnalysesCompanion extends UpdateCompanion<ParametreAnalyse> {
  final Value<int> idParametreAnalyse;
  final Value<String> nom;
  final Value<String?> description;
  final Value<String> unite;
  final Value<String> categorie;
  final Value<String?> periodiciteMois;
  const ParametreAnalysesCompanion({
    this.idParametreAnalyse = const Value.absent(),
    this.nom = const Value.absent(),
    this.description = const Value.absent(),
    this.unite = const Value.absent(),
    this.categorie = const Value.absent(),
    this.periodiciteMois = const Value.absent(),
  });
  ParametreAnalysesCompanion.insert({
    this.idParametreAnalyse = const Value.absent(),
    required String nom,
    this.description = const Value.absent(),
    required String unite,
    required String categorie,
    this.periodiciteMois = const Value.absent(),
  }) : nom = Value(nom),
       unite = Value(unite),
       categorie = Value(categorie);
  static Insertable<ParametreAnalyse> custom({
    Expression<int>? idParametreAnalyse,
    Expression<String>? nom,
    Expression<String>? description,
    Expression<String>? unite,
    Expression<String>? categorie,
    Expression<String>? periodiciteMois,
  }) {
    return RawValuesInsertable({
      if (idParametreAnalyse != null)
        'id_parametre_analyse': idParametreAnalyse,
      if (nom != null) 'nom': nom,
      if (description != null) 'description': description,
      if (unite != null) 'unite': unite,
      if (categorie != null) 'categorie': categorie,
      if (periodiciteMois != null) 'periodicite_mois': periodiciteMois,
    });
  }

  ParametreAnalysesCompanion copyWith({
    Value<int>? idParametreAnalyse,
    Value<String>? nom,
    Value<String?>? description,
    Value<String>? unite,
    Value<String>? categorie,
    Value<String?>? periodiciteMois,
  }) {
    return ParametreAnalysesCompanion(
      idParametreAnalyse: idParametreAnalyse ?? this.idParametreAnalyse,
      nom: nom ?? this.nom,
      description: description ?? this.description,
      unite: unite ?? this.unite,
      categorie: categorie ?? this.categorie,
      periodiciteMois: periodiciteMois ?? this.periodiciteMois,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idParametreAnalyse.present) {
      map['id_parametre_analyse'] = Variable<int>(idParametreAnalyse.value);
    }
    if (nom.present) {
      map['nom'] = Variable<String>(nom.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (unite.present) {
      map['unite'] = Variable<String>(unite.value);
    }
    if (categorie.present) {
      map['categorie'] = Variable<String>(categorie.value);
    }
    if (periodiciteMois.present) {
      map['periodicite_mois'] = Variable<String>(periodiciteMois.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ParametreAnalysesCompanion(')
          ..write('idParametreAnalyse: $idParametreAnalyse, ')
          ..write('nom: $nom, ')
          ..write('description: $description, ')
          ..write('unite: $unite, ')
          ..write('categorie: $categorie, ')
          ..write('periodiciteMois: $periodiciteMois')
          ..write(')'))
        .toString();
  }
}

class $VisitesTable extends Visites with TableInfo<$VisitesTable, Visite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VisitesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idVisiteMeta = const VerificationMeta(
    'idVisite',
  );
  @override
  late final GeneratedColumn<int> idVisite = GeneratedColumn<int>(
    'id_visite',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 500),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _presentMeta = const VerificationMeta(
    'present',
  );
  @override
  late final GeneratedColumn<bool> present = GeneratedColumn<bool>(
    'present',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("present" IN (0, 1))',
    ),
  );
  static const VerificationMeta _commentaireMeta = const VerificationMeta(
    'commentaire',
  );
  @override
  late final GeneratedColumn<String> commentaire = GeneratedColumn<String>(
    'commentaire',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _resultatMeta = const VerificationMeta(
    'resultat',
  );
  @override
  late final GeneratedColumn<String> resultat = GeneratedColumn<String>(
    'resultat',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _travailleMeta = const VerificationMeta(
    'travaille',
  );
  @override
  late final GeneratedColumn<bool> travaille = GeneratedColumn<bool>(
    'travaille',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("travaille" IN (0, 1))',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date_',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dureeMinutesMeta = const VerificationMeta(
    'dureeMinutes',
  );
  @override
  late final GeneratedColumn<int> dureeMinutes = GeneratedColumn<int>(
    'duree_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valeurMeta = const VerificationMeta('valeur');
  @override
  late final GeneratedColumn<int> valeur = GeneratedColumn<int>(
    'valeur',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idLogementMeta = const VerificationMeta(
    'idLogement',
  );
  @override
  late final GeneratedColumn<int> idLogement = GeneratedColumn<int>(
    'id_logement',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES logements (id_logement)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idVisite,
    status,
    present,
    commentaire,
    resultat,
    travaille,
    date,
    dureeMinutes,
    valeur,
    idLogement,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'visites';
  @override
  VerificationContext validateIntegrity(
    Insertable<Visite> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_visite')) {
      context.handle(
        _idVisiteMeta,
        idVisite.isAcceptableOrUnknown(data['id_visite']!, _idVisiteMeta),
      );
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    } else if (isInserting) {
      context.missing(_statusMeta);
    }
    if (data.containsKey('present')) {
      context.handle(
        _presentMeta,
        present.isAcceptableOrUnknown(data['present']!, _presentMeta),
      );
    } else if (isInserting) {
      context.missing(_presentMeta);
    }
    if (data.containsKey('commentaire')) {
      context.handle(
        _commentaireMeta,
        commentaire.isAcceptableOrUnknown(
          data['commentaire']!,
          _commentaireMeta,
        ),
      );
    }
    if (data.containsKey('resultat')) {
      context.handle(
        _resultatMeta,
        resultat.isAcceptableOrUnknown(data['resultat']!, _resultatMeta),
      );
    } else if (isInserting) {
      context.missing(_resultatMeta);
    }
    if (data.containsKey('travaille')) {
      context.handle(
        _travailleMeta,
        travaille.isAcceptableOrUnknown(data['travaille']!, _travailleMeta),
      );
    } else if (isInserting) {
      context.missing(_travailleMeta);
    }
    if (data.containsKey('date_')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date_']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('duree_minutes')) {
      context.handle(
        _dureeMinutesMeta,
        dureeMinutes.isAcceptableOrUnknown(
          data['duree_minutes']!,
          _dureeMinutesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_dureeMinutesMeta);
    }
    if (data.containsKey('valeur')) {
      context.handle(
        _valeurMeta,
        valeur.isAcceptableOrUnknown(data['valeur']!, _valeurMeta),
      );
    } else if (isInserting) {
      context.missing(_valeurMeta);
    }
    if (data.containsKey('id_logement')) {
      context.handle(
        _idLogementMeta,
        idLogement.isAcceptableOrUnknown(data['id_logement']!, _idLogementMeta),
      );
    } else if (isInserting) {
      context.missing(_idLogementMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idVisite};
  @override
  Visite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Visite(
      idVisite: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_visite'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      present: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}present'],
      )!,
      commentaire: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}commentaire'],
      ),
      resultat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resultat'],
      )!,
      travaille: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}travaille'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_'],
      )!,
      dureeMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duree_minutes'],
      )!,
      valeur: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}valeur'],
      )!,
      idLogement: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_logement'],
      )!,
    );
  }

  @override
  $VisitesTable createAlias(String alias) {
    return $VisitesTable(attachedDatabase, alias);
  }
}

class Visite extends DataClass implements Insertable<Visite> {
  final int idVisite;
  final String status;
  final bool present;
  final String? commentaire;
  final String resultat;
  final bool travaille;
  final DateTime date;
  final int dureeMinutes;
  final int valeur;
  final int idLogement;
  const Visite({
    required this.idVisite,
    required this.status,
    required this.present,
    this.commentaire,
    required this.resultat,
    required this.travaille,
    required this.date,
    required this.dureeMinutes,
    required this.valeur,
    required this.idLogement,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_visite'] = Variable<int>(idVisite);
    map['status'] = Variable<String>(status);
    map['present'] = Variable<bool>(present);
    if (!nullToAbsent || commentaire != null) {
      map['commentaire'] = Variable<String>(commentaire);
    }
    map['resultat'] = Variable<String>(resultat);
    map['travaille'] = Variable<bool>(travaille);
    map['date_'] = Variable<DateTime>(date);
    map['duree_minutes'] = Variable<int>(dureeMinutes);
    map['valeur'] = Variable<int>(valeur);
    map['id_logement'] = Variable<int>(idLogement);
    return map;
  }

  VisitesCompanion toCompanion(bool nullToAbsent) {
    return VisitesCompanion(
      idVisite: Value(idVisite),
      status: Value(status),
      present: Value(present),
      commentaire: commentaire == null && nullToAbsent
          ? const Value.absent()
          : Value(commentaire),
      resultat: Value(resultat),
      travaille: Value(travaille),
      date: Value(date),
      dureeMinutes: Value(dureeMinutes),
      valeur: Value(valeur),
      idLogement: Value(idLogement),
    );
  }

  factory Visite.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Visite(
      idVisite: serializer.fromJson<int>(json['idVisite']),
      status: serializer.fromJson<String>(json['status']),
      present: serializer.fromJson<bool>(json['present']),
      commentaire: serializer.fromJson<String?>(json['commentaire']),
      resultat: serializer.fromJson<String>(json['resultat']),
      travaille: serializer.fromJson<bool>(json['travaille']),
      date: serializer.fromJson<DateTime>(json['date']),
      dureeMinutes: serializer.fromJson<int>(json['dureeMinutes']),
      valeur: serializer.fromJson<int>(json['valeur']),
      idLogement: serializer.fromJson<int>(json['idLogement']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idVisite': serializer.toJson<int>(idVisite),
      'status': serializer.toJson<String>(status),
      'present': serializer.toJson<bool>(present),
      'commentaire': serializer.toJson<String?>(commentaire),
      'resultat': serializer.toJson<String>(resultat),
      'travaille': serializer.toJson<bool>(travaille),
      'date': serializer.toJson<DateTime>(date),
      'dureeMinutes': serializer.toJson<int>(dureeMinutes),
      'valeur': serializer.toJson<int>(valeur),
      'idLogement': serializer.toJson<int>(idLogement),
    };
  }

  Visite copyWith({
    int? idVisite,
    String? status,
    bool? present,
    Value<String?> commentaire = const Value.absent(),
    String? resultat,
    bool? travaille,
    DateTime? date,
    int? dureeMinutes,
    int? valeur,
    int? idLogement,
  }) => Visite(
    idVisite: idVisite ?? this.idVisite,
    status: status ?? this.status,
    present: present ?? this.present,
    commentaire: commentaire.present ? commentaire.value : this.commentaire,
    resultat: resultat ?? this.resultat,
    travaille: travaille ?? this.travaille,
    date: date ?? this.date,
    dureeMinutes: dureeMinutes ?? this.dureeMinutes,
    valeur: valeur ?? this.valeur,
    idLogement: idLogement ?? this.idLogement,
  );
  Visite copyWithCompanion(VisitesCompanion data) {
    return Visite(
      idVisite: data.idVisite.present ? data.idVisite.value : this.idVisite,
      status: data.status.present ? data.status.value : this.status,
      present: data.present.present ? data.present.value : this.present,
      commentaire: data.commentaire.present
          ? data.commentaire.value
          : this.commentaire,
      resultat: data.resultat.present ? data.resultat.value : this.resultat,
      travaille: data.travaille.present ? data.travaille.value : this.travaille,
      date: data.date.present ? data.date.value : this.date,
      dureeMinutes: data.dureeMinutes.present
          ? data.dureeMinutes.value
          : this.dureeMinutes,
      valeur: data.valeur.present ? data.valeur.value : this.valeur,
      idLogement: data.idLogement.present
          ? data.idLogement.value
          : this.idLogement,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Visite(')
          ..write('idVisite: $idVisite, ')
          ..write('status: $status, ')
          ..write('present: $present, ')
          ..write('commentaire: $commentaire, ')
          ..write('resultat: $resultat, ')
          ..write('travaille: $travaille, ')
          ..write('date: $date, ')
          ..write('dureeMinutes: $dureeMinutes, ')
          ..write('valeur: $valeur, ')
          ..write('idLogement: $idLogement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idVisite,
    status,
    present,
    commentaire,
    resultat,
    travaille,
    date,
    dureeMinutes,
    valeur,
    idLogement,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Visite &&
          other.idVisite == this.idVisite &&
          other.status == this.status &&
          other.present == this.present &&
          other.commentaire == this.commentaire &&
          other.resultat == this.resultat &&
          other.travaille == this.travaille &&
          other.date == this.date &&
          other.dureeMinutes == this.dureeMinutes &&
          other.valeur == this.valeur &&
          other.idLogement == this.idLogement);
}

class VisitesCompanion extends UpdateCompanion<Visite> {
  final Value<int> idVisite;
  final Value<String> status;
  final Value<bool> present;
  final Value<String?> commentaire;
  final Value<String> resultat;
  final Value<bool> travaille;
  final Value<DateTime> date;
  final Value<int> dureeMinutes;
  final Value<int> valeur;
  final Value<int> idLogement;
  const VisitesCompanion({
    this.idVisite = const Value.absent(),
    this.status = const Value.absent(),
    this.present = const Value.absent(),
    this.commentaire = const Value.absent(),
    this.resultat = const Value.absent(),
    this.travaille = const Value.absent(),
    this.date = const Value.absent(),
    this.dureeMinutes = const Value.absent(),
    this.valeur = const Value.absent(),
    this.idLogement = const Value.absent(),
  });
  VisitesCompanion.insert({
    this.idVisite = const Value.absent(),
    required String status,
    required bool present,
    this.commentaire = const Value.absent(),
    required String resultat,
    required bool travaille,
    required DateTime date,
    required int dureeMinutes,
    required int valeur,
    required int idLogement,
  }) : status = Value(status),
       present = Value(present),
       resultat = Value(resultat),
       travaille = Value(travaille),
       date = Value(date),
       dureeMinutes = Value(dureeMinutes),
       valeur = Value(valeur),
       idLogement = Value(idLogement);
  static Insertable<Visite> custom({
    Expression<int>? idVisite,
    Expression<String>? status,
    Expression<bool>? present,
    Expression<String>? commentaire,
    Expression<String>? resultat,
    Expression<bool>? travaille,
    Expression<DateTime>? date,
    Expression<int>? dureeMinutes,
    Expression<int>? valeur,
    Expression<int>? idLogement,
  }) {
    return RawValuesInsertable({
      if (idVisite != null) 'id_visite': idVisite,
      if (status != null) 'status': status,
      if (present != null) 'present': present,
      if (commentaire != null) 'commentaire': commentaire,
      if (resultat != null) 'resultat': resultat,
      if (travaille != null) 'travaille': travaille,
      if (date != null) 'date_': date,
      if (dureeMinutes != null) 'duree_minutes': dureeMinutes,
      if (valeur != null) 'valeur': valeur,
      if (idLogement != null) 'id_logement': idLogement,
    });
  }

  VisitesCompanion copyWith({
    Value<int>? idVisite,
    Value<String>? status,
    Value<bool>? present,
    Value<String?>? commentaire,
    Value<String>? resultat,
    Value<bool>? travaille,
    Value<DateTime>? date,
    Value<int>? dureeMinutes,
    Value<int>? valeur,
    Value<int>? idLogement,
  }) {
    return VisitesCompanion(
      idVisite: idVisite ?? this.idVisite,
      status: status ?? this.status,
      present: present ?? this.present,
      commentaire: commentaire ?? this.commentaire,
      resultat: resultat ?? this.resultat,
      travaille: travaille ?? this.travaille,
      date: date ?? this.date,
      dureeMinutes: dureeMinutes ?? this.dureeMinutes,
      valeur: valeur ?? this.valeur,
      idLogement: idLogement ?? this.idLogement,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idVisite.present) {
      map['id_visite'] = Variable<int>(idVisite.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (present.present) {
      map['present'] = Variable<bool>(present.value);
    }
    if (commentaire.present) {
      map['commentaire'] = Variable<String>(commentaire.value);
    }
    if (resultat.present) {
      map['resultat'] = Variable<String>(resultat.value);
    }
    if (travaille.present) {
      map['travaille'] = Variable<bool>(travaille.value);
    }
    if (date.present) {
      map['date_'] = Variable<DateTime>(date.value);
    }
    if (dureeMinutes.present) {
      map['duree_minutes'] = Variable<int>(dureeMinutes.value);
    }
    if (valeur.present) {
      map['valeur'] = Variable<int>(valeur.value);
    }
    if (idLogement.present) {
      map['id_logement'] = Variable<int>(idLogement.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VisitesCompanion(')
          ..write('idVisite: $idVisite, ')
          ..write('status: $status, ')
          ..write('present: $present, ')
          ..write('commentaire: $commentaire, ')
          ..write('resultat: $resultat, ')
          ..write('travaille: $travaille, ')
          ..write('date: $date, ')
          ..write('dureeMinutes: $dureeMinutes, ')
          ..write('valeur: $valeur, ')
          ..write('idLogement: $idLogement')
          ..write(')'))
        .toString();
  }
}

class $ContenuesTable extends Contenues
    with TableInfo<$ContenuesTable, Contenue> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContenuesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idContenueMeta = const VerificationMeta(
    'idContenue',
  );
  @override
  late final GeneratedColumn<int> idContenue = GeneratedColumn<int>(
    'id_contenue',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 10),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pathMeta = const VerificationMeta('path');
  @override
  late final GeneratedColumn<String> path = GeneratedColumn<String>(
    'path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [idContenue, type, path];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'contenues';
  @override
  VerificationContext validateIntegrity(
    Insertable<Contenue> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_contenue')) {
      context.handle(
        _idContenueMeta,
        idContenue.isAcceptableOrUnknown(data['id_contenue']!, _idContenueMeta),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('path')) {
      context.handle(
        _pathMeta,
        path.isAcceptableOrUnknown(data['path']!, _pathMeta),
      );
    } else if (isInserting) {
      context.missing(_pathMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idContenue};
  @override
  Contenue map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Contenue(
      idContenue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_contenue'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      path: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}path'],
      )!,
    );
  }

  @override
  $ContenuesTable createAlias(String alias) {
    return $ContenuesTable(attachedDatabase, alias);
  }
}

class Contenue extends DataClass implements Insertable<Contenue> {
  final int idContenue;
  final String type;
  final String path;
  const Contenue({
    required this.idContenue,
    required this.type,
    required this.path,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_contenue'] = Variable<int>(idContenue);
    map['type'] = Variable<String>(type);
    map['path'] = Variable<String>(path);
    return map;
  }

  ContenuesCompanion toCompanion(bool nullToAbsent) {
    return ContenuesCompanion(
      idContenue: Value(idContenue),
      type: Value(type),
      path: Value(path),
    );
  }

  factory Contenue.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Contenue(
      idContenue: serializer.fromJson<int>(json['idContenue']),
      type: serializer.fromJson<String>(json['type']),
      path: serializer.fromJson<String>(json['path']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idContenue': serializer.toJson<int>(idContenue),
      'type': serializer.toJson<String>(type),
      'path': serializer.toJson<String>(path),
    };
  }

  Contenue copyWith({int? idContenue, String? type, String? path}) => Contenue(
    idContenue: idContenue ?? this.idContenue,
    type: type ?? this.type,
    path: path ?? this.path,
  );
  Contenue copyWithCompanion(ContenuesCompanion data) {
    return Contenue(
      idContenue: data.idContenue.present
          ? data.idContenue.value
          : this.idContenue,
      type: data.type.present ? data.type.value : this.type,
      path: data.path.present ? data.path.value : this.path,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Contenue(')
          ..write('idContenue: $idContenue, ')
          ..write('type: $type, ')
          ..write('path: $path')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idContenue, type, path);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Contenue &&
          other.idContenue == this.idContenue &&
          other.type == this.type &&
          other.path == this.path);
}

class ContenuesCompanion extends UpdateCompanion<Contenue> {
  final Value<int> idContenue;
  final Value<String> type;
  final Value<String> path;
  const ContenuesCompanion({
    this.idContenue = const Value.absent(),
    this.type = const Value.absent(),
    this.path = const Value.absent(),
  });
  ContenuesCompanion.insert({
    this.idContenue = const Value.absent(),
    required String type,
    required String path,
  }) : type = Value(type),
       path = Value(path);
  static Insertable<Contenue> custom({
    Expression<int>? idContenue,
    Expression<String>? type,
    Expression<String>? path,
  }) {
    return RawValuesInsertable({
      if (idContenue != null) 'id_contenue': idContenue,
      if (type != null) 'type': type,
      if (path != null) 'path': path,
    });
  }

  ContenuesCompanion copyWith({
    Value<int>? idContenue,
    Value<String>? type,
    Value<String>? path,
  }) {
    return ContenuesCompanion(
      idContenue: idContenue ?? this.idContenue,
      type: type ?? this.type,
      path: path ?? this.path,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idContenue.present) {
      map['id_contenue'] = Variable<int>(idContenue.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (path.present) {
      map['path'] = Variable<String>(path.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContenuesCompanion(')
          ..write('idContenue: $idContenue, ')
          ..write('type: $type, ')
          ..write('path: $path')
          ..write(')'))
        .toString();
  }
}

class $EtatLieuxsTable extends EtatLieuxs
    with TableInfo<$EtatLieuxsTable, EtatLieux> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $EtatLieuxsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idEtatParametreMeta = const VerificationMeta(
    'idEtatParametre',
  );
  @override
  late final GeneratedColumn<int> idEtatParametre = GeneratedColumn<int>(
    'id_etat_parametre',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _resultatMeta = const VerificationMeta(
    'resultat',
  );
  @override
  late final GeneratedColumn<String> resultat = GeneratedColumn<String>(
    'resultat',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valeurMeta = const VerificationMeta('valeur');
  @override
  late final GeneratedColumn<int> valeur = GeneratedColumn<int>(
    'valeur',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
    'date_',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _idVisiteMeta = const VerificationMeta(
    'idVisite',
  );
  @override
  late final GeneratedColumn<int> idVisite = GeneratedColumn<int>(
    'id_visite',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES visites (id_visite)',
    ),
  );
  static const VerificationMeta _idLogementMeta = const VerificationMeta(
    'idLogement',
  );
  @override
  late final GeneratedColumn<int> idLogement = GeneratedColumn<int>(
    'id_logement',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES logements (id_logement)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idEtatParametre,
    resultat,
    valeur,
    date,
    idVisite,
    idLogement,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'etat_lieuxs';
  @override
  VerificationContext validateIntegrity(
    Insertable<EtatLieux> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_etat_parametre')) {
      context.handle(
        _idEtatParametreMeta,
        idEtatParametre.isAcceptableOrUnknown(
          data['id_etat_parametre']!,
          _idEtatParametreMeta,
        ),
      );
    }
    if (data.containsKey('resultat')) {
      context.handle(
        _resultatMeta,
        resultat.isAcceptableOrUnknown(data['resultat']!, _resultatMeta),
      );
    } else if (isInserting) {
      context.missing(_resultatMeta);
    }
    if (data.containsKey('valeur')) {
      context.handle(
        _valeurMeta,
        valeur.isAcceptableOrUnknown(data['valeur']!, _valeurMeta),
      );
    } else if (isInserting) {
      context.missing(_valeurMeta);
    }
    if (data.containsKey('date_')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date_']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('id_visite')) {
      context.handle(
        _idVisiteMeta,
        idVisite.isAcceptableOrUnknown(data['id_visite']!, _idVisiteMeta),
      );
    } else if (isInserting) {
      context.missing(_idVisiteMeta);
    }
    if (data.containsKey('id_logement')) {
      context.handle(
        _idLogementMeta,
        idLogement.isAcceptableOrUnknown(data['id_logement']!, _idLogementMeta),
      );
    } else if (isInserting) {
      context.missing(_idLogementMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idEtatParametre};
  @override
  EtatLieux map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EtatLieux(
      idEtatParametre: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_etat_parametre'],
      )!,
      resultat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resultat'],
      )!,
      valeur: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}valeur'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}date_'],
      )!,
      idVisite: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_visite'],
      )!,
      idLogement: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_logement'],
      )!,
    );
  }

  @override
  $EtatLieuxsTable createAlias(String alias) {
    return $EtatLieuxsTable(attachedDatabase, alias);
  }
}

class EtatLieux extends DataClass implements Insertable<EtatLieux> {
  final int idEtatParametre;
  final String resultat;
  final int valeur;
  final DateTime date;
  final int idVisite;
  final int idLogement;
  const EtatLieux({
    required this.idEtatParametre,
    required this.resultat,
    required this.valeur,
    required this.date,
    required this.idVisite,
    required this.idLogement,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_etat_parametre'] = Variable<int>(idEtatParametre);
    map['resultat'] = Variable<String>(resultat);
    map['valeur'] = Variable<int>(valeur);
    map['date_'] = Variable<DateTime>(date);
    map['id_visite'] = Variable<int>(idVisite);
    map['id_logement'] = Variable<int>(idLogement);
    return map;
  }

  EtatLieuxsCompanion toCompanion(bool nullToAbsent) {
    return EtatLieuxsCompanion(
      idEtatParametre: Value(idEtatParametre),
      resultat: Value(resultat),
      valeur: Value(valeur),
      date: Value(date),
      idVisite: Value(idVisite),
      idLogement: Value(idLogement),
    );
  }

  factory EtatLieux.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EtatLieux(
      idEtatParametre: serializer.fromJson<int>(json['idEtatParametre']),
      resultat: serializer.fromJson<String>(json['resultat']),
      valeur: serializer.fromJson<int>(json['valeur']),
      date: serializer.fromJson<DateTime>(json['date']),
      idVisite: serializer.fromJson<int>(json['idVisite']),
      idLogement: serializer.fromJson<int>(json['idLogement']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idEtatParametre': serializer.toJson<int>(idEtatParametre),
      'resultat': serializer.toJson<String>(resultat),
      'valeur': serializer.toJson<int>(valeur),
      'date': serializer.toJson<DateTime>(date),
      'idVisite': serializer.toJson<int>(idVisite),
      'idLogement': serializer.toJson<int>(idLogement),
    };
  }

  EtatLieux copyWith({
    int? idEtatParametre,
    String? resultat,
    int? valeur,
    DateTime? date,
    int? idVisite,
    int? idLogement,
  }) => EtatLieux(
    idEtatParametre: idEtatParametre ?? this.idEtatParametre,
    resultat: resultat ?? this.resultat,
    valeur: valeur ?? this.valeur,
    date: date ?? this.date,
    idVisite: idVisite ?? this.idVisite,
    idLogement: idLogement ?? this.idLogement,
  );
  EtatLieux copyWithCompanion(EtatLieuxsCompanion data) {
    return EtatLieux(
      idEtatParametre: data.idEtatParametre.present
          ? data.idEtatParametre.value
          : this.idEtatParametre,
      resultat: data.resultat.present ? data.resultat.value : this.resultat,
      valeur: data.valeur.present ? data.valeur.value : this.valeur,
      date: data.date.present ? data.date.value : this.date,
      idVisite: data.idVisite.present ? data.idVisite.value : this.idVisite,
      idLogement: data.idLogement.present
          ? data.idLogement.value
          : this.idLogement,
    );
  }

  @override
  String toString() {
    return (StringBuffer('EtatLieux(')
          ..write('idEtatParametre: $idEtatParametre, ')
          ..write('resultat: $resultat, ')
          ..write('valeur: $valeur, ')
          ..write('date: $date, ')
          ..write('idVisite: $idVisite, ')
          ..write('idLogement: $idLogement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idEtatParametre,
    resultat,
    valeur,
    date,
    idVisite,
    idLogement,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EtatLieux &&
          other.idEtatParametre == this.idEtatParametre &&
          other.resultat == this.resultat &&
          other.valeur == this.valeur &&
          other.date == this.date &&
          other.idVisite == this.idVisite &&
          other.idLogement == this.idLogement);
}

class EtatLieuxsCompanion extends UpdateCompanion<EtatLieux> {
  final Value<int> idEtatParametre;
  final Value<String> resultat;
  final Value<int> valeur;
  final Value<DateTime> date;
  final Value<int> idVisite;
  final Value<int> idLogement;
  const EtatLieuxsCompanion({
    this.idEtatParametre = const Value.absent(),
    this.resultat = const Value.absent(),
    this.valeur = const Value.absent(),
    this.date = const Value.absent(),
    this.idVisite = const Value.absent(),
    this.idLogement = const Value.absent(),
  });
  EtatLieuxsCompanion.insert({
    this.idEtatParametre = const Value.absent(),
    required String resultat,
    required int valeur,
    required DateTime date,
    required int idVisite,
    required int idLogement,
  }) : resultat = Value(resultat),
       valeur = Value(valeur),
       date = Value(date),
       idVisite = Value(idVisite),
       idLogement = Value(idLogement);
  static Insertable<EtatLieux> custom({
    Expression<int>? idEtatParametre,
    Expression<String>? resultat,
    Expression<int>? valeur,
    Expression<DateTime>? date,
    Expression<int>? idVisite,
    Expression<int>? idLogement,
  }) {
    return RawValuesInsertable({
      if (idEtatParametre != null) 'id_etat_parametre': idEtatParametre,
      if (resultat != null) 'resultat': resultat,
      if (valeur != null) 'valeur': valeur,
      if (date != null) 'date_': date,
      if (idVisite != null) 'id_visite': idVisite,
      if (idLogement != null) 'id_logement': idLogement,
    });
  }

  EtatLieuxsCompanion copyWith({
    Value<int>? idEtatParametre,
    Value<String>? resultat,
    Value<int>? valeur,
    Value<DateTime>? date,
    Value<int>? idVisite,
    Value<int>? idLogement,
  }) {
    return EtatLieuxsCompanion(
      idEtatParametre: idEtatParametre ?? this.idEtatParametre,
      resultat: resultat ?? this.resultat,
      valeur: valeur ?? this.valeur,
      date: date ?? this.date,
      idVisite: idVisite ?? this.idVisite,
      idLogement: idLogement ?? this.idLogement,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idEtatParametre.present) {
      map['id_etat_parametre'] = Variable<int>(idEtatParametre.value);
    }
    if (resultat.present) {
      map['resultat'] = Variable<String>(resultat.value);
    }
    if (valeur.present) {
      map['valeur'] = Variable<int>(valeur.value);
    }
    if (date.present) {
      map['date_'] = Variable<DateTime>(date.value);
    }
    if (idVisite.present) {
      map['id_visite'] = Variable<int>(idVisite.value);
    }
    if (idLogement.present) {
      map['id_logement'] = Variable<int>(idLogement.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EtatLieuxsCompanion(')
          ..write('idEtatParametre: $idEtatParametre, ')
          ..write('resultat: $resultat, ')
          ..write('valeur: $valeur, ')
          ..write('date: $date, ')
          ..write('idVisite: $idVisite, ')
          ..write('idLogement: $idLogement')
          ..write(')'))
        .toString();
  }
}

class $PersonnesTable extends Personnes
    with TableInfo<$PersonnesTable, Personne> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PersonnesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idPersonneMeta = const VerificationMeta(
    'idPersonne',
  );
  @override
  late final GeneratedColumn<int> idPersonne = GeneratedColumn<int>(
    'id_personne',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _numeroTelMeta = const VerificationMeta(
    'numeroTel',
  );
  @override
  late final GeneratedColumn<String> numeroTel = GeneratedColumn<String>(
    'numero_tel',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 10),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _prenomMeta = const VerificationMeta('prenom');
  @override
  late final GeneratedColumn<String> prenom = GeneratedColumn<String>(
    'prenom',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nomMeta = const VerificationMeta('nom');
  @override
  late final GeneratedColumn<String> nom = GeneratedColumn<String>(
    'nom',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _commentaireMeta = const VerificationMeta(
    'commentaire',
  );
  @override
  late final GeneratedColumn<String> commentaire = GeneratedColumn<String>(
    'commentaire',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _idLogementMeta = const VerificationMeta(
    'idLogement',
  );
  @override
  late final GeneratedColumn<int> idLogement = GeneratedColumn<int>(
    'id_logement',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES logements (id_logement)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [
    idPersonne,
    numeroTel,
    prenom,
    nom,
    commentaire,
    idLogement,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'personnes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Personne> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_personne')) {
      context.handle(
        _idPersonneMeta,
        idPersonne.isAcceptableOrUnknown(data['id_personne']!, _idPersonneMeta),
      );
    }
    if (data.containsKey('numero_tel')) {
      context.handle(
        _numeroTelMeta,
        numeroTel.isAcceptableOrUnknown(data['numero_tel']!, _numeroTelMeta),
      );
    } else if (isInserting) {
      context.missing(_numeroTelMeta);
    }
    if (data.containsKey('prenom')) {
      context.handle(
        _prenomMeta,
        prenom.isAcceptableOrUnknown(data['prenom']!, _prenomMeta),
      );
    } else if (isInserting) {
      context.missing(_prenomMeta);
    }
    if (data.containsKey('nom')) {
      context.handle(
        _nomMeta,
        nom.isAcceptableOrUnknown(data['nom']!, _nomMeta),
      );
    } else if (isInserting) {
      context.missing(_nomMeta);
    }
    if (data.containsKey('commentaire')) {
      context.handle(
        _commentaireMeta,
        commentaire.isAcceptableOrUnknown(
          data['commentaire']!,
          _commentaireMeta,
        ),
      );
    }
    if (data.containsKey('id_logement')) {
      context.handle(
        _idLogementMeta,
        idLogement.isAcceptableOrUnknown(data['id_logement']!, _idLogementMeta),
      );
    } else if (isInserting) {
      context.missing(_idLogementMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idPersonne};
  @override
  Personne map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Personne(
      idPersonne: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_personne'],
      )!,
      numeroTel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}numero_tel'],
      )!,
      prenom: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}prenom'],
      )!,
      nom: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nom'],
      )!,
      commentaire: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}commentaire'],
      ),
      idLogement: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_logement'],
      )!,
    );
  }

  @override
  $PersonnesTable createAlias(String alias) {
    return $PersonnesTable(attachedDatabase, alias);
  }
}

class Personne extends DataClass implements Insertable<Personne> {
  final int idPersonne;
  final String numeroTel;
  final String prenom;
  final String nom;
  final String? commentaire;
  final int idLogement;
  const Personne({
    required this.idPersonne,
    required this.numeroTel,
    required this.prenom,
    required this.nom,
    this.commentaire,
    required this.idLogement,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_personne'] = Variable<int>(idPersonne);
    map['numero_tel'] = Variable<String>(numeroTel);
    map['prenom'] = Variable<String>(prenom);
    map['nom'] = Variable<String>(nom);
    if (!nullToAbsent || commentaire != null) {
      map['commentaire'] = Variable<String>(commentaire);
    }
    map['id_logement'] = Variable<int>(idLogement);
    return map;
  }

  PersonnesCompanion toCompanion(bool nullToAbsent) {
    return PersonnesCompanion(
      idPersonne: Value(idPersonne),
      numeroTel: Value(numeroTel),
      prenom: Value(prenom),
      nom: Value(nom),
      commentaire: commentaire == null && nullToAbsent
          ? const Value.absent()
          : Value(commentaire),
      idLogement: Value(idLogement),
    );
  }

  factory Personne.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Personne(
      idPersonne: serializer.fromJson<int>(json['idPersonne']),
      numeroTel: serializer.fromJson<String>(json['numeroTel']),
      prenom: serializer.fromJson<String>(json['prenom']),
      nom: serializer.fromJson<String>(json['nom']),
      commentaire: serializer.fromJson<String?>(json['commentaire']),
      idLogement: serializer.fromJson<int>(json['idLogement']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idPersonne': serializer.toJson<int>(idPersonne),
      'numeroTel': serializer.toJson<String>(numeroTel),
      'prenom': serializer.toJson<String>(prenom),
      'nom': serializer.toJson<String>(nom),
      'commentaire': serializer.toJson<String?>(commentaire),
      'idLogement': serializer.toJson<int>(idLogement),
    };
  }

  Personne copyWith({
    int? idPersonne,
    String? numeroTel,
    String? prenom,
    String? nom,
    Value<String?> commentaire = const Value.absent(),
    int? idLogement,
  }) => Personne(
    idPersonne: idPersonne ?? this.idPersonne,
    numeroTel: numeroTel ?? this.numeroTel,
    prenom: prenom ?? this.prenom,
    nom: nom ?? this.nom,
    commentaire: commentaire.present ? commentaire.value : this.commentaire,
    idLogement: idLogement ?? this.idLogement,
  );
  Personne copyWithCompanion(PersonnesCompanion data) {
    return Personne(
      idPersonne: data.idPersonne.present
          ? data.idPersonne.value
          : this.idPersonne,
      numeroTel: data.numeroTel.present ? data.numeroTel.value : this.numeroTel,
      prenom: data.prenom.present ? data.prenom.value : this.prenom,
      nom: data.nom.present ? data.nom.value : this.nom,
      commentaire: data.commentaire.present
          ? data.commentaire.value
          : this.commentaire,
      idLogement: data.idLogement.present
          ? data.idLogement.value
          : this.idLogement,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Personne(')
          ..write('idPersonne: $idPersonne, ')
          ..write('numeroTel: $numeroTel, ')
          ..write('prenom: $prenom, ')
          ..write('nom: $nom, ')
          ..write('commentaire: $commentaire, ')
          ..write('idLogement: $idLogement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(idPersonne, numeroTel, prenom, nom, commentaire, idLogement);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Personne &&
          other.idPersonne == this.idPersonne &&
          other.numeroTel == this.numeroTel &&
          other.prenom == this.prenom &&
          other.nom == this.nom &&
          other.commentaire == this.commentaire &&
          other.idLogement == this.idLogement);
}

class PersonnesCompanion extends UpdateCompanion<Personne> {
  final Value<int> idPersonne;
  final Value<String> numeroTel;
  final Value<String> prenom;
  final Value<String> nom;
  final Value<String?> commentaire;
  final Value<int> idLogement;
  const PersonnesCompanion({
    this.idPersonne = const Value.absent(),
    this.numeroTel = const Value.absent(),
    this.prenom = const Value.absent(),
    this.nom = const Value.absent(),
    this.commentaire = const Value.absent(),
    this.idLogement = const Value.absent(),
  });
  PersonnesCompanion.insert({
    this.idPersonne = const Value.absent(),
    required String numeroTel,
    required String prenom,
    required String nom,
    this.commentaire = const Value.absent(),
    required int idLogement,
  }) : numeroTel = Value(numeroTel),
       prenom = Value(prenom),
       nom = Value(nom),
       idLogement = Value(idLogement);
  static Insertable<Personne> custom({
    Expression<int>? idPersonne,
    Expression<String>? numeroTel,
    Expression<String>? prenom,
    Expression<String>? nom,
    Expression<String>? commentaire,
    Expression<int>? idLogement,
  }) {
    return RawValuesInsertable({
      if (idPersonne != null) 'id_personne': idPersonne,
      if (numeroTel != null) 'numero_tel': numeroTel,
      if (prenom != null) 'prenom': prenom,
      if (nom != null) 'nom': nom,
      if (commentaire != null) 'commentaire': commentaire,
      if (idLogement != null) 'id_logement': idLogement,
    });
  }

  PersonnesCompanion copyWith({
    Value<int>? idPersonne,
    Value<String>? numeroTel,
    Value<String>? prenom,
    Value<String>? nom,
    Value<String?>? commentaire,
    Value<int>? idLogement,
  }) {
    return PersonnesCompanion(
      idPersonne: idPersonne ?? this.idPersonne,
      numeroTel: numeroTel ?? this.numeroTel,
      prenom: prenom ?? this.prenom,
      nom: nom ?? this.nom,
      commentaire: commentaire ?? this.commentaire,
      idLogement: idLogement ?? this.idLogement,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idPersonne.present) {
      map['id_personne'] = Variable<int>(idPersonne.value);
    }
    if (numeroTel.present) {
      map['numero_tel'] = Variable<String>(numeroTel.value);
    }
    if (prenom.present) {
      map['prenom'] = Variable<String>(prenom.value);
    }
    if (nom.present) {
      map['nom'] = Variable<String>(nom.value);
    }
    if (commentaire.present) {
      map['commentaire'] = Variable<String>(commentaire.value);
    }
    if (idLogement.present) {
      map['id_logement'] = Variable<int>(idLogement.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PersonnesCompanion(')
          ..write('idPersonne: $idPersonne, ')
          ..write('numeroTel: $numeroTel, ')
          ..write('prenom: $prenom, ')
          ..write('nom: $nom, ')
          ..write('commentaire: $commentaire, ')
          ..write('idLogement: $idLogement')
          ..write(')'))
        .toString();
  }
}

class $OrdreVisitesTable extends OrdreVisites
    with TableInfo<$OrdreVisitesTable, OrdreVisite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrdreVisitesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idOrdreVisiteMeta = const VerificationMeta(
    'idOrdreVisite',
  );
  @override
  late final GeneratedColumn<int> idOrdreVisite = GeneratedColumn<int>(
    'id_ordre_visite',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _idPersonneMeta = const VerificationMeta(
    'idPersonne',
  );
  @override
  late final GeneratedColumn<int> idPersonne = GeneratedColumn<int>(
    'id_personne',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES personnes (id_personne)',
    ),
  );
  static const VerificationMeta _idLogementMeta = const VerificationMeta(
    'idLogement',
  );
  @override
  late final GeneratedColumn<int> idLogement = GeneratedColumn<int>(
    'id_logement',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES logements (id_logement)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [idOrdreVisite, idPersonne, idLogement];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ordre_visites';
  @override
  VerificationContext validateIntegrity(
    Insertable<OrdreVisite> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_ordre_visite')) {
      context.handle(
        _idOrdreVisiteMeta,
        idOrdreVisite.isAcceptableOrUnknown(
          data['id_ordre_visite']!,
          _idOrdreVisiteMeta,
        ),
      );
    }
    if (data.containsKey('id_personne')) {
      context.handle(
        _idPersonneMeta,
        idPersonne.isAcceptableOrUnknown(data['id_personne']!, _idPersonneMeta),
      );
    } else if (isInserting) {
      context.missing(_idPersonneMeta);
    }
    if (data.containsKey('id_logement')) {
      context.handle(
        _idLogementMeta,
        idLogement.isAcceptableOrUnknown(data['id_logement']!, _idLogementMeta),
      );
    } else if (isInserting) {
      context.missing(_idLogementMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idOrdreVisite};
  @override
  OrdreVisite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrdreVisite(
      idOrdreVisite: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_ordre_visite'],
      )!,
      idPersonne: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_personne'],
      )!,
      idLogement: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_logement'],
      )!,
    );
  }

  @override
  $OrdreVisitesTable createAlias(String alias) {
    return $OrdreVisitesTable(attachedDatabase, alias);
  }
}

class OrdreVisite extends DataClass implements Insertable<OrdreVisite> {
  final int idOrdreVisite;
  final int idPersonne;
  final int idLogement;
  const OrdreVisite({
    required this.idOrdreVisite,
    required this.idPersonne,
    required this.idLogement,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_ordre_visite'] = Variable<int>(idOrdreVisite);
    map['id_personne'] = Variable<int>(idPersonne);
    map['id_logement'] = Variable<int>(idLogement);
    return map;
  }

  OrdreVisitesCompanion toCompanion(bool nullToAbsent) {
    return OrdreVisitesCompanion(
      idOrdreVisite: Value(idOrdreVisite),
      idPersonne: Value(idPersonne),
      idLogement: Value(idLogement),
    );
  }

  factory OrdreVisite.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrdreVisite(
      idOrdreVisite: serializer.fromJson<int>(json['idOrdreVisite']),
      idPersonne: serializer.fromJson<int>(json['idPersonne']),
      idLogement: serializer.fromJson<int>(json['idLogement']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idOrdreVisite': serializer.toJson<int>(idOrdreVisite),
      'idPersonne': serializer.toJson<int>(idPersonne),
      'idLogement': serializer.toJson<int>(idLogement),
    };
  }

  OrdreVisite copyWith({
    int? idOrdreVisite,
    int? idPersonne,
    int? idLogement,
  }) => OrdreVisite(
    idOrdreVisite: idOrdreVisite ?? this.idOrdreVisite,
    idPersonne: idPersonne ?? this.idPersonne,
    idLogement: idLogement ?? this.idLogement,
  );
  OrdreVisite copyWithCompanion(OrdreVisitesCompanion data) {
    return OrdreVisite(
      idOrdreVisite: data.idOrdreVisite.present
          ? data.idOrdreVisite.value
          : this.idOrdreVisite,
      idPersonne: data.idPersonne.present
          ? data.idPersonne.value
          : this.idPersonne,
      idLogement: data.idLogement.present
          ? data.idLogement.value
          : this.idLogement,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrdreVisite(')
          ..write('idOrdreVisite: $idOrdreVisite, ')
          ..write('idPersonne: $idPersonne, ')
          ..write('idLogement: $idLogement')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idOrdreVisite, idPersonne, idLogement);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrdreVisite &&
          other.idOrdreVisite == this.idOrdreVisite &&
          other.idPersonne == this.idPersonne &&
          other.idLogement == this.idLogement);
}

class OrdreVisitesCompanion extends UpdateCompanion<OrdreVisite> {
  final Value<int> idOrdreVisite;
  final Value<int> idPersonne;
  final Value<int> idLogement;
  const OrdreVisitesCompanion({
    this.idOrdreVisite = const Value.absent(),
    this.idPersonne = const Value.absent(),
    this.idLogement = const Value.absent(),
  });
  OrdreVisitesCompanion.insert({
    this.idOrdreVisite = const Value.absent(),
    required int idPersonne,
    required int idLogement,
  }) : idPersonne = Value(idPersonne),
       idLogement = Value(idLogement);
  static Insertable<OrdreVisite> custom({
    Expression<int>? idOrdreVisite,
    Expression<int>? idPersonne,
    Expression<int>? idLogement,
  }) {
    return RawValuesInsertable({
      if (idOrdreVisite != null) 'id_ordre_visite': idOrdreVisite,
      if (idPersonne != null) 'id_personne': idPersonne,
      if (idLogement != null) 'id_logement': idLogement,
    });
  }

  OrdreVisitesCompanion copyWith({
    Value<int>? idOrdreVisite,
    Value<int>? idPersonne,
    Value<int>? idLogement,
  }) {
    return OrdreVisitesCompanion(
      idOrdreVisite: idOrdreVisite ?? this.idOrdreVisite,
      idPersonne: idPersonne ?? this.idPersonne,
      idLogement: idLogement ?? this.idLogement,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idOrdreVisite.present) {
      map['id_ordre_visite'] = Variable<int>(idOrdreVisite.value);
    }
    if (idPersonne.present) {
      map['id_personne'] = Variable<int>(idPersonne.value);
    }
    if (idLogement.present) {
      map['id_logement'] = Variable<int>(idLogement.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrdreVisitesCompanion(')
          ..write('idOrdreVisite: $idOrdreVisite, ')
          ..write('idPersonne: $idPersonne, ')
          ..write('idLogement: $idLogement')
          ..write(')'))
        .toString();
  }
}

class $ContenuSourcesTable extends ContenuSources
    with TableInfo<$ContenuSourcesTable, ContenuSource> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ContenuSourcesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idContenueMeta = const VerificationMeta(
    'idContenue',
  );
  @override
  late final GeneratedColumn<int> idContenue = GeneratedColumn<int>(
    'id_contenue',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES contenues (id_contenue)',
    ),
  );
  static const VerificationMeta _idEtatParametreMeta = const VerificationMeta(
    'idEtatParametre',
  );
  @override
  late final GeneratedColumn<int> idEtatParametre = GeneratedColumn<int>(
    'id_etat_parametre',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES etat_lieuxs (id_etat_parametre)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [idContenue, idEtatParametre];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'contenu_sources';
  @override
  VerificationContext validateIntegrity(
    Insertable<ContenuSource> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_contenue')) {
      context.handle(
        _idContenueMeta,
        idContenue.isAcceptableOrUnknown(data['id_contenue']!, _idContenueMeta),
      );
    } else if (isInserting) {
      context.missing(_idContenueMeta);
    }
    if (data.containsKey('id_etat_parametre')) {
      context.handle(
        _idEtatParametreMeta,
        idEtatParametre.isAcceptableOrUnknown(
          data['id_etat_parametre']!,
          _idEtatParametreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idEtatParametreMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idContenue, idEtatParametre};
  @override
  ContenuSource map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ContenuSource(
      idContenue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_contenue'],
      )!,
      idEtatParametre: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_etat_parametre'],
      )!,
    );
  }

  @override
  $ContenuSourcesTable createAlias(String alias) {
    return $ContenuSourcesTable(attachedDatabase, alias);
  }
}

class ContenuSource extends DataClass implements Insertable<ContenuSource> {
  final int idContenue;
  final int idEtatParametre;
  const ContenuSource({
    required this.idContenue,
    required this.idEtatParametre,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_contenue'] = Variable<int>(idContenue);
    map['id_etat_parametre'] = Variable<int>(idEtatParametre);
    return map;
  }

  ContenuSourcesCompanion toCompanion(bool nullToAbsent) {
    return ContenuSourcesCompanion(
      idContenue: Value(idContenue),
      idEtatParametre: Value(idEtatParametre),
    );
  }

  factory ContenuSource.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ContenuSource(
      idContenue: serializer.fromJson<int>(json['idContenue']),
      idEtatParametre: serializer.fromJson<int>(json['idEtatParametre']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idContenue': serializer.toJson<int>(idContenue),
      'idEtatParametre': serializer.toJson<int>(idEtatParametre),
    };
  }

  ContenuSource copyWith({int? idContenue, int? idEtatParametre}) =>
      ContenuSource(
        idContenue: idContenue ?? this.idContenue,
        idEtatParametre: idEtatParametre ?? this.idEtatParametre,
      );
  ContenuSource copyWithCompanion(ContenuSourcesCompanion data) {
    return ContenuSource(
      idContenue: data.idContenue.present
          ? data.idContenue.value
          : this.idContenue,
      idEtatParametre: data.idEtatParametre.present
          ? data.idEtatParametre.value
          : this.idEtatParametre,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ContenuSource(')
          ..write('idContenue: $idContenue, ')
          ..write('idEtatParametre: $idEtatParametre')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idContenue, idEtatParametre);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ContenuSource &&
          other.idContenue == this.idContenue &&
          other.idEtatParametre == this.idEtatParametre);
}

class ContenuSourcesCompanion extends UpdateCompanion<ContenuSource> {
  final Value<int> idContenue;
  final Value<int> idEtatParametre;
  final Value<int> rowid;
  const ContenuSourcesCompanion({
    this.idContenue = const Value.absent(),
    this.idEtatParametre = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ContenuSourcesCompanion.insert({
    required int idContenue,
    required int idEtatParametre,
    this.rowid = const Value.absent(),
  }) : idContenue = Value(idContenue),
       idEtatParametre = Value(idEtatParametre);
  static Insertable<ContenuSource> custom({
    Expression<int>? idContenue,
    Expression<int>? idEtatParametre,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idContenue != null) 'id_contenue': idContenue,
      if (idEtatParametre != null) 'id_etat_parametre': idEtatParametre,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ContenuSourcesCompanion copyWith({
    Value<int>? idContenue,
    Value<int>? idEtatParametre,
    Value<int>? rowid,
  }) {
    return ContenuSourcesCompanion(
      idContenue: idContenue ?? this.idContenue,
      idEtatParametre: idEtatParametre ?? this.idEtatParametre,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idContenue.present) {
      map['id_contenue'] = Variable<int>(idContenue.value);
    }
    if (idEtatParametre.present) {
      map['id_etat_parametre'] = Variable<int>(idEtatParametre.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ContenuSourcesCompanion(')
          ..write('idContenue: $idContenue, ')
          ..write('idEtatParametre: $idEtatParametre, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $VerifEtatsTable extends VerifEtats
    with TableInfo<$VerifEtatsTable, VerifEtat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VerifEtatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idParametreAnalyseMeta =
      const VerificationMeta('idParametreAnalyse');
  @override
  late final GeneratedColumn<int> idParametreAnalyse = GeneratedColumn<int>(
    'id_parametre_analyse',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES parametre_analyses (id_parametre_analyse)',
    ),
  );
  static const VerificationMeta _idEtatParametreMeta = const VerificationMeta(
    'idEtatParametre',
  );
  @override
  late final GeneratedColumn<int> idEtatParametre = GeneratedColumn<int>(
    'id_etat_parametre',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES etat_lieuxs (id_etat_parametre)',
    ),
  );
  static const VerificationMeta _resultatMeta = const VerificationMeta(
    'resultat',
  );
  @override
  late final GeneratedColumn<String> resultat = GeneratedColumn<String>(
    'resultat',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(maxTextLength: 50),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valeurMeta = const VerificationMeta('valeur');
  @override
  late final GeneratedColumn<int> valeur = GeneratedColumn<int>(
    'valeur',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _commentaireMeta = const VerificationMeta(
    'commentaire',
  );
  @override
  late final GeneratedColumn<String> commentaire = GeneratedColumn<String>(
    'commentaire',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    idParametreAnalyse,
    idEtatParametre,
    resultat,
    valeur,
    commentaire,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'verif_etats';
  @override
  VerificationContext validateIntegrity(
    Insertable<VerifEtat> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_parametre_analyse')) {
      context.handle(
        _idParametreAnalyseMeta,
        idParametreAnalyse.isAcceptableOrUnknown(
          data['id_parametre_analyse']!,
          _idParametreAnalyseMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idParametreAnalyseMeta);
    }
    if (data.containsKey('id_etat_parametre')) {
      context.handle(
        _idEtatParametreMeta,
        idEtatParametre.isAcceptableOrUnknown(
          data['id_etat_parametre']!,
          _idEtatParametreMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_idEtatParametreMeta);
    }
    if (data.containsKey('resultat')) {
      context.handle(
        _resultatMeta,
        resultat.isAcceptableOrUnknown(data['resultat']!, _resultatMeta),
      );
    } else if (isInserting) {
      context.missing(_resultatMeta);
    }
    if (data.containsKey('valeur')) {
      context.handle(
        _valeurMeta,
        valeur.isAcceptableOrUnknown(data['valeur']!, _valeurMeta),
      );
    } else if (isInserting) {
      context.missing(_valeurMeta);
    }
    if (data.containsKey('commentaire')) {
      context.handle(
        _commentaireMeta,
        commentaire.isAcceptableOrUnknown(
          data['commentaire']!,
          _commentaireMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idParametreAnalyse, idEtatParametre};
  @override
  VerifEtat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VerifEtat(
      idParametreAnalyse: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_parametre_analyse'],
      )!,
      idEtatParametre: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_etat_parametre'],
      )!,
      resultat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}resultat'],
      )!,
      valeur: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}valeur'],
      )!,
      commentaire: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}commentaire'],
      ),
    );
  }

  @override
  $VerifEtatsTable createAlias(String alias) {
    return $VerifEtatsTable(attachedDatabase, alias);
  }
}

class VerifEtat extends DataClass implements Insertable<VerifEtat> {
  final int idParametreAnalyse;
  final int idEtatParametre;
  final String resultat;
  final int valeur;
  final String? commentaire;
  const VerifEtat({
    required this.idParametreAnalyse,
    required this.idEtatParametre,
    required this.resultat,
    required this.valeur,
    this.commentaire,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_parametre_analyse'] = Variable<int>(idParametreAnalyse);
    map['id_etat_parametre'] = Variable<int>(idEtatParametre);
    map['resultat'] = Variable<String>(resultat);
    map['valeur'] = Variable<int>(valeur);
    if (!nullToAbsent || commentaire != null) {
      map['commentaire'] = Variable<String>(commentaire);
    }
    return map;
  }

  VerifEtatsCompanion toCompanion(bool nullToAbsent) {
    return VerifEtatsCompanion(
      idParametreAnalyse: Value(idParametreAnalyse),
      idEtatParametre: Value(idEtatParametre),
      resultat: Value(resultat),
      valeur: Value(valeur),
      commentaire: commentaire == null && nullToAbsent
          ? const Value.absent()
          : Value(commentaire),
    );
  }

  factory VerifEtat.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VerifEtat(
      idParametreAnalyse: serializer.fromJson<int>(json['idParametreAnalyse']),
      idEtatParametre: serializer.fromJson<int>(json['idEtatParametre']),
      resultat: serializer.fromJson<String>(json['resultat']),
      valeur: serializer.fromJson<int>(json['valeur']),
      commentaire: serializer.fromJson<String?>(json['commentaire']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idParametreAnalyse': serializer.toJson<int>(idParametreAnalyse),
      'idEtatParametre': serializer.toJson<int>(idEtatParametre),
      'resultat': serializer.toJson<String>(resultat),
      'valeur': serializer.toJson<int>(valeur),
      'commentaire': serializer.toJson<String?>(commentaire),
    };
  }

  VerifEtat copyWith({
    int? idParametreAnalyse,
    int? idEtatParametre,
    String? resultat,
    int? valeur,
    Value<String?> commentaire = const Value.absent(),
  }) => VerifEtat(
    idParametreAnalyse: idParametreAnalyse ?? this.idParametreAnalyse,
    idEtatParametre: idEtatParametre ?? this.idEtatParametre,
    resultat: resultat ?? this.resultat,
    valeur: valeur ?? this.valeur,
    commentaire: commentaire.present ? commentaire.value : this.commentaire,
  );
  VerifEtat copyWithCompanion(VerifEtatsCompanion data) {
    return VerifEtat(
      idParametreAnalyse: data.idParametreAnalyse.present
          ? data.idParametreAnalyse.value
          : this.idParametreAnalyse,
      idEtatParametre: data.idEtatParametre.present
          ? data.idEtatParametre.value
          : this.idEtatParametre,
      resultat: data.resultat.present ? data.resultat.value : this.resultat,
      valeur: data.valeur.present ? data.valeur.value : this.valeur,
      commentaire: data.commentaire.present
          ? data.commentaire.value
          : this.commentaire,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VerifEtat(')
          ..write('idParametreAnalyse: $idParametreAnalyse, ')
          ..write('idEtatParametre: $idEtatParametre, ')
          ..write('resultat: $resultat, ')
          ..write('valeur: $valeur, ')
          ..write('commentaire: $commentaire')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    idParametreAnalyse,
    idEtatParametre,
    resultat,
    valeur,
    commentaire,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VerifEtat &&
          other.idParametreAnalyse == this.idParametreAnalyse &&
          other.idEtatParametre == this.idEtatParametre &&
          other.resultat == this.resultat &&
          other.valeur == this.valeur &&
          other.commentaire == this.commentaire);
}

class VerifEtatsCompanion extends UpdateCompanion<VerifEtat> {
  final Value<int> idParametreAnalyse;
  final Value<int> idEtatParametre;
  final Value<String> resultat;
  final Value<int> valeur;
  final Value<String?> commentaire;
  final Value<int> rowid;
  const VerifEtatsCompanion({
    this.idParametreAnalyse = const Value.absent(),
    this.idEtatParametre = const Value.absent(),
    this.resultat = const Value.absent(),
    this.valeur = const Value.absent(),
    this.commentaire = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VerifEtatsCompanion.insert({
    required int idParametreAnalyse,
    required int idEtatParametre,
    required String resultat,
    required int valeur,
    this.commentaire = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : idParametreAnalyse = Value(idParametreAnalyse),
       idEtatParametre = Value(idEtatParametre),
       resultat = Value(resultat),
       valeur = Value(valeur);
  static Insertable<VerifEtat> custom({
    Expression<int>? idParametreAnalyse,
    Expression<int>? idEtatParametre,
    Expression<String>? resultat,
    Expression<int>? valeur,
    Expression<String>? commentaire,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idParametreAnalyse != null)
        'id_parametre_analyse': idParametreAnalyse,
      if (idEtatParametre != null) 'id_etat_parametre': idEtatParametre,
      if (resultat != null) 'resultat': resultat,
      if (valeur != null) 'valeur': valeur,
      if (commentaire != null) 'commentaire': commentaire,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VerifEtatsCompanion copyWith({
    Value<int>? idParametreAnalyse,
    Value<int>? idEtatParametre,
    Value<String>? resultat,
    Value<int>? valeur,
    Value<String?>? commentaire,
    Value<int>? rowid,
  }) {
    return VerifEtatsCompanion(
      idParametreAnalyse: idParametreAnalyse ?? this.idParametreAnalyse,
      idEtatParametre: idEtatParametre ?? this.idEtatParametre,
      resultat: resultat ?? this.resultat,
      valeur: valeur ?? this.valeur,
      commentaire: commentaire ?? this.commentaire,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idParametreAnalyse.present) {
      map['id_parametre_analyse'] = Variable<int>(idParametreAnalyse.value);
    }
    if (idEtatParametre.present) {
      map['id_etat_parametre'] = Variable<int>(idEtatParametre.value);
    }
    if (resultat.present) {
      map['resultat'] = Variable<String>(resultat.value);
    }
    if (valeur.present) {
      map['valeur'] = Variable<int>(valeur.value);
    }
    if (commentaire.present) {
      map['commentaire'] = Variable<String>(commentaire.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VerifEtatsCompanion(')
          ..write('idParametreAnalyse: $idParametreAnalyse, ')
          ..write('idEtatParametre: $idEtatParametre, ')
          ..write('resultat: $resultat, ')
          ..write('valeur: $valeur, ')
          ..write('commentaire: $commentaire, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ResultatsTable extends Resultats
    with TableInfo<$ResultatsTable, ResultatVisite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ResultatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idPersonneMeta = const VerificationMeta(
    'idPersonne',
  );
  @override
  late final GeneratedColumn<int> idPersonne = GeneratedColumn<int>(
    'id_personne',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES personnes (id_personne)',
    ),
  );
  static const VerificationMeta _idVisiteMeta = const VerificationMeta(
    'idVisite',
  );
  @override
  late final GeneratedColumn<int> idVisite = GeneratedColumn<int>(
    'id_visite',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES visites (id_visite)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [idPersonne, idVisite];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'resultats';
  @override
  VerificationContext validateIntegrity(
    Insertable<ResultatVisite> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id_personne')) {
      context.handle(
        _idPersonneMeta,
        idPersonne.isAcceptableOrUnknown(data['id_personne']!, _idPersonneMeta),
      );
    } else if (isInserting) {
      context.missing(_idPersonneMeta);
    }
    if (data.containsKey('id_visite')) {
      context.handle(
        _idVisiteMeta,
        idVisite.isAcceptableOrUnknown(data['id_visite']!, _idVisiteMeta),
      );
    } else if (isInserting) {
      context.missing(_idVisiteMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {idPersonne, idVisite};
  @override
  ResultatVisite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ResultatVisite(
      idPersonne: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_personne'],
      )!,
      idVisite: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id_visite'],
      )!,
    );
  }

  @override
  $ResultatsTable createAlias(String alias) {
    return $ResultatsTable(attachedDatabase, alias);
  }
}

class ResultatVisite extends DataClass implements Insertable<ResultatVisite> {
  final int idPersonne;
  final int idVisite;
  const ResultatVisite({required this.idPersonne, required this.idVisite});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id_personne'] = Variable<int>(idPersonne);
    map['id_visite'] = Variable<int>(idVisite);
    return map;
  }

  ResultatsCompanion toCompanion(bool nullToAbsent) {
    return ResultatsCompanion(
      idPersonne: Value(idPersonne),
      idVisite: Value(idVisite),
    );
  }

  factory ResultatVisite.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ResultatVisite(
      idPersonne: serializer.fromJson<int>(json['idPersonne']),
      idVisite: serializer.fromJson<int>(json['idVisite']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'idPersonne': serializer.toJson<int>(idPersonne),
      'idVisite': serializer.toJson<int>(idVisite),
    };
  }

  ResultatVisite copyWith({int? idPersonne, int? idVisite}) => ResultatVisite(
    idPersonne: idPersonne ?? this.idPersonne,
    idVisite: idVisite ?? this.idVisite,
  );
  ResultatVisite copyWithCompanion(ResultatsCompanion data) {
    return ResultatVisite(
      idPersonne: data.idPersonne.present
          ? data.idPersonne.value
          : this.idPersonne,
      idVisite: data.idVisite.present ? data.idVisite.value : this.idVisite,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ResultatVisite(')
          ..write('idPersonne: $idPersonne, ')
          ..write('idVisite: $idVisite')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(idPersonne, idVisite);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ResultatVisite &&
          other.idPersonne == this.idPersonne &&
          other.idVisite == this.idVisite);
}

class ResultatsCompanion extends UpdateCompanion<ResultatVisite> {
  final Value<int> idPersonne;
  final Value<int> idVisite;
  final Value<int> rowid;
  const ResultatsCompanion({
    this.idPersonne = const Value.absent(),
    this.idVisite = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ResultatsCompanion.insert({
    required int idPersonne,
    required int idVisite,
    this.rowid = const Value.absent(),
  }) : idPersonne = Value(idPersonne),
       idVisite = Value(idVisite);
  static Insertable<ResultatVisite> custom({
    Expression<int>? idPersonne,
    Expression<int>? idVisite,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (idPersonne != null) 'id_personne': idPersonne,
      if (idVisite != null) 'id_visite': idVisite,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ResultatsCompanion copyWith({
    Value<int>? idPersonne,
    Value<int>? idVisite,
    Value<int>? rowid,
  }) {
    return ResultatsCompanion(
      idPersonne: idPersonne ?? this.idPersonne,
      idVisite: idVisite ?? this.idVisite,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (idPersonne.present) {
      map['id_personne'] = Variable<int>(idPersonne.value);
    }
    if (idVisite.present) {
      map['id_visite'] = Variable<int>(idVisite.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ResultatsCompanion(')
          ..write('idPersonne: $idPersonne, ')
          ..write('idVisite: $idVisite, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $LogementsTable logements = $LogementsTable(this);
  late final $ParametreAnalysesTable parametreAnalyses =
      $ParametreAnalysesTable(this);
  late final $VisitesTable visites = $VisitesTable(this);
  late final $ContenuesTable contenues = $ContenuesTable(this);
  late final $EtatLieuxsTable etatLieuxs = $EtatLieuxsTable(this);
  late final $PersonnesTable personnes = $PersonnesTable(this);
  late final $OrdreVisitesTable ordreVisites = $OrdreVisitesTable(this);
  late final $ContenuSourcesTable contenuSources = $ContenuSourcesTable(this);
  late final $VerifEtatsTable verifEtats = $VerifEtatsTable(this);
  late final $ResultatsTable resultats = $ResultatsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    logements,
    parametreAnalyses,
    visites,
    contenues,
    etatLieuxs,
    personnes,
    ordreVisites,
    contenuSources,
    verifEtats,
    resultats,
  ];
}

typedef $$LogementsTableCreateCompanionBuilder =
    LogementsCompanion Function({
      Value<int> idLogement,
      required String adresse,
      required String porte,
      Value<String?> code,
      Value<String?> infoSuplementaire,
    });
typedef $$LogementsTableUpdateCompanionBuilder =
    LogementsCompanion Function({
      Value<int> idLogement,
      Value<String> adresse,
      Value<String> porte,
      Value<String?> code,
      Value<String?> infoSuplementaire,
    });

final class $$LogementsTableReferences
    extends BaseReferences<_$AppDatabase, $LogementsTable, Logement> {
  $$LogementsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$VisitesTable, List<Visite>> _visitesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.visites,
    aliasName: 'logements__id_logement__visites__id_logement',
  );

  $$VisitesTableProcessedTableManager get visitesRefs {
    final manager = $$VisitesTableTableManager($_db, $_db.visites).filter(
      (f) =>
          f.idLogement.idLogement.sqlEquals($_itemColumn<int>('id_logement')!),
    );

    final cache = $_typedResult.readTableOrNull(_visitesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$EtatLieuxsTable, List<EtatLieux>>
  _etatLieuxsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.etatLieuxs,
    aliasName: 'logements__id_logement__etat_lieuxs__id_logement',
  );

  $$EtatLieuxsTableProcessedTableManager get etatLieuxsRefs {
    final manager = $$EtatLieuxsTableTableManager($_db, $_db.etatLieuxs).filter(
      (f) =>
          f.idLogement.idLogement.sqlEquals($_itemColumn<int>('id_logement')!),
    );

    final cache = $_typedResult.readTableOrNull(_etatLieuxsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$PersonnesTable, List<Personne>>
  _personnesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.personnes,
    aliasName: 'logements__id_logement__personnes__id_logement',
  );

  $$PersonnesTableProcessedTableManager get personnesRefs {
    final manager = $$PersonnesTableTableManager($_db, $_db.personnes).filter(
      (f) =>
          f.idLogement.idLogement.sqlEquals($_itemColumn<int>('id_logement')!),
    );

    final cache = $_typedResult.readTableOrNull(_personnesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$OrdreVisitesTable, List<OrdreVisite>>
  _ordreVisitesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.ordreVisites,
    aliasName: 'logements__id_logement__ordre_visites__id_logement',
  );

  $$OrdreVisitesTableProcessedTableManager get ordreVisitesRefs {
    final manager = $$OrdreVisitesTableTableManager($_db, $_db.ordreVisites)
        .filter(
          (f) => f.idLogement.idLogement.sqlEquals(
            $_itemColumn<int>('id_logement')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_ordreVisitesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LogementsTableFilterComposer
    extends Composer<_$AppDatabase, $LogementsTable> {
  $$LogementsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idLogement => $composableBuilder(
    column: $table.idLogement,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get adresse => $composableBuilder(
    column: $table.adresse,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get porte => $composableBuilder(
    column: $table.porte,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get infoSuplementaire => $composableBuilder(
    column: $table.infoSuplementaire,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> visitesRefs(
    Expression<bool> Function($$VisitesTableFilterComposer f) f,
  ) {
    final $$VisitesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.visites,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitesTableFilterComposer(
            $db: $db,
            $table: $db.visites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> etatLieuxsRefs(
    Expression<bool> Function($$EtatLieuxsTableFilterComposer f) f,
  ) {
    final $$EtatLieuxsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.etatLieuxs,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EtatLieuxsTableFilterComposer(
            $db: $db,
            $table: $db.etatLieuxs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> personnesRefs(
    Expression<bool> Function($$PersonnesTableFilterComposer f) f,
  ) {
    final $$PersonnesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.personnes,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonnesTableFilterComposer(
            $db: $db,
            $table: $db.personnes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> ordreVisitesRefs(
    Expression<bool> Function($$OrdreVisitesTableFilterComposer f) f,
  ) {
    final $$OrdreVisitesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.ordreVisites,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdreVisitesTableFilterComposer(
            $db: $db,
            $table: $db.ordreVisites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LogementsTableOrderingComposer
    extends Composer<_$AppDatabase, $LogementsTable> {
  $$LogementsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idLogement => $composableBuilder(
    column: $table.idLogement,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get adresse => $composableBuilder(
    column: $table.adresse,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get porte => $composableBuilder(
    column: $table.porte,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get code => $composableBuilder(
    column: $table.code,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get infoSuplementaire => $composableBuilder(
    column: $table.infoSuplementaire,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LogementsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LogementsTable> {
  $$LogementsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idLogement => $composableBuilder(
    column: $table.idLogement,
    builder: (column) => column,
  );

  GeneratedColumn<String> get adresse =>
      $composableBuilder(column: $table.adresse, builder: (column) => column);

  GeneratedColumn<String> get porte =>
      $composableBuilder(column: $table.porte, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get infoSuplementaire => $composableBuilder(
    column: $table.infoSuplementaire,
    builder: (column) => column,
  );

  Expression<T> visitesRefs<T extends Object>(
    Expression<T> Function($$VisitesTableAnnotationComposer a) f,
  ) {
    final $$VisitesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.visites,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitesTableAnnotationComposer(
            $db: $db,
            $table: $db.visites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> etatLieuxsRefs<T extends Object>(
    Expression<T> Function($$EtatLieuxsTableAnnotationComposer a) f,
  ) {
    final $$EtatLieuxsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.etatLieuxs,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EtatLieuxsTableAnnotationComposer(
            $db: $db,
            $table: $db.etatLieuxs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> personnesRefs<T extends Object>(
    Expression<T> Function($$PersonnesTableAnnotationComposer a) f,
  ) {
    final $$PersonnesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.personnes,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonnesTableAnnotationComposer(
            $db: $db,
            $table: $db.personnes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> ordreVisitesRefs<T extends Object>(
    Expression<T> Function($$OrdreVisitesTableAnnotationComposer a) f,
  ) {
    final $$OrdreVisitesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.ordreVisites,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdreVisitesTableAnnotationComposer(
            $db: $db,
            $table: $db.ordreVisites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LogementsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LogementsTable,
          Logement,
          $$LogementsTableFilterComposer,
          $$LogementsTableOrderingComposer,
          $$LogementsTableAnnotationComposer,
          $$LogementsTableCreateCompanionBuilder,
          $$LogementsTableUpdateCompanionBuilder,
          (Logement, $$LogementsTableReferences),
          Logement,
          PrefetchHooks Function({
            bool visitesRefs,
            bool etatLieuxsRefs,
            bool personnesRefs,
            bool ordreVisitesRefs,
          })
        > {
  $$LogementsTableTableManager(_$AppDatabase db, $LogementsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LogementsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LogementsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LogementsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idLogement = const Value.absent(),
                Value<String> adresse = const Value.absent(),
                Value<String> porte = const Value.absent(),
                Value<String?> code = const Value.absent(),
                Value<String?> infoSuplementaire = const Value.absent(),
              }) => LogementsCompanion(
                idLogement: idLogement,
                adresse: adresse,
                porte: porte,
                code: code,
                infoSuplementaire: infoSuplementaire,
              ),
          createCompanionCallback:
              ({
                Value<int> idLogement = const Value.absent(),
                required String adresse,
                required String porte,
                Value<String?> code = const Value.absent(),
                Value<String?> infoSuplementaire = const Value.absent(),
              }) => LogementsCompanion.insert(
                idLogement: idLogement,
                adresse: adresse,
                porte: porte,
                code: code,
                infoSuplementaire: infoSuplementaire,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$LogementsTable, Logement>(table),
                  $$LogementsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                visitesRefs = false,
                etatLieuxsRefs = false,
                personnesRefs = false,
                ordreVisitesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (visitesRefs) db.visites,
                    if (etatLieuxsRefs) db.etatLieuxs,
                    if (personnesRefs) db.personnes,
                    if (ordreVisitesRefs) db.ordreVisites,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (visitesRefs)
                        await $_getPrefetchedDataByColumns<
                          Logement,
                          $LogementsTable,
                          Visite,
                          $VisitesTable
                        >(
                          currentTable: table,
                          referencedTable: $$LogementsTableReferences
                              ._visitesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LogementsTableReferences(
                                db,
                                table,
                                p0,
                              ).visitesRefs,
                          currentColumn: 'id_logement',
                          referencedColumn: 'id_logement',
                          typedResults: items,
                        ),
                      if (etatLieuxsRefs)
                        await $_getPrefetchedDataByColumns<
                          Logement,
                          $LogementsTable,
                          EtatLieux,
                          $EtatLieuxsTable
                        >(
                          currentTable: table,
                          referencedTable: $$LogementsTableReferences
                              ._etatLieuxsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LogementsTableReferences(
                                db,
                                table,
                                p0,
                              ).etatLieuxsRefs,
                          currentColumn: 'id_logement',
                          referencedColumn: 'id_logement',
                          typedResults: items,
                        ),
                      if (personnesRefs)
                        await $_getPrefetchedDataByColumns<
                          Logement,
                          $LogementsTable,
                          Personne,
                          $PersonnesTable
                        >(
                          currentTable: table,
                          referencedTable: $$LogementsTableReferences
                              ._personnesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LogementsTableReferences(
                                db,
                                table,
                                p0,
                              ).personnesRefs,
                          currentColumn: 'id_logement',
                          referencedColumn: 'id_logement',
                          typedResults: items,
                        ),
                      if (ordreVisitesRefs)
                        await $_getPrefetchedDataByColumns<
                          Logement,
                          $LogementsTable,
                          OrdreVisite,
                          $OrdreVisitesTable
                        >(
                          currentTable: table,
                          referencedTable: $$LogementsTableReferences
                              ._ordreVisitesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LogementsTableReferences(
                                db,
                                table,
                                p0,
                              ).ordreVisitesRefs,
                          currentColumn: 'id_logement',
                          referencedColumn: 'id_logement',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$LogementsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LogementsTable,
      Logement,
      $$LogementsTableFilterComposer,
      $$LogementsTableOrderingComposer,
      $$LogementsTableAnnotationComposer,
      $$LogementsTableCreateCompanionBuilder,
      $$LogementsTableUpdateCompanionBuilder,
      (Logement, $$LogementsTableReferences),
      Logement,
      PrefetchHooks Function({
        bool visitesRefs,
        bool etatLieuxsRefs,
        bool personnesRefs,
        bool ordreVisitesRefs,
      })
    >;
typedef $$ParametreAnalysesTableCreateCompanionBuilder =
    ParametreAnalysesCompanion Function({
      Value<int> idParametreAnalyse,
      required String nom,
      Value<String?> description,
      required String unite,
      required String categorie,
      Value<String?> periodiciteMois,
    });
typedef $$ParametreAnalysesTableUpdateCompanionBuilder =
    ParametreAnalysesCompanion Function({
      Value<int> idParametreAnalyse,
      Value<String> nom,
      Value<String?> description,
      Value<String> unite,
      Value<String> categorie,
      Value<String?> periodiciteMois,
    });

final class $$ParametreAnalysesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ParametreAnalysesTable,
          ParametreAnalyse
        > {
  $$ParametreAnalysesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$VerifEtatsTable, List<VerifEtat>>
  _verifEtatsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.verifEtats,
    aliasName:
        'parametre_analyses__id_parametre_analyse__verif_etats__id_parametre_analyse',
  );

  $$VerifEtatsTableProcessedTableManager get verifEtatsRefs {
    final manager = $$VerifEtatsTableTableManager($_db, $_db.verifEtats).filter(
      (f) => f.idParametreAnalyse.idParametreAnalyse.sqlEquals(
        $_itemColumn<int>('id_parametre_analyse')!,
      ),
    );

    final cache = $_typedResult.readTableOrNull(_verifEtatsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ParametreAnalysesTableFilterComposer
    extends Composer<_$AppDatabase, $ParametreAnalysesTable> {
  $$ParametreAnalysesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idParametreAnalyse => $composableBuilder(
    column: $table.idParametreAnalyse,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nom => $composableBuilder(
    column: $table.nom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unite => $composableBuilder(
    column: $table.unite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categorie => $composableBuilder(
    column: $table.categorie,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get periodiciteMois => $composableBuilder(
    column: $table.periodiciteMois,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> verifEtatsRefs(
    Expression<bool> Function($$VerifEtatsTableFilterComposer f) f,
  ) {
    final $$VerifEtatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idParametreAnalyse,
      referencedTable: $db.verifEtats,
      getReferencedColumn: (t) => t.idParametreAnalyse,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VerifEtatsTableFilterComposer(
            $db: $db,
            $table: $db.verifEtats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ParametreAnalysesTableOrderingComposer
    extends Composer<_$AppDatabase, $ParametreAnalysesTable> {
  $$ParametreAnalysesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idParametreAnalyse => $composableBuilder(
    column: $table.idParametreAnalyse,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nom => $composableBuilder(
    column: $table.nom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unite => $composableBuilder(
    column: $table.unite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categorie => $composableBuilder(
    column: $table.categorie,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get periodiciteMois => $composableBuilder(
    column: $table.periodiciteMois,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ParametreAnalysesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ParametreAnalysesTable> {
  $$ParametreAnalysesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idParametreAnalyse => $composableBuilder(
    column: $table.idParametreAnalyse,
    builder: (column) => column,
  );

  GeneratedColumn<String> get nom =>
      $composableBuilder(column: $table.nom, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unite =>
      $composableBuilder(column: $table.unite, builder: (column) => column);

  GeneratedColumn<String> get categorie =>
      $composableBuilder(column: $table.categorie, builder: (column) => column);

  GeneratedColumn<String> get periodiciteMois => $composableBuilder(
    column: $table.periodiciteMois,
    builder: (column) => column,
  );

  Expression<T> verifEtatsRefs<T extends Object>(
    Expression<T> Function($$VerifEtatsTableAnnotationComposer a) f,
  ) {
    final $$VerifEtatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idParametreAnalyse,
      referencedTable: $db.verifEtats,
      getReferencedColumn: (t) => t.idParametreAnalyse,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VerifEtatsTableAnnotationComposer(
            $db: $db,
            $table: $db.verifEtats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ParametreAnalysesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ParametreAnalysesTable,
          ParametreAnalyse,
          $$ParametreAnalysesTableFilterComposer,
          $$ParametreAnalysesTableOrderingComposer,
          $$ParametreAnalysesTableAnnotationComposer,
          $$ParametreAnalysesTableCreateCompanionBuilder,
          $$ParametreAnalysesTableUpdateCompanionBuilder,
          (ParametreAnalyse, $$ParametreAnalysesTableReferences),
          ParametreAnalyse,
          PrefetchHooks Function({bool verifEtatsRefs})
        > {
  $$ParametreAnalysesTableTableManager(
    _$AppDatabase db,
    $ParametreAnalysesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ParametreAnalysesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ParametreAnalysesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ParametreAnalysesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> idParametreAnalyse = const Value.absent(),
                Value<String> nom = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<String> unite = const Value.absent(),
                Value<String> categorie = const Value.absent(),
                Value<String?> periodiciteMois = const Value.absent(),
              }) => ParametreAnalysesCompanion(
                idParametreAnalyse: idParametreAnalyse,
                nom: nom,
                description: description,
                unite: unite,
                categorie: categorie,
                periodiciteMois: periodiciteMois,
              ),
          createCompanionCallback:
              ({
                Value<int> idParametreAnalyse = const Value.absent(),
                required String nom,
                Value<String?> description = const Value.absent(),
                required String unite,
                required String categorie,
                Value<String?> periodiciteMois = const Value.absent(),
              }) => ParametreAnalysesCompanion.insert(
                idParametreAnalyse: idParametreAnalyse,
                nom: nom,
                description: description,
                unite: unite,
                categorie: categorie,
                periodiciteMois: periodiciteMois,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ParametreAnalysesTable, ParametreAnalyse>(table),
                  $$ParametreAnalysesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({verifEtatsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (verifEtatsRefs) db.verifEtats],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (verifEtatsRefs)
                    await $_getPrefetchedDataByColumns<
                      ParametreAnalyse,
                      $ParametreAnalysesTable,
                      VerifEtat,
                      $VerifEtatsTable
                    >(
                      currentTable: table,
                      referencedTable: $$ParametreAnalysesTableReferences
                          ._verifEtatsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ParametreAnalysesTableReferences(
                            db,
                            table,
                            p0,
                          ).verifEtatsRefs,
                      currentColumn: 'id_parametre_analyse',
                      referencedColumn: 'id_parametre_analyse',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ParametreAnalysesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ParametreAnalysesTable,
      ParametreAnalyse,
      $$ParametreAnalysesTableFilterComposer,
      $$ParametreAnalysesTableOrderingComposer,
      $$ParametreAnalysesTableAnnotationComposer,
      $$ParametreAnalysesTableCreateCompanionBuilder,
      $$ParametreAnalysesTableUpdateCompanionBuilder,
      (ParametreAnalyse, $$ParametreAnalysesTableReferences),
      ParametreAnalyse,
      PrefetchHooks Function({bool verifEtatsRefs})
    >;
typedef $$VisitesTableCreateCompanionBuilder =
    VisitesCompanion Function({
      Value<int> idVisite,
      required String status,
      required bool present,
      Value<String?> commentaire,
      required String resultat,
      required bool travaille,
      required DateTime date,
      required int dureeMinutes,
      required int valeur,
      required int idLogement,
    });
typedef $$VisitesTableUpdateCompanionBuilder =
    VisitesCompanion Function({
      Value<int> idVisite,
      Value<String> status,
      Value<bool> present,
      Value<String?> commentaire,
      Value<String> resultat,
      Value<bool> travaille,
      Value<DateTime> date,
      Value<int> dureeMinutes,
      Value<int> valeur,
      Value<int> idLogement,
    });

final class $$VisitesTableReferences
    extends BaseReferences<_$AppDatabase, $VisitesTable, Visite> {
  $$VisitesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LogementsTable _idLogementTable(_$AppDatabase db) =>
      db.logements.createAlias('visites__id_logement__logements__id_logement');

  $$LogementsTableProcessedTableManager get idLogement {
    final $_column = $_itemColumn<int>('id_logement')!;

    final manager = $$LogementsTableTableManager(
      $_db,
      $_db.logements,
    ).filter((f) => f.idLogement.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idLogementTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$EtatLieuxsTable, List<EtatLieux>>
  _etatLieuxsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.etatLieuxs,
    aliasName: 'visites__id_visite__etat_lieuxs__id_visite',
  );

  $$EtatLieuxsTableProcessedTableManager get etatLieuxsRefs {
    final manager = $$EtatLieuxsTableTableManager($_db, $_db.etatLieuxs).filter(
      (f) => f.idVisite.idVisite.sqlEquals($_itemColumn<int>('id_visite')!),
    );

    final cache = $_typedResult.readTableOrNull(_etatLieuxsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ResultatsTable, List<ResultatVisite>>
  _resultatsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.resultats,
    aliasName: 'visites__id_visite__resultats__id_visite',
  );

  $$ResultatsTableProcessedTableManager get resultatsRefs {
    final manager = $$ResultatsTableTableManager($_db, $_db.resultats).filter(
      (f) => f.idVisite.idVisite.sqlEquals($_itemColumn<int>('id_visite')!),
    );

    final cache = $_typedResult.readTableOrNull(_resultatsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VisitesTableFilterComposer
    extends Composer<_$AppDatabase, $VisitesTable> {
  $$VisitesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idVisite => $composableBuilder(
    column: $table.idVisite,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get present => $composableBuilder(
    column: $table.present,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get commentaire => $composableBuilder(
    column: $table.commentaire,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resultat => $composableBuilder(
    column: $table.resultat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get travaille => $composableBuilder(
    column: $table.travaille,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get dureeMinutes => $composableBuilder(
    column: $table.dureeMinutes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get valeur => $composableBuilder(
    column: $table.valeur,
    builder: (column) => ColumnFilters(column),
  );

  $$LogementsTableFilterComposer get idLogement {
    final $$LogementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.logements,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogementsTableFilterComposer(
            $db: $db,
            $table: $db.logements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> etatLieuxsRefs(
    Expression<bool> Function($$EtatLieuxsTableFilterComposer f) f,
  ) {
    final $$EtatLieuxsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idVisite,
      referencedTable: $db.etatLieuxs,
      getReferencedColumn: (t) => t.idVisite,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EtatLieuxsTableFilterComposer(
            $db: $db,
            $table: $db.etatLieuxs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> resultatsRefs(
    Expression<bool> Function($$ResultatsTableFilterComposer f) f,
  ) {
    final $$ResultatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idVisite,
      referencedTable: $db.resultats,
      getReferencedColumn: (t) => t.idVisite,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResultatsTableFilterComposer(
            $db: $db,
            $table: $db.resultats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VisitesTableOrderingComposer
    extends Composer<_$AppDatabase, $VisitesTable> {
  $$VisitesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idVisite => $composableBuilder(
    column: $table.idVisite,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get present => $composableBuilder(
    column: $table.present,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get commentaire => $composableBuilder(
    column: $table.commentaire,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resultat => $composableBuilder(
    column: $table.resultat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get travaille => $composableBuilder(
    column: $table.travaille,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get dureeMinutes => $composableBuilder(
    column: $table.dureeMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get valeur => $composableBuilder(
    column: $table.valeur,
    builder: (column) => ColumnOrderings(column),
  );

  $$LogementsTableOrderingComposer get idLogement {
    final $$LogementsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.logements,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogementsTableOrderingComposer(
            $db: $db,
            $table: $db.logements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VisitesTableAnnotationComposer
    extends Composer<_$AppDatabase, $VisitesTable> {
  $$VisitesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idVisite =>
      $composableBuilder(column: $table.idVisite, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<bool> get present =>
      $composableBuilder(column: $table.present, builder: (column) => column);

  GeneratedColumn<String> get commentaire => $composableBuilder(
    column: $table.commentaire,
    builder: (column) => column,
  );

  GeneratedColumn<String> get resultat =>
      $composableBuilder(column: $table.resultat, builder: (column) => column);

  GeneratedColumn<bool> get travaille =>
      $composableBuilder(column: $table.travaille, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<int> get dureeMinutes => $composableBuilder(
    column: $table.dureeMinutes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get valeur =>
      $composableBuilder(column: $table.valeur, builder: (column) => column);

  $$LogementsTableAnnotationComposer get idLogement {
    final $$LogementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.logements,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogementsTableAnnotationComposer(
            $db: $db,
            $table: $db.logements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> etatLieuxsRefs<T extends Object>(
    Expression<T> Function($$EtatLieuxsTableAnnotationComposer a) f,
  ) {
    final $$EtatLieuxsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idVisite,
      referencedTable: $db.etatLieuxs,
      getReferencedColumn: (t) => t.idVisite,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EtatLieuxsTableAnnotationComposer(
            $db: $db,
            $table: $db.etatLieuxs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> resultatsRefs<T extends Object>(
    Expression<T> Function($$ResultatsTableAnnotationComposer a) f,
  ) {
    final $$ResultatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idVisite,
      referencedTable: $db.resultats,
      getReferencedColumn: (t) => t.idVisite,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResultatsTableAnnotationComposer(
            $db: $db,
            $table: $db.resultats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VisitesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VisitesTable,
          Visite,
          $$VisitesTableFilterComposer,
          $$VisitesTableOrderingComposer,
          $$VisitesTableAnnotationComposer,
          $$VisitesTableCreateCompanionBuilder,
          $$VisitesTableUpdateCompanionBuilder,
          (Visite, $$VisitesTableReferences),
          Visite,
          PrefetchHooks Function({
            bool idLogement,
            bool etatLieuxsRefs,
            bool resultatsRefs,
          })
        > {
  $$VisitesTableTableManager(_$AppDatabase db, $VisitesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VisitesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VisitesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VisitesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idVisite = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<bool> present = const Value.absent(),
                Value<String?> commentaire = const Value.absent(),
                Value<String> resultat = const Value.absent(),
                Value<bool> travaille = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> dureeMinutes = const Value.absent(),
                Value<int> valeur = const Value.absent(),
                Value<int> idLogement = const Value.absent(),
              }) => VisitesCompanion(
                idVisite: idVisite,
                status: status,
                present: present,
                commentaire: commentaire,
                resultat: resultat,
                travaille: travaille,
                date: date,
                dureeMinutes: dureeMinutes,
                valeur: valeur,
                idLogement: idLogement,
              ),
          createCompanionCallback:
              ({
                Value<int> idVisite = const Value.absent(),
                required String status,
                required bool present,
                Value<String?> commentaire = const Value.absent(),
                required String resultat,
                required bool travaille,
                required DateTime date,
                required int dureeMinutes,
                required int valeur,
                required int idLogement,
              }) => VisitesCompanion.insert(
                idVisite: idVisite,
                status: status,
                present: present,
                commentaire: commentaire,
                resultat: resultat,
                travaille: travaille,
                date: date,
                dureeMinutes: dureeMinutes,
                valeur: valeur,
                idLogement: idLogement,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$VisitesTable, Visite>(table),
                  $$VisitesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                idLogement = false,
                etatLieuxsRefs = false,
                resultatsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (etatLieuxsRefs) db.etatLieuxs,
                    if (resultatsRefs) db.resultats,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (idLogement) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idLogement,
                                    referencedTable: $$VisitesTableReferences
                                        ._idLogementTable(db),
                                    referencedColumn: $$VisitesTableReferences
                                        ._idLogementTable(db)
                                        .idLogement,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (etatLieuxsRefs)
                        await $_getPrefetchedDataByColumns<
                          Visite,
                          $VisitesTable,
                          EtatLieux,
                          $EtatLieuxsTable
                        >(
                          currentTable: table,
                          referencedTable: $$VisitesTableReferences
                              ._etatLieuxsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VisitesTableReferences(
                                db,
                                table,
                                p0,
                              ).etatLieuxsRefs,
                          currentColumn: 'id_visite',
                          referencedColumn: 'id_visite',
                          typedResults: items,
                        ),
                      if (resultatsRefs)
                        await $_getPrefetchedDataByColumns<
                          Visite,
                          $VisitesTable,
                          ResultatVisite,
                          $ResultatsTable
                        >(
                          currentTable: table,
                          referencedTable: $$VisitesTableReferences
                              ._resultatsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VisitesTableReferences(
                                db,
                                table,
                                p0,
                              ).resultatsRefs,
                          currentColumn: 'id_visite',
                          referencedColumn: 'id_visite',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$VisitesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VisitesTable,
      Visite,
      $$VisitesTableFilterComposer,
      $$VisitesTableOrderingComposer,
      $$VisitesTableAnnotationComposer,
      $$VisitesTableCreateCompanionBuilder,
      $$VisitesTableUpdateCompanionBuilder,
      (Visite, $$VisitesTableReferences),
      Visite,
      PrefetchHooks Function({
        bool idLogement,
        bool etatLieuxsRefs,
        bool resultatsRefs,
      })
    >;
typedef $$ContenuesTableCreateCompanionBuilder =
    ContenuesCompanion Function({
      Value<int> idContenue,
      required String type,
      required String path,
    });
typedef $$ContenuesTableUpdateCompanionBuilder =
    ContenuesCompanion Function({
      Value<int> idContenue,
      Value<String> type,
      Value<String> path,
    });

final class $$ContenuesTableReferences
    extends BaseReferences<_$AppDatabase, $ContenuesTable, Contenue> {
  $$ContenuesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ContenuSourcesTable, List<ContenuSource>>
  _contenuSourcesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.contenuSources,
    aliasName: 'contenues__id_contenue__contenu_sources__id_contenue',
  );

  $$ContenuSourcesTableProcessedTableManager get contenuSourcesRefs {
    final manager = $$ContenuSourcesTableTableManager($_db, $_db.contenuSources)
        .filter(
          (f) => f.idContenue.idContenue.sqlEquals(
            $_itemColumn<int>('id_contenue')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_contenuSourcesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ContenuesTableFilterComposer
    extends Composer<_$AppDatabase, $ContenuesTable> {
  $$ContenuesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idContenue => $composableBuilder(
    column: $table.idContenue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> contenuSourcesRefs(
    Expression<bool> Function($$ContenuSourcesTableFilterComposer f) f,
  ) {
    final $$ContenuSourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idContenue,
      referencedTable: $db.contenuSources,
      getReferencedColumn: (t) => t.idContenue,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContenuSourcesTableFilterComposer(
            $db: $db,
            $table: $db.contenuSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ContenuesTableOrderingComposer
    extends Composer<_$AppDatabase, $ContenuesTable> {
  $$ContenuesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idContenue => $composableBuilder(
    column: $table.idContenue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get path => $composableBuilder(
    column: $table.path,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ContenuesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContenuesTable> {
  $$ContenuesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idContenue => $composableBuilder(
    column: $table.idContenue,
    builder: (column) => column,
  );

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get path =>
      $composableBuilder(column: $table.path, builder: (column) => column);

  Expression<T> contenuSourcesRefs<T extends Object>(
    Expression<T> Function($$ContenuSourcesTableAnnotationComposer a) f,
  ) {
    final $$ContenuSourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idContenue,
      referencedTable: $db.contenuSources,
      getReferencedColumn: (t) => t.idContenue,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContenuSourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.contenuSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ContenuesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ContenuesTable,
          Contenue,
          $$ContenuesTableFilterComposer,
          $$ContenuesTableOrderingComposer,
          $$ContenuesTableAnnotationComposer,
          $$ContenuesTableCreateCompanionBuilder,
          $$ContenuesTableUpdateCompanionBuilder,
          (Contenue, $$ContenuesTableReferences),
          Contenue,
          PrefetchHooks Function({bool contenuSourcesRefs})
        > {
  $$ContenuesTableTableManager(_$AppDatabase db, $ContenuesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContenuesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContenuesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContenuesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idContenue = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> path = const Value.absent(),
              }) => ContenuesCompanion(
                idContenue: idContenue,
                type: type,
                path: path,
              ),
          createCompanionCallback:
              ({
                Value<int> idContenue = const Value.absent(),
                required String type,
                required String path,
              }) => ContenuesCompanion.insert(
                idContenue: idContenue,
                type: type,
                path: path,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ContenuesTable, Contenue>(table),
                  $$ContenuesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({contenuSourcesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (contenuSourcesRefs) db.contenuSources,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (contenuSourcesRefs)
                    await $_getPrefetchedDataByColumns<
                      Contenue,
                      $ContenuesTable,
                      ContenuSource,
                      $ContenuSourcesTable
                    >(
                      currentTable: table,
                      referencedTable: $$ContenuesTableReferences
                          ._contenuSourcesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ContenuesTableReferences(
                            db,
                            table,
                            p0,
                          ).contenuSourcesRefs,
                      currentColumn: 'id_contenue',
                      referencedColumn: 'id_contenue',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ContenuesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ContenuesTable,
      Contenue,
      $$ContenuesTableFilterComposer,
      $$ContenuesTableOrderingComposer,
      $$ContenuesTableAnnotationComposer,
      $$ContenuesTableCreateCompanionBuilder,
      $$ContenuesTableUpdateCompanionBuilder,
      (Contenue, $$ContenuesTableReferences),
      Contenue,
      PrefetchHooks Function({bool contenuSourcesRefs})
    >;
typedef $$EtatLieuxsTableCreateCompanionBuilder =
    EtatLieuxsCompanion Function({
      Value<int> idEtatParametre,
      required String resultat,
      required int valeur,
      required DateTime date,
      required int idVisite,
      required int idLogement,
    });
typedef $$EtatLieuxsTableUpdateCompanionBuilder =
    EtatLieuxsCompanion Function({
      Value<int> idEtatParametre,
      Value<String> resultat,
      Value<int> valeur,
      Value<DateTime> date,
      Value<int> idVisite,
      Value<int> idLogement,
    });

final class $$EtatLieuxsTableReferences
    extends BaseReferences<_$AppDatabase, $EtatLieuxsTable, EtatLieux> {
  $$EtatLieuxsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $VisitesTable _idVisiteTable(_$AppDatabase db) =>
      db.visites.createAlias('etat_lieuxs__id_visite__visites__id_visite');

  $$VisitesTableProcessedTableManager get idVisite {
    final $_column = $_itemColumn<int>('id_visite')!;

    final manager = $$VisitesTableTableManager(
      $_db,
      $_db.visites,
    ).filter((f) => f.idVisite.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idVisiteTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LogementsTable _idLogementTable(_$AppDatabase db) => db.logements
      .createAlias('etat_lieuxs__id_logement__logements__id_logement');

  $$LogementsTableProcessedTableManager get idLogement {
    final $_column = $_itemColumn<int>('id_logement')!;

    final manager = $$LogementsTableTableManager(
      $_db,
      $_db.logements,
    ).filter((f) => f.idLogement.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idLogementTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ContenuSourcesTable, List<ContenuSource>>
  _contenuSourcesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.contenuSources,
    aliasName:
        'etat_lieuxs__id_etat_parametre__contenu_sources__id_etat_parametre',
  );

  $$ContenuSourcesTableProcessedTableManager get contenuSourcesRefs {
    final manager = $$ContenuSourcesTableTableManager($_db, $_db.contenuSources)
        .filter(
          (f) => f.idEtatParametre.idEtatParametre.sqlEquals(
            $_itemColumn<int>('id_etat_parametre')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_contenuSourcesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$VerifEtatsTable, List<VerifEtat>>
  _verifEtatsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.verifEtats,
    aliasName: 'etat_lieuxs__id_etat_parametre__verif_etats__id_etat_parametre',
  );

  $$VerifEtatsTableProcessedTableManager get verifEtatsRefs {
    final manager = $$VerifEtatsTableTableManager($_db, $_db.verifEtats).filter(
      (f) => f.idEtatParametre.idEtatParametre.sqlEquals(
        $_itemColumn<int>('id_etat_parametre')!,
      ),
    );

    final cache = $_typedResult.readTableOrNull(_verifEtatsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$EtatLieuxsTableFilterComposer
    extends Composer<_$AppDatabase, $EtatLieuxsTable> {
  $$EtatLieuxsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idEtatParametre => $composableBuilder(
    column: $table.idEtatParametre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get resultat => $composableBuilder(
    column: $table.resultat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get valeur => $composableBuilder(
    column: $table.valeur,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  $$VisitesTableFilterComposer get idVisite {
    final $$VisitesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idVisite,
      referencedTable: $db.visites,
      getReferencedColumn: (t) => t.idVisite,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitesTableFilterComposer(
            $db: $db,
            $table: $db.visites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LogementsTableFilterComposer get idLogement {
    final $$LogementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.logements,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogementsTableFilterComposer(
            $db: $db,
            $table: $db.logements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> contenuSourcesRefs(
    Expression<bool> Function($$ContenuSourcesTableFilterComposer f) f,
  ) {
    final $$ContenuSourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEtatParametre,
      referencedTable: $db.contenuSources,
      getReferencedColumn: (t) => t.idEtatParametre,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContenuSourcesTableFilterComposer(
            $db: $db,
            $table: $db.contenuSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> verifEtatsRefs(
    Expression<bool> Function($$VerifEtatsTableFilterComposer f) f,
  ) {
    final $$VerifEtatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEtatParametre,
      referencedTable: $db.verifEtats,
      getReferencedColumn: (t) => t.idEtatParametre,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VerifEtatsTableFilterComposer(
            $db: $db,
            $table: $db.verifEtats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EtatLieuxsTableOrderingComposer
    extends Composer<_$AppDatabase, $EtatLieuxsTable> {
  $$EtatLieuxsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idEtatParametre => $composableBuilder(
    column: $table.idEtatParametre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get resultat => $composableBuilder(
    column: $table.resultat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get valeur => $composableBuilder(
    column: $table.valeur,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  $$VisitesTableOrderingComposer get idVisite {
    final $$VisitesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idVisite,
      referencedTable: $db.visites,
      getReferencedColumn: (t) => t.idVisite,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitesTableOrderingComposer(
            $db: $db,
            $table: $db.visites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LogementsTableOrderingComposer get idLogement {
    final $$LogementsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.logements,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogementsTableOrderingComposer(
            $db: $db,
            $table: $db.logements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$EtatLieuxsTableAnnotationComposer
    extends Composer<_$AppDatabase, $EtatLieuxsTable> {
  $$EtatLieuxsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idEtatParametre => $composableBuilder(
    column: $table.idEtatParametre,
    builder: (column) => column,
  );

  GeneratedColumn<String> get resultat =>
      $composableBuilder(column: $table.resultat, builder: (column) => column);

  GeneratedColumn<int> get valeur =>
      $composableBuilder(column: $table.valeur, builder: (column) => column);

  GeneratedColumn<DateTime> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  $$VisitesTableAnnotationComposer get idVisite {
    final $$VisitesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idVisite,
      referencedTable: $db.visites,
      getReferencedColumn: (t) => t.idVisite,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitesTableAnnotationComposer(
            $db: $db,
            $table: $db.visites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LogementsTableAnnotationComposer get idLogement {
    final $$LogementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.logements,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogementsTableAnnotationComposer(
            $db: $db,
            $table: $db.logements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> contenuSourcesRefs<T extends Object>(
    Expression<T> Function($$ContenuSourcesTableAnnotationComposer a) f,
  ) {
    final $$ContenuSourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEtatParametre,
      referencedTable: $db.contenuSources,
      getReferencedColumn: (t) => t.idEtatParametre,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContenuSourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.contenuSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> verifEtatsRefs<T extends Object>(
    Expression<T> Function($$VerifEtatsTableAnnotationComposer a) f,
  ) {
    final $$VerifEtatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEtatParametre,
      referencedTable: $db.verifEtats,
      getReferencedColumn: (t) => t.idEtatParametre,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VerifEtatsTableAnnotationComposer(
            $db: $db,
            $table: $db.verifEtats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$EtatLieuxsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $EtatLieuxsTable,
          EtatLieux,
          $$EtatLieuxsTableFilterComposer,
          $$EtatLieuxsTableOrderingComposer,
          $$EtatLieuxsTableAnnotationComposer,
          $$EtatLieuxsTableCreateCompanionBuilder,
          $$EtatLieuxsTableUpdateCompanionBuilder,
          (EtatLieux, $$EtatLieuxsTableReferences),
          EtatLieux,
          PrefetchHooks Function({
            bool idVisite,
            bool idLogement,
            bool contenuSourcesRefs,
            bool verifEtatsRefs,
          })
        > {
  $$EtatLieuxsTableTableManager(_$AppDatabase db, $EtatLieuxsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$EtatLieuxsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$EtatLieuxsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$EtatLieuxsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idEtatParametre = const Value.absent(),
                Value<String> resultat = const Value.absent(),
                Value<int> valeur = const Value.absent(),
                Value<DateTime> date = const Value.absent(),
                Value<int> idVisite = const Value.absent(),
                Value<int> idLogement = const Value.absent(),
              }) => EtatLieuxsCompanion(
                idEtatParametre: idEtatParametre,
                resultat: resultat,
                valeur: valeur,
                date: date,
                idVisite: idVisite,
                idLogement: idLogement,
              ),
          createCompanionCallback:
              ({
                Value<int> idEtatParametre = const Value.absent(),
                required String resultat,
                required int valeur,
                required DateTime date,
                required int idVisite,
                required int idLogement,
              }) => EtatLieuxsCompanion.insert(
                idEtatParametre: idEtatParametre,
                resultat: resultat,
                valeur: valeur,
                date: date,
                idVisite: idVisite,
                idLogement: idLogement,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$EtatLieuxsTable, EtatLieux>(table),
                  $$EtatLieuxsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                idVisite = false,
                idLogement = false,
                contenuSourcesRefs = false,
                verifEtatsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (contenuSourcesRefs) db.contenuSources,
                    if (verifEtatsRefs) db.verifEtats,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (idVisite) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idVisite,
                                    referencedTable: $$EtatLieuxsTableReferences
                                        ._idVisiteTable(db),
                                    referencedColumn:
                                        $$EtatLieuxsTableReferences
                                            ._idVisiteTable(db)
                                            .idVisite,
                                  )
                                  as T;
                        }
                        if (idLogement) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idLogement,
                                    referencedTable: $$EtatLieuxsTableReferences
                                        ._idLogementTable(db),
                                    referencedColumn:
                                        $$EtatLieuxsTableReferences
                                            ._idLogementTable(db)
                                            .idLogement,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (contenuSourcesRefs)
                        await $_getPrefetchedDataByColumns<
                          EtatLieux,
                          $EtatLieuxsTable,
                          ContenuSource,
                          $ContenuSourcesTable
                        >(
                          currentTable: table,
                          referencedTable: $$EtatLieuxsTableReferences
                              ._contenuSourcesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EtatLieuxsTableReferences(
                                db,
                                table,
                                p0,
                              ).contenuSourcesRefs,
                          currentColumn: 'id_etat_parametre',
                          referencedColumn: 'id_etat_parametre',
                          typedResults: items,
                        ),
                      if (verifEtatsRefs)
                        await $_getPrefetchedDataByColumns<
                          EtatLieux,
                          $EtatLieuxsTable,
                          VerifEtat,
                          $VerifEtatsTable
                        >(
                          currentTable: table,
                          referencedTable: $$EtatLieuxsTableReferences
                              ._verifEtatsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$EtatLieuxsTableReferences(
                                db,
                                table,
                                p0,
                              ).verifEtatsRefs,
                          currentColumn: 'id_etat_parametre',
                          referencedColumn: 'id_etat_parametre',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$EtatLieuxsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $EtatLieuxsTable,
      EtatLieux,
      $$EtatLieuxsTableFilterComposer,
      $$EtatLieuxsTableOrderingComposer,
      $$EtatLieuxsTableAnnotationComposer,
      $$EtatLieuxsTableCreateCompanionBuilder,
      $$EtatLieuxsTableUpdateCompanionBuilder,
      (EtatLieux, $$EtatLieuxsTableReferences),
      EtatLieux,
      PrefetchHooks Function({
        bool idVisite,
        bool idLogement,
        bool contenuSourcesRefs,
        bool verifEtatsRefs,
      })
    >;
typedef $$PersonnesTableCreateCompanionBuilder =
    PersonnesCompanion Function({
      Value<int> idPersonne,
      required String numeroTel,
      required String prenom,
      required String nom,
      Value<String?> commentaire,
      required int idLogement,
    });
typedef $$PersonnesTableUpdateCompanionBuilder =
    PersonnesCompanion Function({
      Value<int> idPersonne,
      Value<String> numeroTel,
      Value<String> prenom,
      Value<String> nom,
      Value<String?> commentaire,
      Value<int> idLogement,
    });

final class $$PersonnesTableReferences
    extends BaseReferences<_$AppDatabase, $PersonnesTable, Personne> {
  $$PersonnesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LogementsTable _idLogementTable(_$AppDatabase db) => db.logements
      .createAlias('personnes__id_logement__logements__id_logement');

  $$LogementsTableProcessedTableManager get idLogement {
    final $_column = $_itemColumn<int>('id_logement')!;

    final manager = $$LogementsTableTableManager(
      $_db,
      $_db.logements,
    ).filter((f) => f.idLogement.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idLogementTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$OrdreVisitesTable, List<OrdreVisite>>
  _ordreVisitesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.ordreVisites,
    aliasName: 'personnes__id_personne__ordre_visites__id_personne',
  );

  $$OrdreVisitesTableProcessedTableManager get ordreVisitesRefs {
    final manager = $$OrdreVisitesTableTableManager($_db, $_db.ordreVisites)
        .filter(
          (f) => f.idPersonne.idPersonne.sqlEquals(
            $_itemColumn<int>('id_personne')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_ordreVisitesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ResultatsTable, List<ResultatVisite>>
  _resultatsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.resultats,
    aliasName: 'personnes__id_personne__resultats__id_personne',
  );

  $$ResultatsTableProcessedTableManager get resultatsRefs {
    final manager = $$ResultatsTableTableManager($_db, $_db.resultats).filter(
      (f) =>
          f.idPersonne.idPersonne.sqlEquals($_itemColumn<int>('id_personne')!),
    );

    final cache = $_typedResult.readTableOrNull(_resultatsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$PersonnesTableFilterComposer
    extends Composer<_$AppDatabase, $PersonnesTable> {
  $$PersonnesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idPersonne => $composableBuilder(
    column: $table.idPersonne,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get numeroTel => $composableBuilder(
    column: $table.numeroTel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get prenom => $composableBuilder(
    column: $table.prenom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nom => $composableBuilder(
    column: $table.nom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get commentaire => $composableBuilder(
    column: $table.commentaire,
    builder: (column) => ColumnFilters(column),
  );

  $$LogementsTableFilterComposer get idLogement {
    final $$LogementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.logements,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogementsTableFilterComposer(
            $db: $db,
            $table: $db.logements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> ordreVisitesRefs(
    Expression<bool> Function($$OrdreVisitesTableFilterComposer f) f,
  ) {
    final $$OrdreVisitesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPersonne,
      referencedTable: $db.ordreVisites,
      getReferencedColumn: (t) => t.idPersonne,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdreVisitesTableFilterComposer(
            $db: $db,
            $table: $db.ordreVisites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> resultatsRefs(
    Expression<bool> Function($$ResultatsTableFilterComposer f) f,
  ) {
    final $$ResultatsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPersonne,
      referencedTable: $db.resultats,
      getReferencedColumn: (t) => t.idPersonne,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResultatsTableFilterComposer(
            $db: $db,
            $table: $db.resultats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PersonnesTableOrderingComposer
    extends Composer<_$AppDatabase, $PersonnesTable> {
  $$PersonnesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idPersonne => $composableBuilder(
    column: $table.idPersonne,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get numeroTel => $composableBuilder(
    column: $table.numeroTel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get prenom => $composableBuilder(
    column: $table.prenom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nom => $composableBuilder(
    column: $table.nom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get commentaire => $composableBuilder(
    column: $table.commentaire,
    builder: (column) => ColumnOrderings(column),
  );

  $$LogementsTableOrderingComposer get idLogement {
    final $$LogementsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.logements,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogementsTableOrderingComposer(
            $db: $db,
            $table: $db.logements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PersonnesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PersonnesTable> {
  $$PersonnesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idPersonne => $composableBuilder(
    column: $table.idPersonne,
    builder: (column) => column,
  );

  GeneratedColumn<String> get numeroTel =>
      $composableBuilder(column: $table.numeroTel, builder: (column) => column);

  GeneratedColumn<String> get prenom =>
      $composableBuilder(column: $table.prenom, builder: (column) => column);

  GeneratedColumn<String> get nom =>
      $composableBuilder(column: $table.nom, builder: (column) => column);

  GeneratedColumn<String> get commentaire => $composableBuilder(
    column: $table.commentaire,
    builder: (column) => column,
  );

  $$LogementsTableAnnotationComposer get idLogement {
    final $$LogementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.logements,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogementsTableAnnotationComposer(
            $db: $db,
            $table: $db.logements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> ordreVisitesRefs<T extends Object>(
    Expression<T> Function($$OrdreVisitesTableAnnotationComposer a) f,
  ) {
    final $$OrdreVisitesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPersonne,
      referencedTable: $db.ordreVisites,
      getReferencedColumn: (t) => t.idPersonne,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$OrdreVisitesTableAnnotationComposer(
            $db: $db,
            $table: $db.ordreVisites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> resultatsRefs<T extends Object>(
    Expression<T> Function($$ResultatsTableAnnotationComposer a) f,
  ) {
    final $$ResultatsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPersonne,
      referencedTable: $db.resultats,
      getReferencedColumn: (t) => t.idPersonne,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ResultatsTableAnnotationComposer(
            $db: $db,
            $table: $db.resultats,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$PersonnesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PersonnesTable,
          Personne,
          $$PersonnesTableFilterComposer,
          $$PersonnesTableOrderingComposer,
          $$PersonnesTableAnnotationComposer,
          $$PersonnesTableCreateCompanionBuilder,
          $$PersonnesTableUpdateCompanionBuilder,
          (Personne, $$PersonnesTableReferences),
          Personne,
          PrefetchHooks Function({
            bool idLogement,
            bool ordreVisitesRefs,
            bool resultatsRefs,
          })
        > {
  $$PersonnesTableTableManager(_$AppDatabase db, $PersonnesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PersonnesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PersonnesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PersonnesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idPersonne = const Value.absent(),
                Value<String> numeroTel = const Value.absent(),
                Value<String> prenom = const Value.absent(),
                Value<String> nom = const Value.absent(),
                Value<String?> commentaire = const Value.absent(),
                Value<int> idLogement = const Value.absent(),
              }) => PersonnesCompanion(
                idPersonne: idPersonne,
                numeroTel: numeroTel,
                prenom: prenom,
                nom: nom,
                commentaire: commentaire,
                idLogement: idLogement,
              ),
          createCompanionCallback:
              ({
                Value<int> idPersonne = const Value.absent(),
                required String numeroTel,
                required String prenom,
                required String nom,
                Value<String?> commentaire = const Value.absent(),
                required int idLogement,
              }) => PersonnesCompanion.insert(
                idPersonne: idPersonne,
                numeroTel: numeroTel,
                prenom: prenom,
                nom: nom,
                commentaire: commentaire,
                idLogement: idLogement,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PersonnesTable, Personne>(table),
                  $$PersonnesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                idLogement = false,
                ordreVisitesRefs = false,
                resultatsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (ordreVisitesRefs) db.ordreVisites,
                    if (resultatsRefs) db.resultats,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (idLogement) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idLogement,
                                    referencedTable: $$PersonnesTableReferences
                                        ._idLogementTable(db),
                                    referencedColumn: $$PersonnesTableReferences
                                        ._idLogementTable(db)
                                        .idLogement,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (ordreVisitesRefs)
                        await $_getPrefetchedDataByColumns<
                          Personne,
                          $PersonnesTable,
                          OrdreVisite,
                          $OrdreVisitesTable
                        >(
                          currentTable: table,
                          referencedTable: $$PersonnesTableReferences
                              ._ordreVisitesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PersonnesTableReferences(
                                db,
                                table,
                                p0,
                              ).ordreVisitesRefs,
                          currentColumn: 'id_personne',
                          referencedColumn: 'id_personne',
                          typedResults: items,
                        ),
                      if (resultatsRefs)
                        await $_getPrefetchedDataByColumns<
                          Personne,
                          $PersonnesTable,
                          ResultatVisite,
                          $ResultatsTable
                        >(
                          currentTable: table,
                          referencedTable: $$PersonnesTableReferences
                              ._resultatsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$PersonnesTableReferences(
                                db,
                                table,
                                p0,
                              ).resultatsRefs,
                          currentColumn: 'id_personne',
                          referencedColumn: 'id_personne',
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$PersonnesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PersonnesTable,
      Personne,
      $$PersonnesTableFilterComposer,
      $$PersonnesTableOrderingComposer,
      $$PersonnesTableAnnotationComposer,
      $$PersonnesTableCreateCompanionBuilder,
      $$PersonnesTableUpdateCompanionBuilder,
      (Personne, $$PersonnesTableReferences),
      Personne,
      PrefetchHooks Function({
        bool idLogement,
        bool ordreVisitesRefs,
        bool resultatsRefs,
      })
    >;
typedef $$OrdreVisitesTableCreateCompanionBuilder =
    OrdreVisitesCompanion Function({
      Value<int> idOrdreVisite,
      required int idPersonne,
      required int idLogement,
    });
typedef $$OrdreVisitesTableUpdateCompanionBuilder =
    OrdreVisitesCompanion Function({
      Value<int> idOrdreVisite,
      Value<int> idPersonne,
      Value<int> idLogement,
    });

final class $$OrdreVisitesTableReferences
    extends BaseReferences<_$AppDatabase, $OrdreVisitesTable, OrdreVisite> {
  $$OrdreVisitesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PersonnesTable _idPersonneTable(_$AppDatabase db) => db.personnes
      .createAlias('ordre_visites__id_personne__personnes__id_personne');

  $$PersonnesTableProcessedTableManager get idPersonne {
    final $_column = $_itemColumn<int>('id_personne')!;

    final manager = $$PersonnesTableTableManager(
      $_db,
      $_db.personnes,
    ).filter((f) => f.idPersonne.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idPersonneTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LogementsTable _idLogementTable(_$AppDatabase db) => db.logements
      .createAlias('ordre_visites__id_logement__logements__id_logement');

  $$LogementsTableProcessedTableManager get idLogement {
    final $_column = $_itemColumn<int>('id_logement')!;

    final manager = $$LogementsTableTableManager(
      $_db,
      $_db.logements,
    ).filter((f) => f.idLogement.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idLogementTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$OrdreVisitesTableFilterComposer
    extends Composer<_$AppDatabase, $OrdreVisitesTable> {
  $$OrdreVisitesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get idOrdreVisite => $composableBuilder(
    column: $table.idOrdreVisite,
    builder: (column) => ColumnFilters(column),
  );

  $$PersonnesTableFilterComposer get idPersonne {
    final $$PersonnesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPersonne,
      referencedTable: $db.personnes,
      getReferencedColumn: (t) => t.idPersonne,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonnesTableFilterComposer(
            $db: $db,
            $table: $db.personnes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LogementsTableFilterComposer get idLogement {
    final $$LogementsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.logements,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogementsTableFilterComposer(
            $db: $db,
            $table: $db.logements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrdreVisitesTableOrderingComposer
    extends Composer<_$AppDatabase, $OrdreVisitesTable> {
  $$OrdreVisitesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get idOrdreVisite => $composableBuilder(
    column: $table.idOrdreVisite,
    builder: (column) => ColumnOrderings(column),
  );

  $$PersonnesTableOrderingComposer get idPersonne {
    final $$PersonnesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPersonne,
      referencedTable: $db.personnes,
      getReferencedColumn: (t) => t.idPersonne,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonnesTableOrderingComposer(
            $db: $db,
            $table: $db.personnes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LogementsTableOrderingComposer get idLogement {
    final $$LogementsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.logements,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogementsTableOrderingComposer(
            $db: $db,
            $table: $db.logements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrdreVisitesTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrdreVisitesTable> {
  $$OrdreVisitesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get idOrdreVisite => $composableBuilder(
    column: $table.idOrdreVisite,
    builder: (column) => column,
  );

  $$PersonnesTableAnnotationComposer get idPersonne {
    final $$PersonnesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPersonne,
      referencedTable: $db.personnes,
      getReferencedColumn: (t) => t.idPersonne,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonnesTableAnnotationComposer(
            $db: $db,
            $table: $db.personnes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LogementsTableAnnotationComposer get idLogement {
    final $$LogementsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idLogement,
      referencedTable: $db.logements,
      getReferencedColumn: (t) => t.idLogement,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LogementsTableAnnotationComposer(
            $db: $db,
            $table: $db.logements,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$OrdreVisitesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $OrdreVisitesTable,
          OrdreVisite,
          $$OrdreVisitesTableFilterComposer,
          $$OrdreVisitesTableOrderingComposer,
          $$OrdreVisitesTableAnnotationComposer,
          $$OrdreVisitesTableCreateCompanionBuilder,
          $$OrdreVisitesTableUpdateCompanionBuilder,
          (OrdreVisite, $$OrdreVisitesTableReferences),
          OrdreVisite,
          PrefetchHooks Function({bool idPersonne, bool idLogement})
        > {
  $$OrdreVisitesTableTableManager(_$AppDatabase db, $OrdreVisitesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrdreVisitesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrdreVisitesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrdreVisitesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idOrdreVisite = const Value.absent(),
                Value<int> idPersonne = const Value.absent(),
                Value<int> idLogement = const Value.absent(),
              }) => OrdreVisitesCompanion(
                idOrdreVisite: idOrdreVisite,
                idPersonne: idPersonne,
                idLogement: idLogement,
              ),
          createCompanionCallback:
              ({
                Value<int> idOrdreVisite = const Value.absent(),
                required int idPersonne,
                required int idLogement,
              }) => OrdreVisitesCompanion.insert(
                idOrdreVisite: idOrdreVisite,
                idPersonne: idPersonne,
                idLogement: idLogement,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$OrdreVisitesTable, OrdreVisite>(table),
                  $$OrdreVisitesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idPersonne = false, idLogement = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idPersonne) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idPersonne,
                                referencedTable: $$OrdreVisitesTableReferences
                                    ._idPersonneTable(db),
                                referencedColumn: $$OrdreVisitesTableReferences
                                    ._idPersonneTable(db)
                                    .idPersonne,
                              )
                              as T;
                    }
                    if (idLogement) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idLogement,
                                referencedTable: $$OrdreVisitesTableReferences
                                    ._idLogementTable(db),
                                referencedColumn: $$OrdreVisitesTableReferences
                                    ._idLogementTable(db)
                                    .idLogement,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$OrdreVisitesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $OrdreVisitesTable,
      OrdreVisite,
      $$OrdreVisitesTableFilterComposer,
      $$OrdreVisitesTableOrderingComposer,
      $$OrdreVisitesTableAnnotationComposer,
      $$OrdreVisitesTableCreateCompanionBuilder,
      $$OrdreVisitesTableUpdateCompanionBuilder,
      (OrdreVisite, $$OrdreVisitesTableReferences),
      OrdreVisite,
      PrefetchHooks Function({bool idPersonne, bool idLogement})
    >;
typedef $$ContenuSourcesTableCreateCompanionBuilder =
    ContenuSourcesCompanion Function({
      required int idContenue,
      required int idEtatParametre,
      Value<int> rowid,
    });
typedef $$ContenuSourcesTableUpdateCompanionBuilder =
    ContenuSourcesCompanion Function({
      Value<int> idContenue,
      Value<int> idEtatParametre,
      Value<int> rowid,
    });

final class $$ContenuSourcesTableReferences
    extends BaseReferences<_$AppDatabase, $ContenuSourcesTable, ContenuSource> {
  $$ContenuSourcesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $ContenuesTable _idContenueTable(_$AppDatabase db) => db.contenues
      .createAlias('contenu_sources__id_contenue__contenues__id_contenue');

  $$ContenuesTableProcessedTableManager get idContenue {
    final $_column = $_itemColumn<int>('id_contenue')!;

    final manager = $$ContenuesTableTableManager(
      $_db,
      $_db.contenues,
    ).filter((f) => f.idContenue.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idContenueTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EtatLieuxsTable _idEtatParametreTable(_$AppDatabase db) =>
      db.etatLieuxs.createAlias(
        'contenu_sources__id_etat_parametre__etat_lieuxs__id_etat_parametre',
      );

  $$EtatLieuxsTableProcessedTableManager get idEtatParametre {
    final $_column = $_itemColumn<int>('id_etat_parametre')!;

    final manager = $$EtatLieuxsTableTableManager(
      $_db,
      $_db.etatLieuxs,
    ).filter((f) => f.idEtatParametre.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idEtatParametreTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ContenuSourcesTableFilterComposer
    extends Composer<_$AppDatabase, $ContenuSourcesTable> {
  $$ContenuSourcesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ContenuesTableFilterComposer get idContenue {
    final $$ContenuesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idContenue,
      referencedTable: $db.contenues,
      getReferencedColumn: (t) => t.idContenue,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContenuesTableFilterComposer(
            $db: $db,
            $table: $db.contenues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EtatLieuxsTableFilterComposer get idEtatParametre {
    final $$EtatLieuxsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEtatParametre,
      referencedTable: $db.etatLieuxs,
      getReferencedColumn: (t) => t.idEtatParametre,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EtatLieuxsTableFilterComposer(
            $db: $db,
            $table: $db.etatLieuxs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ContenuSourcesTableOrderingComposer
    extends Composer<_$AppDatabase, $ContenuSourcesTable> {
  $$ContenuSourcesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ContenuesTableOrderingComposer get idContenue {
    final $$ContenuesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idContenue,
      referencedTable: $db.contenues,
      getReferencedColumn: (t) => t.idContenue,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContenuesTableOrderingComposer(
            $db: $db,
            $table: $db.contenues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EtatLieuxsTableOrderingComposer get idEtatParametre {
    final $$EtatLieuxsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEtatParametre,
      referencedTable: $db.etatLieuxs,
      getReferencedColumn: (t) => t.idEtatParametre,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EtatLieuxsTableOrderingComposer(
            $db: $db,
            $table: $db.etatLieuxs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ContenuSourcesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ContenuSourcesTable> {
  $$ContenuSourcesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$ContenuesTableAnnotationComposer get idContenue {
    final $$ContenuesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idContenue,
      referencedTable: $db.contenues,
      getReferencedColumn: (t) => t.idContenue,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ContenuesTableAnnotationComposer(
            $db: $db,
            $table: $db.contenues,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EtatLieuxsTableAnnotationComposer get idEtatParametre {
    final $$EtatLieuxsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEtatParametre,
      referencedTable: $db.etatLieuxs,
      getReferencedColumn: (t) => t.idEtatParametre,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EtatLieuxsTableAnnotationComposer(
            $db: $db,
            $table: $db.etatLieuxs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ContenuSourcesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ContenuSourcesTable,
          ContenuSource,
          $$ContenuSourcesTableFilterComposer,
          $$ContenuSourcesTableOrderingComposer,
          $$ContenuSourcesTableAnnotationComposer,
          $$ContenuSourcesTableCreateCompanionBuilder,
          $$ContenuSourcesTableUpdateCompanionBuilder,
          (ContenuSource, $$ContenuSourcesTableReferences),
          ContenuSource,
          PrefetchHooks Function({bool idContenue, bool idEtatParametre})
        > {
  $$ContenuSourcesTableTableManager(
    _$AppDatabase db,
    $ContenuSourcesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ContenuSourcesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ContenuSourcesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ContenuSourcesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idContenue = const Value.absent(),
                Value<int> idEtatParametre = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ContenuSourcesCompanion(
                idContenue: idContenue,
                idEtatParametre: idEtatParametre,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int idContenue,
                required int idEtatParametre,
                Value<int> rowid = const Value.absent(),
              }) => ContenuSourcesCompanion.insert(
                idContenue: idContenue,
                idEtatParametre: idEtatParametre,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ContenuSourcesTable, ContenuSource>(table),
                  $$ContenuSourcesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({idContenue = false, idEtatParametre = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (idContenue) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idContenue,
                                    referencedTable:
                                        $$ContenuSourcesTableReferences
                                            ._idContenueTable(db),
                                    referencedColumn:
                                        $$ContenuSourcesTableReferences
                                            ._idContenueTable(db)
                                            .idContenue,
                                  )
                                  as T;
                        }
                        if (idEtatParametre) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idEtatParametre,
                                    referencedTable:
                                        $$ContenuSourcesTableReferences
                                            ._idEtatParametreTable(db),
                                    referencedColumn:
                                        $$ContenuSourcesTableReferences
                                            ._idEtatParametreTable(db)
                                            .idEtatParametre,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$ContenuSourcesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ContenuSourcesTable,
      ContenuSource,
      $$ContenuSourcesTableFilterComposer,
      $$ContenuSourcesTableOrderingComposer,
      $$ContenuSourcesTableAnnotationComposer,
      $$ContenuSourcesTableCreateCompanionBuilder,
      $$ContenuSourcesTableUpdateCompanionBuilder,
      (ContenuSource, $$ContenuSourcesTableReferences),
      ContenuSource,
      PrefetchHooks Function({bool idContenue, bool idEtatParametre})
    >;
typedef $$VerifEtatsTableCreateCompanionBuilder =
    VerifEtatsCompanion Function({
      required int idParametreAnalyse,
      required int idEtatParametre,
      required String resultat,
      required int valeur,
      Value<String?> commentaire,
      Value<int> rowid,
    });
typedef $$VerifEtatsTableUpdateCompanionBuilder =
    VerifEtatsCompanion Function({
      Value<int> idParametreAnalyse,
      Value<int> idEtatParametre,
      Value<String> resultat,
      Value<int> valeur,
      Value<String?> commentaire,
      Value<int> rowid,
    });

final class $$VerifEtatsTableReferences
    extends BaseReferences<_$AppDatabase, $VerifEtatsTable, VerifEtat> {
  $$VerifEtatsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $ParametreAnalysesTable _idParametreAnalyseTable(
    _$AppDatabase db,
  ) => db.parametreAnalyses.createAlias(
    'verif_etats__id_parametre_analyse__parametre_analyses__id_parametre_analyse',
  );

  $$ParametreAnalysesTableProcessedTableManager get idParametreAnalyse {
    final $_column = $_itemColumn<int>('id_parametre_analyse')!;

    final manager = $$ParametreAnalysesTableTableManager(
      $_db,
      $_db.parametreAnalyses,
    ).filter((f) => f.idParametreAnalyse.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idParametreAnalyseTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $EtatLieuxsTable _idEtatParametreTable(_$AppDatabase db) =>
      db.etatLieuxs.createAlias(
        'verif_etats__id_etat_parametre__etat_lieuxs__id_etat_parametre',
      );

  $$EtatLieuxsTableProcessedTableManager get idEtatParametre {
    final $_column = $_itemColumn<int>('id_etat_parametre')!;

    final manager = $$EtatLieuxsTableTableManager(
      $_db,
      $_db.etatLieuxs,
    ).filter((f) => f.idEtatParametre.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idEtatParametreTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$VerifEtatsTableFilterComposer
    extends Composer<_$AppDatabase, $VerifEtatsTable> {
  $$VerifEtatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get resultat => $composableBuilder(
    column: $table.resultat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get valeur => $composableBuilder(
    column: $table.valeur,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get commentaire => $composableBuilder(
    column: $table.commentaire,
    builder: (column) => ColumnFilters(column),
  );

  $$ParametreAnalysesTableFilterComposer get idParametreAnalyse {
    final $$ParametreAnalysesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idParametreAnalyse,
      referencedTable: $db.parametreAnalyses,
      getReferencedColumn: (t) => t.idParametreAnalyse,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParametreAnalysesTableFilterComposer(
            $db: $db,
            $table: $db.parametreAnalyses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EtatLieuxsTableFilterComposer get idEtatParametre {
    final $$EtatLieuxsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEtatParametre,
      referencedTable: $db.etatLieuxs,
      getReferencedColumn: (t) => t.idEtatParametre,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EtatLieuxsTableFilterComposer(
            $db: $db,
            $table: $db.etatLieuxs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VerifEtatsTableOrderingComposer
    extends Composer<_$AppDatabase, $VerifEtatsTable> {
  $$VerifEtatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get resultat => $composableBuilder(
    column: $table.resultat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get valeur => $composableBuilder(
    column: $table.valeur,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get commentaire => $composableBuilder(
    column: $table.commentaire,
    builder: (column) => ColumnOrderings(column),
  );

  $$ParametreAnalysesTableOrderingComposer get idParametreAnalyse {
    final $$ParametreAnalysesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idParametreAnalyse,
      referencedTable: $db.parametreAnalyses,
      getReferencedColumn: (t) => t.idParametreAnalyse,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ParametreAnalysesTableOrderingComposer(
            $db: $db,
            $table: $db.parametreAnalyses,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$EtatLieuxsTableOrderingComposer get idEtatParametre {
    final $$EtatLieuxsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEtatParametre,
      referencedTable: $db.etatLieuxs,
      getReferencedColumn: (t) => t.idEtatParametre,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EtatLieuxsTableOrderingComposer(
            $db: $db,
            $table: $db.etatLieuxs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VerifEtatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $VerifEtatsTable> {
  $$VerifEtatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get resultat =>
      $composableBuilder(column: $table.resultat, builder: (column) => column);

  GeneratedColumn<int> get valeur =>
      $composableBuilder(column: $table.valeur, builder: (column) => column);

  GeneratedColumn<String> get commentaire => $composableBuilder(
    column: $table.commentaire,
    builder: (column) => column,
  );

  $$ParametreAnalysesTableAnnotationComposer get idParametreAnalyse {
    final $$ParametreAnalysesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.idParametreAnalyse,
          referencedTable: $db.parametreAnalyses,
          getReferencedColumn: (t) => t.idParametreAnalyse,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ParametreAnalysesTableAnnotationComposer(
                $db: $db,
                $table: $db.parametreAnalyses,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }

  $$EtatLieuxsTableAnnotationComposer get idEtatParametre {
    final $$EtatLieuxsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idEtatParametre,
      referencedTable: $db.etatLieuxs,
      getReferencedColumn: (t) => t.idEtatParametre,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$EtatLieuxsTableAnnotationComposer(
            $db: $db,
            $table: $db.etatLieuxs,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VerifEtatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VerifEtatsTable,
          VerifEtat,
          $$VerifEtatsTableFilterComposer,
          $$VerifEtatsTableOrderingComposer,
          $$VerifEtatsTableAnnotationComposer,
          $$VerifEtatsTableCreateCompanionBuilder,
          $$VerifEtatsTableUpdateCompanionBuilder,
          (VerifEtat, $$VerifEtatsTableReferences),
          VerifEtat,
          PrefetchHooks Function({
            bool idParametreAnalyse,
            bool idEtatParametre,
          })
        > {
  $$VerifEtatsTableTableManager(_$AppDatabase db, $VerifEtatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VerifEtatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VerifEtatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VerifEtatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idParametreAnalyse = const Value.absent(),
                Value<int> idEtatParametre = const Value.absent(),
                Value<String> resultat = const Value.absent(),
                Value<int> valeur = const Value.absent(),
                Value<String?> commentaire = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VerifEtatsCompanion(
                idParametreAnalyse: idParametreAnalyse,
                idEtatParametre: idEtatParametre,
                resultat: resultat,
                valeur: valeur,
                commentaire: commentaire,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int idParametreAnalyse,
                required int idEtatParametre,
                required String resultat,
                required int valeur,
                Value<String?> commentaire = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VerifEtatsCompanion.insert(
                idParametreAnalyse: idParametreAnalyse,
                idEtatParametre: idEtatParametre,
                resultat: resultat,
                valeur: valeur,
                commentaire: commentaire,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$VerifEtatsTable, VerifEtat>(table),
                  $$VerifEtatsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({idParametreAnalyse = false, idEtatParametre = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (idParametreAnalyse) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idParametreAnalyse,
                                    referencedTable: $$VerifEtatsTableReferences
                                        ._idParametreAnalyseTable(db),
                                    referencedColumn:
                                        $$VerifEtatsTableReferences
                                            ._idParametreAnalyseTable(db)
                                            .idParametreAnalyse,
                                  )
                                  as T;
                        }
                        if (idEtatParametre) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.idEtatParametre,
                                    referencedTable: $$VerifEtatsTableReferences
                                        ._idEtatParametreTable(db),
                                    referencedColumn:
                                        $$VerifEtatsTableReferences
                                            ._idEtatParametreTable(db)
                                            .idEtatParametre,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$VerifEtatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VerifEtatsTable,
      VerifEtat,
      $$VerifEtatsTableFilterComposer,
      $$VerifEtatsTableOrderingComposer,
      $$VerifEtatsTableAnnotationComposer,
      $$VerifEtatsTableCreateCompanionBuilder,
      $$VerifEtatsTableUpdateCompanionBuilder,
      (VerifEtat, $$VerifEtatsTableReferences),
      VerifEtat,
      PrefetchHooks Function({bool idParametreAnalyse, bool idEtatParametre})
    >;
typedef $$ResultatsTableCreateCompanionBuilder =
    ResultatsCompanion Function({
      required int idPersonne,
      required int idVisite,
      Value<int> rowid,
    });
typedef $$ResultatsTableUpdateCompanionBuilder =
    ResultatsCompanion Function({
      Value<int> idPersonne,
      Value<int> idVisite,
      Value<int> rowid,
    });

final class $$ResultatsTableReferences
    extends BaseReferences<_$AppDatabase, $ResultatsTable, ResultatVisite> {
  $$ResultatsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $PersonnesTable _idPersonneTable(_$AppDatabase db) => db.personnes
      .createAlias('resultats__id_personne__personnes__id_personne');

  $$PersonnesTableProcessedTableManager get idPersonne {
    final $_column = $_itemColumn<int>('id_personne')!;

    final manager = $$PersonnesTableTableManager(
      $_db,
      $_db.personnes,
    ).filter((f) => f.idPersonne.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idPersonneTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $VisitesTable _idVisiteTable(_$AppDatabase db) =>
      db.visites.createAlias('resultats__id_visite__visites__id_visite');

  $$VisitesTableProcessedTableManager get idVisite {
    final $_column = $_itemColumn<int>('id_visite')!;

    final manager = $$VisitesTableTableManager(
      $_db,
      $_db.visites,
    ).filter((f) => f.idVisite.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_idVisiteTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ResultatsTableFilterComposer
    extends Composer<_$AppDatabase, $ResultatsTable> {
  $$ResultatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PersonnesTableFilterComposer get idPersonne {
    final $$PersonnesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPersonne,
      referencedTable: $db.personnes,
      getReferencedColumn: (t) => t.idPersonne,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonnesTableFilterComposer(
            $db: $db,
            $table: $db.personnes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VisitesTableFilterComposer get idVisite {
    final $$VisitesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idVisite,
      referencedTable: $db.visites,
      getReferencedColumn: (t) => t.idVisite,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitesTableFilterComposer(
            $db: $db,
            $table: $db.visites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResultatsTableOrderingComposer
    extends Composer<_$AppDatabase, $ResultatsTable> {
  $$ResultatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PersonnesTableOrderingComposer get idPersonne {
    final $$PersonnesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPersonne,
      referencedTable: $db.personnes,
      getReferencedColumn: (t) => t.idPersonne,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonnesTableOrderingComposer(
            $db: $db,
            $table: $db.personnes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VisitesTableOrderingComposer get idVisite {
    final $$VisitesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idVisite,
      referencedTable: $db.visites,
      getReferencedColumn: (t) => t.idVisite,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitesTableOrderingComposer(
            $db: $db,
            $table: $db.visites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResultatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $ResultatsTable> {
  $$ResultatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$PersonnesTableAnnotationComposer get idPersonne {
    final $$PersonnesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idPersonne,
      referencedTable: $db.personnes,
      getReferencedColumn: (t) => t.idPersonne,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PersonnesTableAnnotationComposer(
            $db: $db,
            $table: $db.personnes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$VisitesTableAnnotationComposer get idVisite {
    final $$VisitesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.idVisite,
      referencedTable: $db.visites,
      getReferencedColumn: (t) => t.idVisite,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VisitesTableAnnotationComposer(
            $db: $db,
            $table: $db.visites,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ResultatsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ResultatsTable,
          ResultatVisite,
          $$ResultatsTableFilterComposer,
          $$ResultatsTableOrderingComposer,
          $$ResultatsTableAnnotationComposer,
          $$ResultatsTableCreateCompanionBuilder,
          $$ResultatsTableUpdateCompanionBuilder,
          (ResultatVisite, $$ResultatsTableReferences),
          ResultatVisite,
          PrefetchHooks Function({bool idPersonne, bool idVisite})
        > {
  $$ResultatsTableTableManager(_$AppDatabase db, $ResultatsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ResultatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ResultatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ResultatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> idPersonne = const Value.absent(),
                Value<int> idVisite = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ResultatsCompanion(
                idPersonne: idPersonne,
                idVisite: idVisite,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required int idPersonne,
                required int idVisite,
                Value<int> rowid = const Value.absent(),
              }) => ResultatsCompanion.insert(
                idPersonne: idPersonne,
                idVisite: idVisite,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$ResultatsTable, ResultatVisite>(table),
                  $$ResultatsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({idPersonne = false, idVisite = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (idPersonne) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idPersonne,
                                referencedTable: $$ResultatsTableReferences
                                    ._idPersonneTable(db),
                                referencedColumn: $$ResultatsTableReferences
                                    ._idPersonneTable(db)
                                    .idPersonne,
                              )
                              as T;
                    }
                    if (idVisite) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.idVisite,
                                referencedTable: $$ResultatsTableReferences
                                    ._idVisiteTable(db),
                                referencedColumn: $$ResultatsTableReferences
                                    ._idVisiteTable(db)
                                    .idVisite,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ResultatsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ResultatsTable,
      ResultatVisite,
      $$ResultatsTableFilterComposer,
      $$ResultatsTableOrderingComposer,
      $$ResultatsTableAnnotationComposer,
      $$ResultatsTableCreateCompanionBuilder,
      $$ResultatsTableUpdateCompanionBuilder,
      (ResultatVisite, $$ResultatsTableReferences),
      ResultatVisite,
      PrefetchHooks Function({bool idPersonne, bool idVisite})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$LogementsTableTableManager get logements =>
      $$LogementsTableTableManager(_db, _db.logements);
  $$ParametreAnalysesTableTableManager get parametreAnalyses =>
      $$ParametreAnalysesTableTableManager(_db, _db.parametreAnalyses);
  $$VisitesTableTableManager get visites =>
      $$VisitesTableTableManager(_db, _db.visites);
  $$ContenuesTableTableManager get contenues =>
      $$ContenuesTableTableManager(_db, _db.contenues);
  $$EtatLieuxsTableTableManager get etatLieuxs =>
      $$EtatLieuxsTableTableManager(_db, _db.etatLieuxs);
  $$PersonnesTableTableManager get personnes =>
      $$PersonnesTableTableManager(_db, _db.personnes);
  $$OrdreVisitesTableTableManager get ordreVisites =>
      $$OrdreVisitesTableTableManager(_db, _db.ordreVisites);
  $$ContenuSourcesTableTableManager get contenuSources =>
      $$ContenuSourcesTableTableManager(_db, _db.contenuSources);
  $$VerifEtatsTableTableManager get verifEtats =>
      $$VerifEtatsTableTableManager(_db, _db.verifEtats);
  $$ResultatsTableTableManager get resultats =>
      $$ResultatsTableTableManager(_db, _db.resultats);
}
