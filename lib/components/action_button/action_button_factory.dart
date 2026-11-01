import 'package:flutter/material.dart';
import 'action_button_component.dart';
import 'action_button_view_model.dart';

class ActionButtonFactory {
  ActionButtonFactory._();
  static ActionButtonComponent standard({
    required String label,
    ActionButtonType variant = ActionButtonType.primary,
    IconData? icon,
    bool loading = false,
    bool fullWidth = true,
    bool compact = false,
    required VoidCallback? onPressed,
  }) => ActionButtonComponent(
    viewModel: ActionButtonViewModel(
      label: label,
      variant: variant,
      icon: icon,
      loading: loading,
      fullWidth: fullWidth,
      compact: compact,
    ),
    onPressed: onPressed,
  );
  static ActionButtonComponent primary({
    required String text,
    required VoidCallback? onPressed,
    IconData? icon,
    bool isEnabled = true,
    bool isLoading = false,
  }) => standard(
    label: text,
    onPressed: isEnabled ? onPressed : null,
    icon: icon,
    loading: isLoading,
    variant: ActionButtonType.primary,
  );
  static ActionButtonComponent secondary({
    required String text,
    required VoidCallback? onPressed,
    IconData? icon,
    bool isEnabled = true,
    bool isLoading = false,
  }) => standard(
    label: text,
    onPressed: isEnabled ? onPressed : null,
    icon: icon,
    loading: isLoading,
    variant: ActionButtonType.secondary,
  );
  static ActionButtonComponent text({
    required String text,
    required VoidCallback? onPressed,
    IconData? icon,
    bool isEnabled = true,
    bool isLoading = false,
  }) => standard(
    label: text,
    onPressed: isEnabled ? onPressed : null,
    icon: icon,
    loading: isLoading,
    variant: ActionButtonType.ghost,
  );
  static ActionButtonComponent danger({
    required String text,
    required VoidCallback? onPressed,
    IconData? icon,
    bool isEnabled = true,
    bool isLoading = false,
  }) => standard(
    label: text,
    onPressed: isEnabled ? onPressed : null,
    icon: icon,
    loading: isLoading,
    variant: ActionButtonType.danger,
  );
}
