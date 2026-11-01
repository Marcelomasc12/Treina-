import 'package:flutter/material.dart';
import 'text_field_component.dart';
import 'text_field_view_model.dart';
import 'package:flutter/services.dart';

class TextFieldFactory {
  TextFieldFactory._();
  static TextFieldComponent standard({
    required String label,
    String? hint,
    String? error,
    String? helper,
    IconData? icon,
    TextInputType? keyboardType,
    TextInputAction? textInputAction,
    bool enabled = true,
    bool readOnly = false,
    bool obscureText = false,
    int maxLines = 1,
    List<TextInputFormatter>? inputFormatters,
    Iterable<String>? autofillHints,
    TextEditingController? controller,
    Widget? suffix,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
    FormFieldValidator<String>? validator,
  }) => TextFieldComponent(
    viewModel: TextFieldViewModel(
      label: label,
      hint: hint,
      error: error,
      helper: helper,
      icon: icon,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      enabled: enabled,
      readOnly: readOnly,
      obscureText: obscureText,
      maxLines: maxLines,
      inputFormatters: inputFormatters,
      autofillHints: autofillHints,
    ),
    controller: controller,
    suffix: suffix,
    onChanged: onChanged,
    onSubmitted: onSubmitted,
    validator: validator,
  );
  static TextFieldComponent email({
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
  }) => standard(
    label: 'E-mail',
    hint: 'Digite seu e-mail',
    icon: Icons.mail_outline,
    keyboardType: TextInputType.emailAddress,
    controller: controller,
    validator: validator,
  );
}
