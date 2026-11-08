import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/bdd/database.dart' as bdd;
import 'widgets/bdd_widgets.dart';

/// Création / modification d'un logement.
/// Retourne le logement enregistré via Navigator.pop.
class LogementEditPage extends StatefulWidget {
  const LogementEditPage({super.key, this.existant, this.adresseInitiale});

  final bdd.Logement? existant;
  final String? adresseInitiale;

  @override
  State<LogementEditPage> createState() => _LogementEditPageState();
}

class _LogementEditPageState extends State<LogementEditPage> {
  final _formKey = GlobalKey<FormState>();
  late final _adresse = TextEditingController(
    text: widget.existant?.adresse ?? widget.adresseInitiale ?? '',
  );
  late final _porte = TextEditingController(text: widget.existant?.porte ?? '');
  late final _code = TextEditingController(text: widget.existant?.code ?? '');
  late final _infos =
  TextEditingController(text: widget.existant?.infoSuplementaire ?? '');

  bool _enCours = false;

  bool get _edition => widget.existant != null;

  @override
  void dispose() {
    _adresse.dispose();
    _porte.dispose();
    _code.dispose();
    _infos.dispose();
    super.dispose();
  }

  Future<void> _enregistrer() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _enCours = true);

    final db = bdd.db;
    final navigator = Navigator.of(context);
    final code = nullSiVide(_code.text);
    final infos = nullSiVide(_infos.text);

    try {
      final int id;
      if (_edition) {
        id = widget.existant!.idLogement;
        await (db.update(db.logements)..where((t) => t.idLogement.equals(id)))
            .write(
          bdd.LogementsCompanion(
            adresse: Value(_adresse.text.trim()),
            porte: Value(_porte.text.trim()),
            code: Value(code),
            infoSuplementaire: Value(infos),
          ),
        );
      } else {
        id = await db.into(db.logements).insert(
          bdd.LogementsCompanion.insert(
            adresse: _adresse.text.trim(),
            porte: _porte.text.trim(),
            code: Value(code),
            infoSuplementaire: Value(infos),
          ),
        );
      }
      final resultat = await (db.select(db.logements)
        ..where((t) => t.idLogement.equals(id)))
          .getSingle();
      navigator.pop(resultat);
    } catch (e) {
      if (!mounted) return;
      setState(() => _enCours = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Enregistrement impossible : $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_edition ? 'Modifier le logement' : 'Nouveau logement'),
      ),
      body: Form(
        key: _formKey,
        child: ColonneCentree(
          children: [
            SectionCard(
              titre: 'Adresse',
              children: [
                TextFormField(
                  controller: _adresse,
                  textCapitalization: TextCapitalization.sentences,
                  inputFormatters: [LengthLimitingTextInputFormatter(150)],
                  decoration: const InputDecoration(
                    labelText: 'Adresse',
                    prefixIcon: Icon(Icons.home_outlined),
                    border: OutlineInputBorder(),
                  ),
                  validator: champObligatoire,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _porte,
                  inputFormatters: [LengthLimitingTextInputFormatter(50)],
                  decoration: const InputDecoration(
                    labelText: 'Porte',
                    prefixIcon: Icon(Icons.door_front_door_outlined),
                    border: OutlineInputBorder(),
                  ),
                  validator: champObligatoire,
                ),
              ],
            ),
            const SizedBox(height: 12),
            SectionCard(
              titre: 'Accès et informations',
              children: [
                TextFormField(
                  controller: _code,
                  inputFormatters: [LengthLimitingTextInputFormatter(50)],
                  decoration: const InputDecoration(
                    labelText: 'Code (facultatif)',
                    prefixIcon: Icon(Icons.key_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _infos,
                  maxLines: 4,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                    labelText: 'Infos supplémentaires (facultatif)',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: _enCours ? null : _enregistrer,
              icon: _enCours
                  ? const SizedBox(
                width: 16,
                height: 16,
                child: CircularProgressIndicator(strokeWidth: 2),
              )
                  : const Icon(Icons.check),
              label: Text(_edition ? 'Enregistrer' : 'Ajouter'),
            ),
          ],
        ),
      ),
    );
  }
}