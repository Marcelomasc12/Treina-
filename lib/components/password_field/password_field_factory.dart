import 'package:flutter/material.dart';
import 'password_field_component.dart';
import 'password_field_view_model.dart';

class PasswordFieldFactory {
  PasswordFieldFactory._();
  static PasswordFieldComponent standard({
    String label = 'Senha',
    String? error,
    String? helper,
    bool enabled = true,
    Iterable<String> autofillHints = const [AutofillHints.password],
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
    ValueChanged<String>? onChanged,
    ValueChanged<String>? onSubmitted,
  }) => PasswordFieldComponent(
    viewModel: PasswordFieldViewModel(
      label: label,
      error: error,
      helper: helper,
      enabled: enabled,
      autofillHints: autofillHints,
    ),
    controller: controller,
    validator: validator,
    onChanged: onChanged,
    onSubmitted: onSubmitted,
  );
}
