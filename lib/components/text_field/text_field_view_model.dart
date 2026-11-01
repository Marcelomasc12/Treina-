import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Configuração imutável de apresentação, como no projeto de referência.
class TextFieldViewModel {
  final String label;
  final String? hint;
  final String? error;
  final String? helper;
  final IconData? icon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool enabled;
  final bool readOnly;
  final bool obscureText;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;
  const TextFieldViewModel({
    required this.label,
    this.hint,
    this.error,
    this.helper,
    this.icon,
    this.keyboardType,
    this.textInputAction,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.inputFormatters,
    this.autofillHints,
  });
}
