import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_text_styles.dart';
import 'select_field_view_model.dart';
import '../../common/theme/input_decoration.dart';

class SelectFieldComponent<T> extends StatelessWidget {
  final SelectFieldViewModel<T> viewModel;
  final ValueChanged<T?>? onChanged;
  const SelectFieldComponent({
    super.key,
    required this.viewModel,
    required this.onChanged,
  });
  String get label => viewModel.label;
  T? get value => viewModel.value;
  List<DropdownMenuItem<T>> get items => viewModel.items;
  String get hint => viewModel.hint;
  String? get error => viewModel.error;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: AppTextStyles.label),
      const SizedBox(height: 8),
      InputDecorator(
        decoration: buildFieldDecoration(context, error: error),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<T>(
            value: value,
            items: items,
            onChanged: onChanged,
            isDense: true,
            isExpanded: true,
            hint: Text(hint),
            dropdownColor: AppColors.of(context).surface,
            style: AppTextStyles.body.copyWith(
              color: AppColors.of(context).text,
            ),
            icon: const Icon(Icons.expand_more),
          ),
        ),
      ),
    ],
  );
}
