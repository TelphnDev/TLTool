import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ---------------------------------------------------------------- helpers

String? nullSiVide(String s) {
  final t = s.trim();
  return t.isEmpty ? null : t;
}

String? champObligatoire(String? v) =>
    (v == null || v.trim().isEmpty) ? 'Champ obligatoire' : null;

String formaterTel(String t) {
  if (t.length != 10) return t;
  return [for (var i = 0; i < 10; i += 2) t.substring(i, i + 2)].join(' ');
}

String initialesDe(String prenom, String nom) {
  final a = prenom.isNotEmpty ? prenom[0] : '';
  final b = nom.isNotEmpty ? nom[0] : '';
  return (a + b).toUpperCase();
}

Future<bool> confirmer(
  BuildContext context, {
  required String titre,
  required String message,
  String action = 'Supprimer',
}) async {
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      title: Text(titre),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(ctx, false),
          child: const Text('Annuler'),
        ),
        FilledButton(
          onPressed: () => Navigator.pop(ctx, true),
          child: Text(action),
        ),
      ],
    ),
  );
  return ok ?? false;
}

// ---------------------------------------------------------------- mise en page

/// Liste verticale centrée, largeur max 720 (fiches et formulaires).
/// Gère aussi la zone de la barre d'état (pas d'AppBar sur ces pages).
class ColonneCentree extends StatelessWidget {
  const ColonneCentree({super.key, required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: children,
          ),
        ),
      ),
    );
  }
}

/// Carte de section avec un titre (fiches et formulaires).
class SectionCard extends StatelessWidget {
  const SectionCard({super.key, required this.titre, required this.children});

  final String titre;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: cs.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: cs.outlineVariant),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              titre.toUpperCase(),
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: cs.primary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.8,
                  ),
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }
}

/// Bouton rond semi-transparent, posé sur un bandeau dégradé.
class BoutonRond extends StatelessWidget {
  const BoutonRond({
    super.key,
    required this.icone,
    required this.tooltip,
    required this.onPressed,
    this.danger = false,
  });

  final IconData icone;
  final String tooltip;
  final VoidCallback onPressed;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return IconButton(
      tooltip: tooltip,
      icon: Icon(icone),
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: cs.surface.withValues(alpha: 0.55),
        foregroundColor: danger ? cs.error : cs.onPrimaryContainer,
      ),
    );
  }
}

/// Grand bandeau en haut d'une fiche. Remplace l'AppBar :
/// [onRetour] affiche le bouton retour, [actions] les boutons à droite.
class EnteteDetail extends StatelessWidget {
  const EnteteDetail({
    super.key,
    required this.avatar,
    required this.titre,
    this.sousTitre,
    this.badges = const [],
    this.onRetour,
    this.actions = const [],
  });

  final Widget avatar;
  final String titre;
  final String? sousTitre;
  final List<Widget> badges;
  final VoidCallback? onRetour;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;
    final aBarre = onRetour != null || actions.isNotEmpty;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(12, aBarre ? 12 : 28, 12, 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [cs.primaryContainer, cs.surfaceContainerLow],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          if (aBarre)
            Row(
              children: [
                if (onRetour != null)
                  BoutonRond(
                    icone: Icons.arrow_back,
                    tooltip: 'Retour',
                    onPressed: onRetour!,
                  ),
                const Spacer(),
                for (var i = 0; i < actions.length; i++) ...[
                  if (i > 0) const SizedBox(width: 6),
                  actions[i],
                ],
              ],
            ),
          if (aBarre) const SizedBox(height: 4),
          avatar,
          const SizedBox(height: 14),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              titre,
              textAlign: TextAlign.center,
              style: tt.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: cs.onPrimaryContainer,
              ),
            ),
          ),
          if (sousTitre != null) ...[
            const SizedBox(height: 4),
            Text(
              sousTitre!,
              textAlign: TextAlign.center,
              style: tt.bodyLarge?.copyWith(
                color: cs.onPrimaryContainer.withValues(alpha: 0.8),
              ),
            ),
          ],
          if (badges.isNotEmpty) ...[
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: badges,
            ),
          ],
        ],
      ),
    );
  }
}

