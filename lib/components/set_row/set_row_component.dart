import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_text_styles.dart';
import 'set_row_view_model.dart';

class SetRowComponent extends StatelessWidget {
  final SetRowViewModel viewModel;
  final TextEditingController weightController;
  final TextEditingController repsController;
  final ValueChanged<bool> onCompleted;
  const SetRowComponent({
    super.key,
    required this.viewModel,
    required this.weightController,
    required this.repsController,
    required this.onCompleted,
  });
  int get number => viewModel.number;
  bool get completed => viewModel.completed;
  bool get enabled => viewModel.enabled;
  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    Widget input(
      TextEditingController controller,
      String label,
      bool decimal,
    ) => TextField(
      controller: controller,
      enabled: enabled,
      keyboardType: TextInputType.numberWithOptions(decimal: decimal),
      textAlign: TextAlign.center,
      style: AppTextStyles.body,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: completed ? c.sage : c.background,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 32,
            child: Text('$number', style: AppTextStyles.label),
          ),
          Expanded(child: input(weightController, 'Carga (kg)', true)),
          const SizedBox(width: 8),
          Expanded(child: input(repsController, 'Repetições', false)),
          SizedBox(
            width: 48,
            child: Semantics(
              label: 'Concluir série $number',
              child: Checkbox(
                value: completed,
                onChanged: enabled ? (v) => onCompleted(v ?? false) : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
