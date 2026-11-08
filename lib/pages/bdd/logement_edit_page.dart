import 'package:flutter/material.dart';

import '../../data/bdd/database.dart' as bdd;
import '../../data/bdd/depots.dart';
import 'gabarits.dart';
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
  late final _adresse = TextEditingController(
    text: widget.existant?.adresse ?? widget.adresseInitiale ?? '',
  );
  late final _porte = TextEditingController(text: widget.existant?.porte ?? '');
  late final _code = TextEditingController(text: widget.existant?.code ?? '');
  late final _infos =
      TextEditingController(text: widget.existant?.infoSuplementaire ?? '');

  bool get _edition => widget.existant != null;

  @override
  void dispose() {
    _adresse.dispose();
    _porte.dispose();
    _code.dispose();
    _infos.dispose();
    super.dispose();
  }

  /// Appelée par PageFormulaire après validation des champs.
  Future<void> _enregistrer() async {
    final logement = await depotLogements.enregistrer(
      existant: widget.existant,
      adresse: _adresse.text.trim(),
      porte: _porte.text.trim(),
      code: nullSiVide(_code.text),
      infos: nullSiVide(_infos.text),
    );
    if (mounted) Navigator.of(context).pop(logement);
  }

  @override
  Widget build(BuildContext context) {
    return PageFormulaire(
      titre: _edition ? 'Modifier le logement' : 'Nouveau logement',
      icone: Icons.home_outlined,
      libelleBouton: _edition ? 'Enregistrer' : 'Ajouter',
      onEnregistrer: _enregistrer,
      sections: [
        SectionCard(
          titre: 'Adresse',
          children: [
            ChampTexte(
              controller: _adresse,
              label: 'Adresse',
              icone: Icons.home_outlined,
              obligatoire: true,
              maxLength: 150,
              capitalisation: TextCapitalization.sentences,
            ),
            const SizedBox(height: 12),
            ChampTexte(
              controller: _porte,
              label: 'Porte',
              icone: Icons.door_front_door_outlined,
              obligatoire: true,
              maxLength: 50,
            ),
          ],
        ),
        SectionCard(
          titre: 'Accès et informations',
          children: [
            ChampTexte(
              controller: _code,
              label: 'Code (facultatif)',
              icone: Icons.key_outlined,
              maxLength: 50,
            ),
            const SizedBox(height: 12),
            ChampTexte(
              controller: _infos,
              label: 'Infos supplémentaires (facultatif)',
              lignes: 4,
              capitalisation: TextCapitalization.sentences,
            ),
          ],
        ),
      ],
    );
  }
}
