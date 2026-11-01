import 'package:flutter/material.dart';
import 'select_field_component.dart';
import 'select_field_view_model.dart';

class SelectFieldFactory {
  SelectFieldFactory._();
  static SelectFieldComponent<T> standard<T>({
    required String label,
    required T? value,
    required List<DropdownMenuItem<T>> items,
    String hint = 'Selecione',
    String? error,
    required ValueChanged<T?>? onChanged,
  }) => SelectFieldComponent<T>(
    viewModel: SelectFieldViewModel<T>(
      label: label,
      value: value,
      items: items,
      hint: hint,
      error: error,
    ),
    onChanged: onChanged,
  );
}
