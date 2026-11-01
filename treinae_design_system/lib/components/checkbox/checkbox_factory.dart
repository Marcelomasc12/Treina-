import 'package:flutter/material.dart';
import 'checkbox_component.dart';
import 'checkbox_view_model.dart';

class CheckboxFactory {
  CheckboxFactory._();
  static CheckboxComponent standard({
    required String label,
    required bool value,
    required ValueChanged<bool>? onChanged,
  }) => CheckboxComponent(
    viewModel: CheckboxViewModel(label: label, value: value),
    onChanged: onChanged,
  );
}
