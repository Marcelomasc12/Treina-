import 'package:flutter/material.dart';

enum ActionButtonType { primary, secondary, ghost, danger }

/// Configuração imutável de apresentação, como no projeto de referência.
class ActionButtonViewModel {
  final String label;
  final ActionButtonType variant;
  final IconData? icon;
  final bool loading;
  final bool fullWidth;
  final bool compact;
  const ActionButtonViewModel({
    required this.label,
    this.variant = ActionButtonType.primary,
    this.icon,
    this.loading = false,
    this.fullWidth = true,
    this.compact = false,
  });
}