/// Bandeau en haut d'un formulaire : retour + titre + icône.
class EnteteFormulaire extends StatelessWidget {
  const EnteteFormulaire({super.key, required this.titre, required this.icone});

  final String titre;
  final IconData icone;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(12, 12, 20, 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [cs.primaryContainer, cs.surfaceContainerLow],
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          BoutonRond(
            icone: Icons.arrow_back,
            tooltip: 'Retour',
            onPressed: () => Navigator.of(context).maybePop(),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              titre,
              style: tt.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: cs.onPrimaryContainer,
              ),
            ),
          ),
          CircleAvatar(
            radius: 22,
            backgroundColor: cs.primary,
            foregroundColor: cs.onPrimary,
            child: Icon(icone),
          ),
        ],
      ),
    );
  }
}

/// Petite pastille (ex. « 3 personnes »).
class BadgePill extends StatelessWidget {
  const BadgePill({
    super.key,
    required this.icone,
    required this.texte,
    this.discret = false,
  });

  final IconData icone;
  final String texte;
  final bool discret;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final fond = discret ? cs.surfaceContainerHighest : cs.secondaryContainer;
    final texteCouleur =
        discret ? cs.onSurfaceVariant : cs.onSecondaryContainer;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: fond,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icone, size: 14, color: texteCouleur),
          const SizedBox(width: 4),
          Flexible(
            child: Text(
              texte,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium
                  ?.copyWith(color: texteCouleur),
            ),
          ),
        ],
      ),
    );
  }
}

/// Ligne d'information d'une fiche : icône, libellé, valeur, bouton copier.
class InfoLigne extends StatelessWidget {
  const InfoLigne({
    super.key,
    required this.icone,
    required this.label,
    required this.valeur,
    this.aCopier,
  });

  final IconData icone;
  final String label;
  final String valeur;

  /// Si renseigné, un bouton « copier » apparaît.
  final String? aCopier;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final tt = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: cs.surfaceContainerHighest,
              shape: BoxShape.circle,
            ),
            child: Icon(icone, size: 20, color: cs.onSurfaceVariant),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: tt.bodySmall?.copyWith(color: cs.onSurfaceVariant),
                ),
                Text(valeur, style: tt.bodyLarge),
              ],
            ),
          ),
          if (aCopier != null)
            IconButton(
              tooltip: 'Copier',
              icon: const Icon(Icons.copy_outlined, size: 20),
              onPressed: () {
                Clipboard.setData(ClipboardData(text: aCopier!));
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Copié'),
                    duration: Duration(seconds: 1),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}

/// Texte grisé pour les valeurs absentes (« Aucun commentaire »).
class TexteMuet extends StatelessWidget {
  const TexteMuet(this.texte, {super.key});

  final String texte;

  @override
  Widget build(BuildContext context) {
    return Text(
      texte,
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
            fontStyle: FontStyle.italic,
          ),
    );
  }
}

// ---------------------------------------------------------------- listes

/// Carte d'une liste (Personne, Logement).
class CarteListe extends StatelessWidget {
  const CarteListe({
    super.key,
    required this.leading,
    required this.children,
    required this.onTap,
  });

  final Widget leading;
  final List<Widget> children;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      color: cs.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: cs.outlineVariant),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              leading,
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: children,
                ),
              ),
              Icon(Icons.chevron_right, color: cs.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}

/// Ligne compacte (icône + texte) dans une carte de liste.
class LigneCompacte extends StatelessWidget {
  const LigneCompacte({super.key, required this.icone, required this.texte});

  final IconData icone;
  final String texte;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.only(top: 2),
      child: Row(
        children: [
          Icon(icone, size: 16, color: cs.onSurfaceVariant),
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              texte,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: cs.onSurfaceVariant),
            ),
          ),
        ],
      ),
    );
  }
}

class EtatVide extends StatelessWidget {
  const EtatVide({
    super.key,
    required this.icone,
    required this.titre,
    required this.message,
  });

  final IconData icone;
  final String titre;
  final String message;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: [
          Icon(icone, size: 56, color: cs.outline),
          const SizedBox(height: 12),
          Text(titre, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 4),
          Text(
            message,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: cs.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
