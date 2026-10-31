import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../foundations/tokens.dart';

InputDecoration _decoration(
  BuildContext context, {
  String? hint,
  String? error,
  String? helper,
  IconData? icon,
  Widget? suffix,
}) {
  final c = TreinaeColors.of(context);
  OutlineInputBorder border(Color color, [double width = 1]) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(TreinaeRadius.field),
        borderSide: BorderSide(color: color, width: width),
      );
  return InputDecoration(
    hintText: hint,
    errorText: error,
    helperText: helper,
    errorMaxLines: 3,
    helperMaxLines: 3,
    filled: true,
    fillColor: c.surface,
    hintStyle: TextStyle(color: c.muted, fontWeight: FontWeight.w400),
    contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
    prefixIcon: icon == null ? null : Icon(icon, color: c.muted, size: 20),
    suffixIcon: suffix,
    enabledBorder: border(c.border),
    disabledBorder: border(c.border),
    border: border(c.border),
    focusedBorder: border(c.primary, 2),
    errorBorder: border(c.danger),
    focusedErrorBorder: border(c.danger, 2),
    constraints: const BoxConstraints(minHeight: 52),
  );
}

/// Aceita Form/validator e controller; descarte o controller em quem o criou.
class TreinaeTextField extends StatelessWidget {
  const TreinaeTextField({
    super.key,
    required this.label,
    this.controller,
    this.hint,
    this.error,
    this.helper,
    this.icon,
    this.suffix,
    this.onChanged,
    this.onSubmitted,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.maxLines = 1,
    this.inputFormatters,
    this.autofillHints,
  });
  final String label;
  final TextEditingController? controller;
  final String? hint, error, helper;
  final IconData? icon;
  final Widget? suffix;
  final ValueChanged<String>? onChanged, onSubmitted;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool enabled, readOnly, obscureText;
  final int maxLines;
  final List<TextInputFormatter>? inputFormatters;
  final Iterable<String>? autofillHints;

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: TreinaeTypography.label),
      const SizedBox(height: 8),
      Semantics(
        label: label,
        child: TextFormField(
          controller: controller,
          enabled: enabled,
          readOnly: readOnly,
          obscureText: obscureText,
          maxLines: obscureText ? 1 : maxLines,
          validator: validator,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          inputFormatters: inputFormatters,
          autofillHints: autofillHints,
          autocorrect: !obscureText,
          enableSuggestions: !obscureText,
          style: TreinaeTypography.body.copyWith(
            color: enabled
                ? TreinaeColors.of(context).text
                : TreinaeColors.of(context).muted,
          ),
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          decoration: _decoration(
            context,
            hint: hint,
            error: error,
            helper: helper,
            icon: icon,
            suffix: suffix,
          ),
        ),
      ),
    ],
  );
}

class TreinaePasswordField extends StatefulWidget {
  const TreinaePasswordField({
    super.key,
    this.label = 'Senha',
    this.controller,
    this.error,
    this.helper,
    this.validator,
    this.enabled = true,
    this.onChanged,
    this.onSubmitted,
    this.autofillHints = const [AutofillHints.password],
  });
  final String label;
  final String? error, helper;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final bool enabled;
  final ValueChanged<String>? onChanged, onSubmitted;
  final Iterable<String> autofillHints;
  @override
  State<TreinaePasswordField> createState() => _TreinaePasswordFieldState();
}

class _TreinaePasswordFieldState extends State<TreinaePasswordField> {
  bool _hidden = true;
  @override
  Widget build(BuildContext context) => TreinaeTextField(
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
        color: TreinaeColors.of(context).muted,
        size: 21,
      ),
    ),
  );
}

class TreinaeSearchField extends StatelessWidget {
  const TreinaeSearchField({
    super.key,
    this.controller,
    this.hint = 'Buscar treino',
    this.onChanged,
  });
  final TextEditingController? controller;
  final String hint;
  final ValueChanged<String>? onChanged;
  @override
  Widget build(BuildContext context) => Semantics(
    label: hint,
    child: TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: _decoration(context, hint: hint, icon: Icons.search),
    ),
  );
}

class TreinaeSelect<T> extends StatelessWidget {
  const TreinaeSelect({
    super.key,
    required this.label,
    required this.value,
    required this.items,
    required this.onChanged,
    this.hint = 'Selecione',
    this.error,
  });
  final String label, hint;
  final T? value;
  final List<DropdownMenuItem<T>> items;
  final ValueChanged<T?>? onChanged;
  final String? error;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: TreinaeTypography.label),
      const SizedBox(height: 8),
      InputDecorator(
        decoration: _decoration(context, error: error),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            value: value,
            items: items,
            onChanged: onChanged,
            isDense: true,
            isExpanded: true,
            hint: Text(hint),
            dropdownColor: TreinaeColors.of(context).surface,
            style: TreinaeTypography.body.copyWith(
              color: TreinaeColors.of(context).text,
            ),
            icon: const Icon(Icons.expand_more),
          ),
        ),
      ),
    ],
  );
}
