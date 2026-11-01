import 'package:flutter/material.dart';
import '../constants/app_radius.dart';
import 'app_colors.dart';

InputDecoration buildFieldDecoration(
  BuildContext context, {
  String? hint,
  String? error,
  String? helper,
  IconData? icon,
  Widget? suffix,
}) {
  final c = AppColors.of(context);
  OutlineInputBorder border(Color color, [double width = 1]) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppRadius.field),
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
