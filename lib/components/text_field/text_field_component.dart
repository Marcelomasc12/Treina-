import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_text_styles.dart';
import 'text_field_view_model.dart';
import 'package:flutter/services.dart';
import '../../common/theme/input_decoration.dart';

class TextFieldComponent extends StatelessWidget {
  final TextFieldViewModel viewModel;
  final TextEditingController? controller;
  final Widget? suffix;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final FormFieldValidator<String>? validator;
  const TextFieldComponent({
    super.key,
    required this.viewModel,
    this.controller,
    this.suffix,
    this.onChanged,
    this.onSubmitted,
    this.validator,
  });
  String get label => viewModel.label;
  String? get hint => viewModel.hint;
  String? get error => viewModel.error;
  String? get helper => viewModel.helper;
  IconData? get icon => viewModel.icon;
  TextInputType? get keyboardType => viewModel.keyboardType;
  TextInputAction? get textInputAction => viewModel.textInputAction;
  bool get enabled => viewModel.enabled;
  bool get readOnly => viewModel.readOnly;
  bool get obscureText => viewModel.obscureText;
  int get maxLines => viewModel.maxLines;
  List<TextInputFormatter>? get inputFormatters => viewModel.inputFormatters;
  Iterable<String>? get autofillHints => viewModel.autofillHints;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: AppTextStyles.label),
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
          style: AppTextStyles.body.copyWith(
            color: enabled
                ? AppColors.of(context).text
                : AppColors.of(context).muted,
          ),
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          decoration: buildFieldDecoration(
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
