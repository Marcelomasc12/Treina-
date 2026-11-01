import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import 'password_field_view_model.dart';
import '../text_field/text_field_factory.dart';

class PasswordFieldComponent extends StatefulWidget {
  final PasswordFieldViewModel viewModel;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  const PasswordFieldComponent({
    super.key,
    required this.viewModel,
    this.controller,
    this.validator,
    this.onChanged,
    this.onSubmitted,
  });
  String get label => viewModel.label;
  String? get error => viewModel.error;
  String? get helper => viewModel.helper;
  bool get enabled => viewModel.enabled;
  Iterable<String> get autofillHints => viewModel.autofillHints;
  @override
  State<PasswordFieldComponent> createState() => _PasswordFieldComponentState();
}

class _PasswordFieldComponentState extends State<PasswordFieldComponent> {
  bool _hidden = true;
  @override
  Widget build(BuildContext context) => TextFieldFactory.standard(
    label: widget.label,
    controller: widget.controller,
    error: widget.error,
    helper: widget.helper,
    icon: Icons.lock_outline,
    hint: 'Digite sua senha',
    obscureText: _hidden,
    validator: widget.validator,
    enabled: widget.enabled,
    onChanged: widget.onChanged,
    onSubmitted: widget.onSubmitted,
    autofillHints: widget.autofillHints,
    suffix: IconButton(
      tooltip: _hidden ? 'Mostrar senha' : 'Ocultar senha',
      onPressed: widget.enabled
          ? () => setState(() => _hidden = !_hidden)
          : null,
      icon: Icon(
        _hidden ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        color: AppColors.of(context).muted,
        size: 21,
      ),
    ),
  );
}
