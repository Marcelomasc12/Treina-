import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_text_styles.dart';
import 'action_button_view_model.dart';

class ActionButtonComponent extends StatelessWidget {
  final ActionButtonViewModel viewModel;
  final VoidCallback? onPressed;
  const ActionButtonComponent({
    super.key,
    required this.viewModel,
    required this.onPressed,
  });
  String get label => viewModel.label;
  ActionButtonType get variant => viewModel.variant;
  IconData? get icon => viewModel.icon;
  bool get loading => viewModel.loading;
  bool get fullWidth => viewModel.fullWidth;
  bool get compact => viewModel.compact;
  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final disabled = onPressed == null || loading;
    final bg = switch (variant) {
      ActionButtonType.primary => c.primary,
      ActionButtonType.secondary => c.surface,
      ActionButtonType.ghost => Colors.transparent,
      ActionButtonType.danger => c.dangerBackground,
    };
    final fg = switch (variant) {
      ActionButtonType.primary => c.onPrimary,
      ActionButtonType.danger => c.danger,
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
            side: variant == ActionButtonType.secondary
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
                style: AppTextStyles.label,
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
