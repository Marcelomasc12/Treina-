import 'package:flutter/material.dart';
import '../foundations/tokens.dart';

enum TreinaeButtonVariant { primary, secondary, ghost, danger }

class TreinaeButton extends StatelessWidget {
  const TreinaeButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.variant = TreinaeButtonVariant.primary,
    this.icon,
    this.loading = false,
    this.fullWidth = true,
    this.compact = false,
  });
  final String label;
  final VoidCallback? onPressed;
  final TreinaeButtonVariant variant;
  final IconData? icon;
  final bool loading, fullWidth, compact;

  @override
  Widget build(BuildContext context) {
    final c = TreinaeColors.of(context);
    final disabled = onPressed == null || loading;
    final bg = switch (variant) {
      TreinaeButtonVariant.primary => c.primary,
      TreinaeButtonVariant.secondary => c.surface,
      TreinaeButtonVariant.ghost => Colors.transparent,
      TreinaeButtonVariant.danger => c.dangerBackground,
    };
    final fg = switch (variant) {
      TreinaeButtonVariant.primary => c.onPrimary,
      TreinaeButtonVariant.danger => c.danger,
      _ => c.primary,
    };
    return SizedBox(
      width: fullWidth ? double.infinity : null,
      child: TextButton(
        onPressed: disabled ? null : onPressed,
        style: TextButton.styleFrom(
          minimumSize: Size(48, compact ? 48 : 52),
          padding: EdgeInsets.symmetric(
            horizontal: compact ? 14 : 18,
            vertical: 12,
          ),
          foregroundColor: fg,
          backgroundColor: bg,
          disabledForegroundColor: c.muted,
          disabledBackgroundColor: loading ? bg : c.sage,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
            side: variant == TreinaeButtonVariant.secondary
                ? BorderSide(color: c.border)
                : BorderSide.none,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (loading) ...[
              SizedBox(
                width: 18,
                height: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: fg,
                  semanticsLabel: 'Carregando',
                ),
              ),
              const SizedBox(width: 10),
            ],
            Flexible(
              child: Text(
                loading ? 'Carregando...' : label,
                textAlign: TextAlign.center,
                style: TreinaeTypography.label,
              ),
            ),
            if (icon != null && !loading) ...[
              const SizedBox(width: 8),
              Icon(icon, size: 19),
            ],
          ],
        ),
      ),
    );
  }
}
