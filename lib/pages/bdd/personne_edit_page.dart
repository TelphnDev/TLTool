import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../data/bdd/database.dart' as bdd;
import '../../data/bdd/depots.dart';
import 'gabarits.dart';
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
  late final _prenom =
      TextEditingController(text: widget.personne?.prenom ?? '');
  late final _nom = TextEditingController(text: widget.personne?.nom ?? '');
  late final _tel =
      TextEditingController(text: widget.personne?.numeroTel ?? '');
  late final _commentaire =
      TextEditingController(text: widget.personne?.commentaire ?? '');
  late bdd.Logement? _logement = widget.logement;

  bool get _edition => widget.personne != null;

  @override
  void dispose() {
    _prenom.dispose();
    _nom.dispose();
    _tel.dispose();
    _commentaire.dispose();
    super.dispose();
  }

  /// Appelée par PageFormulaire après validation des champs.
  Future<void> _enregistrer() async {
    await depotPersonnes.enregistrer(
      existant: widget.personne,
      prenom: _prenom.text.trim(),
      nom: _nom.text.trim(),
      tel: _tel.text.trim(),
      idLogement: _logement!.idLogement,
      commentaire: nullSiVide(_commentaire.text),
    );
    if (mounted) Navigator.of(context).pop(true);
  }

  @override
  Widget build(BuildContext context) {
    return PageFormulaire(
      titre: _edition ? 'Modifier la personne' : 'Nouvelle personne',
      icone: Icons.person_outline,
      libelleBouton: _edition ? 'Enregistrer' : 'Ajouter',
      onEnregistrer: _enregistrer,
      sections: [
        SectionCard(
          titre: 'Identité',
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ChampTexte(
                    controller: _prenom,
                    label: 'Prénom',
                    obligatoire: true,
                    capitalisation: TextCapitalization.words,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ChampTexte(
                    controller: _nom,
                    label: 'Nom',
                    obligatoire: true,
                    capitalisation: TextCapitalization.words,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            ChampTexte(
              controller: _tel,
              label: 'Téléphone',
              icone: Icons.phone_outlined,
              clavier: TextInputType.phone,
              maxLength: 10,
              formatters: [FilteringTextInputFormatter.digitsOnly],
              validator: (v) => (v == null || v.length != 10)
                  ? 'Le numéro doit contenir 10 chiffres'
                  : null,
            ),
          ],
        ),
        SectionCard(
          titre: 'Logement',
          children: [
            ChampLogement(
              valeur: _logement,
              onChange: (l) => setState(() => _logement = l),
            ),
            const SizedBox(height: 8),
            const TexteMuet(
              'Recherche un logement existant ou crée-en un nouveau.',
            ),
          ],
        ),
        SectionCard(
          titre: 'Commentaire',
          children: [
            ChampTexte(
              controller: _commentaire,
              label: 'Commentaire (facultatif)',
              lignes: 4,
              capitalisation: TextCapitalization.sentences,
            ),
          ],
        ),
      ],
    );
  }
}
