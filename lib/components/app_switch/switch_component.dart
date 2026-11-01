import 'package:flutter/material.dart';
import '../../common/theme/app_text_styles.dart';
import 'switch_view_model.dart';

class SwitchComponent extends StatelessWidget {
  final SwitchViewModel viewModel;
  final ValueChanged<bool>? onChanged;
  const SwitchComponent({
    super.key,
    required this.viewModel,
    required this.onChanged,
  });
  String get label => viewModel.label;
  bool get value => viewModel.value;
  String? get subtitle => viewModel.subtitle;
  @override
  Widget build(BuildContext context) => SwitchListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(label, style: AppTextStyles.label),
    subtitle: subtitle == null
        ? null
        : Text(subtitle!, style: AppTextStyles.caption),
    value: value,
    onChanged: onChanged,
  );
}
