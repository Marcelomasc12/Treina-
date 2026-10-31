import 'package:flutter/material.dart';
import '../components/action_button.dart';

/// Centraliza a criação das quatro variantes; não contém regra de negócio.
abstract final class TreinaeButtonFactory {
  static TreinaeButton primary({
    required String label,
    required VoidCallback? onPressed,
    IconData? icon,
    bool loading = false,
  }) => TreinaeButton(
    label: label,
    onPressed: onPressed,
    icon: icon,
    loading: loading,
  );
  static TreinaeButton secondary({
    required String label,
    required VoidCallback? onPressed,
    IconData? icon,
  }) => TreinaeButton(
    label: label,
    onPressed: onPressed,
    icon: icon,
    variant: TreinaeButtonVariant.secondary,
  );
  static TreinaeButton ghost({
    required String label,
    required VoidCallback? onPressed,
  }) => TreinaeButton(
    label: label,
    onPressed: onPressed,
    variant: TreinaeButtonVariant.ghost,
  );
  static TreinaeButton danger({
    required String label,
    required VoidCallback? onPressed,
  }) => TreinaeButton(
    label: label,
    onPressed: onPressed,
    variant: TreinaeButtonVariant.danger,
  );
}
