import 'package:flutter/material.dart';
import '../foundations/tokens.dart';

class TreinaeCard extends StatelessWidget {
  const TreinaeCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(16),
    this.highlighted = false,
  });
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final bool highlighted;
  @override
  Widget build(BuildContext context) {
    final c = TreinaeColors.of(context);
    return Material(
      color: highlighted ? c.sage : c.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: c.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}

enum TreinaeBadgeTone { neutral, success, danger }

class TreinaeBadge extends StatelessWidget {
  const TreinaeBadge(
    this.label, {
    super.key,
    this.tone = TreinaeBadgeTone.neutral,
  });
  final String label;
  final TreinaeBadgeTone tone;
  @override
  Widget build(BuildContext context) {
    final c = TreinaeColors.of(context);
    final danger = tone == TreinaeBadgeTone.danger;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: danger ? c.dangerBackground : c.sage,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (tone == TreinaeBadgeTone.success) ...[
            Icon(Icons.check, size: 14, color: c.primary),
            const SizedBox(width: 4),
          ],
          Flexible(
            child: Text(
              label,
              style: TreinaeTypography.caption.copyWith(
                color: danger ? c.danger : c.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TreinaeAvatar extends StatelessWidget {
  const TreinaeAvatar({
    super.key,
    required this.name,
    this.image,
    this.large = false,
    this.onTap,
  });
  final String name;
  final ImageProvider? image;
  final bool large;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    final c = TreinaeColors.of(context);
    final words = name.trim().split(RegExp(r'\s+')).where((s) => s.isNotEmpty);
    final initials = words
        .take(2)
        .map((s) => String.fromCharCode(s.runes.first))
        .join()
        .toUpperCase();
    final size = large ? 92.0 : 48.0;
    final fallback = Center(
      child: Text(
        initials.isEmpty ? '?' : initials,
        style: TextStyle(
          color: c.onPrimary,
          fontSize: large ? 24 : 14,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
    return Semantics(
      label: onTap == null ? 'Avatar de $name' : 'Abrir perfil de $name',
      button: onTap != null,
      child: Tooltip(
        message: name.isEmpty ? 'Perfil' : name,
        child: Material(
          color: c.primary,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: SizedBox(
              width: size,
              height: size,
              child: image == null
                  ? fallback
                  : Image(
                      image: image!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => fallback,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}

class TreinaeBrand extends StatelessWidget {
  const TreinaeBrand({super.key, this.showTagline = true});
  final bool showTagline;
  @override
  Widget build(BuildContext context) {
    final c = TreinaeColors.of(context);
    return Row(
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: c.sage,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(Icons.fitness_center, color: c.primary, size: 29),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Treinaê',
                style: TreinaeTypography.title.copyWith(
                  color: c.primary,
                  fontSize: 32,
                ),
              ),
              if (showTagline)
                Text(
                  'Seu treino, sua evolução.',
                  style: TreinaeTypography.caption.copyWith(color: c.muted),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class TreinaeEmptyState extends StatelessWidget {
  const TreinaeEmptyState({
    super.key,
    required this.title,
    required this.message,
    this.icon = Icons.fitness_center,
    this.action,
  });
  final String title, message;
  final IconData icon;
  final Widget? action;
  @override
  Widget build(BuildContext context) {
    final c = TreinaeColors.of(context);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: c.sage,
            child: Icon(icon, color: c.primary),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TreinaeTypography.heading,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TreinaeTypography.body.copyWith(color: c.muted),
          ),
          if (action != null) ...[const SizedBox(height: 20), action!],
        ],
      ),
    );
  }
}

class TreinaeSectionTitle extends StatelessWidget {
  const TreinaeSectionTitle(
    this.title, {
    super.key,
    this.actionLabel,
    this.onAction,
  });
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(child: Text(title, style: TreinaeTypography.heading)),
      if (actionLabel != null)
        TextButton(onPressed: onAction, child: Text(actionLabel!)),
    ],
  );
}
