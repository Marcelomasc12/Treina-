import 'package:flutter/material.dart';
import 'switch_component.dart';
import 'switch_view_model.dart';

class SwitchFactory {
  SwitchFactory._();
  static SwitchComponent standard({
    required String label,
    required bool value,
    String? subtitle,
    required ValueChanged<bool>? onChanged,
  }) => SwitchComponent(
    viewModel: SwitchViewModel(label: label, value: value, subtitle: subtitle),
    onChanged: onChanged,
  );
}
