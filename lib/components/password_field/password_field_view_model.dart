import 'package:flutter/services.dart';

/// Configuração imutável de apresentação, como no projeto de referência.
class PasswordFieldViewModel {
  final String label;
  final String? error;
  final String? helper;
  final bool enabled;
  final Iterable<String> autofillHints;
  const PasswordFieldViewModel({
    this.label = 'Senha',
    this.error,
    this.helper,
    this.enabled = true,
    this.autofillHints = const [AutofillHints.password],
  });
}
