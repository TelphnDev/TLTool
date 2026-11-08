import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/bdd/database.dart' as bdd;
import 'widgets/bdd_widgets.dart';
import 'widgets/selecteur_logement.dart';

/// Création / modification d'une personne.
/// [logement] : logement actuel (édition) ou présélectionné (création).
class PersonneEditPage extends StatefulWidget {
  const PersonneEditPage({super.key, this.personne, this.logement});

  final bdd.Personne? personne;
  final bdd.Logement? logement;

  @override
  State<PersonneEditPage> createState() => _PersonneEditPageState();
}

class _PersonneEditPageState extends State<PersonneEditPage> {
  final _formKey = GlobalKey<FormState>();
  late final _prenom =
  TextEditingController(text: widget.personne?.prenom ?? '');
  late final _nom = TextEditingController(text: widget.personne?.nom ?? '');
  late final _tel =
  TextEditingController(text: widget.personne?.numeroTel ?? '');
  late final _commentaire =
  TextEditingController(text: widget.personne?.commentaire ?? '');
  late bdd.Logement? _logement = widget.logement;

  bool _enCours = false;

  bool get _edition => widget.personne != null;

  @override
  void dispose() {
    _prenom.dispose();
    _nom.dispose();
    _tel.dispose();
    _commentaire.dispose();
    super.dispose();
  }

  Future<void> _enregistrer() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _enCours = true);

    final db = bdd.db;
    final navigator = Navigator.of(context);
    final commentaire = nullSiVide(_commentaire.text);

    try {
      if (_edition) {
        final id = widget.personne!.idPersonne;
        await (db.update(db.personnes)..where((t) => t.idPersonne.equals(id)))
            .write(
          bdd.PersonnesCompanion(
            prenom: Value(_prenom.text.trim()),
            nom: Value(_nom.text.trim()),
            numeroTel: Value(_tel.text.trim()),
            idLogement: Value(_logement!.idLogement),
            commentaire: Value(commentaire),
          ),
        );
      } else {
        await db.into(db.personnes).insert(
          bdd.PersonnesCompanion.insert(
            prenom: _prenom.text.trim(),
            nom: _nom.text.trim(),
            numeroTel: _tel.text.trim(),
            idLogement: _logement!.idLogement,
            commentaire: Value(commentaire),
          ),
        );
      }
      navigator.pop(true);
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
        title: Text(_edition ? 'Modifier la personne' : 'Nouvelle personne'),
      ),
      body: Form(
        key: _formKey,
        child: ColonneCentree(
          children: [
            SectionCard(
              titre: 'Identité',
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _prenom,
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                          labelText: 'Prénom',
                          border: OutlineInputBorder(),
                        ),
                        validator: champObligatoire,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextFormField(
                        controller: _nom,
                        textCapitalization: TextCapitalization.words,
                        decoration: const InputDecoration(
                          labelText: 'Nom',
                          border: OutlineInputBorder(),
                        ),
                        validator: champObligatoire,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TextFormField(
                  controller: _tel,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: const InputDecoration(
                    labelText: 'Téléphone',
                    prefixIcon: Icon(Icons.phone_outlined),
                    border: OutlineInputBorder(),
                  ),
                  validator: (v) => (v == null || v.length != 10)
                      ? 'Le numéro doit contenir 10 chiffres'
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 12),
            SectionCard(
              titre: 'Logement',
              children: [
                FormField<bdd.Logement>(
                  initialValue: _logement,
                  validator: (v) => v == null ? 'Choisis un logement' : null,
                  builder: (state) {
                    final l = _logement;
                    return InkWell(
                      borderRadius: BorderRadius.circular(4),
                      onTap: () async {
                        final choix = await choisirLogement(
                          context,
                          selectionId: _logement?.idLogement,
                        );
                        if (choix != null) {
                          setState(() => _logement = choix);
                          state.didChange(choix);
                        }
                      },
                      child: InputDecorator(
                        isEmpty: l == null,
                        decoration: InputDecoration(
                          labelText: 'Logement',
                          prefixIcon: const Icon(Icons.home_outlined),
                          suffixIcon: const Icon(Icons.search),
                          border: const OutlineInputBorder(),
                          errorText: state.errorText,
                        ),
                        child: Text(
                          l == null ? '' : '${l.adresse} · porte ${l.porte}',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 8),
                const TexteMuet(
                  'Recherche un logement existant ou crée-en un nouveau.',
                ),
              ],
            ),
            const SizedBox(height: 12),
            SectionCard(
              titre: 'Commentaire',
              children: [
                TextFormField(
                  controller: _commentaire,
                  maxLines: 4,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                    labelText: 'Commentaire (facultatif)',
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