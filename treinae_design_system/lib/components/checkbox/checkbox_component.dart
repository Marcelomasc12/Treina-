import 'package:flutter/material.dart';
import '../../common/theme/app_text_styles.dart';
import 'checkbox_view_model.dart';

class CheckboxComponent extends StatelessWidget {
  final CheckboxViewModel viewModel;
  final ValueChanged<bool>? onChanged;
  const CheckboxComponent({
    super.key,
    required this.viewModel,
    required this.onChanged,
  });
  String get label => viewModel.label;
  bool get value => viewModel.value;
  @override
  Widget build(BuildContext context) => CheckboxListTile(
    contentPadding: EdgeInsets.zero,
    controlAffinity: ListTileControlAffinity.leading,
    title: Text(label, style: AppTextStyles.body),
    value: value,
    onChanged: onChanged == null ? null : (v) => onChanged!(v ?? false),
  );
}
