import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_text_styles.dart';
import 'progress_view_model.dart';

class ProgressComponent extends StatelessWidget {
  final ProgressViewModel viewModel;

  const ProgressComponent({super.key, required this.viewModel});
  double get value => viewModel.value;
  String? get label => viewModel.label;
  @override
  Widget build(BuildContext context) {
    final safe = value.isFinite ? value.clamp(0.0, 1.0).toDouble() : 0.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: safe,
            minHeight: 7,
            semanticsLabel: label ?? 'Progresso',
            semanticsValue: '${(safe * 100).round()}%',
          ),
        ),
        if (label != null) ...[
          const SizedBox(height: 8),
          Text(
            label!,
            style: AppTextStyles.caption.copyWith(
              color: AppColors.of(context).muted,
            ),
          ),
        ],
      ],
    );
  }
}
