import 'package:flutter/material.dart';

/// Configuração imutável de apresentação, como no projeto de referência.
class SelectFieldViewModel<T> {
  final String label;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final String hint;
  final String? error;
  const SelectFieldViewModel({
    required this.label,
    required this.value,
    required this.items,
    this.hint = 'Selecione',
    this.error,
  });
}
