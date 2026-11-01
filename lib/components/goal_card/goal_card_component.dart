import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_text_styles.dart';
import 'goal_card_view_model.dart';
import '../cards/card_factory.dart';
import '../progress/progress_factory.dart';

class GoalCardComponent extends StatelessWidget {
  final GoalCardViewModel viewModel;

  const GoalCardComponent({super.key, required this.viewModel});
  int get completed => viewModel.completed;
  int get goal => viewModel.goal;
  @override
  Widget build(BuildContext context) {
    final ratio = goal > 0 ? completed / goal : 0.0;
    final percent = (ratio * 100).round();
    final c = AppColors.of(context);
    return CardFactory.standard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Meta mensal',
                  style: AppTextStyles.caption.copyWith(color: c.muted),
                ),
              ),
              Text(
                '$percent%',
                style: AppTextStyles.label.copyWith(color: c.primary),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text('$completed de $goal treinos', style: AppTextStyles.label),
          const SizedBox(height: 12),
          ProgressFactory.standard(value: ratio, label: '$percent% da meta'),
        ],
      ),
    );
  }
}
