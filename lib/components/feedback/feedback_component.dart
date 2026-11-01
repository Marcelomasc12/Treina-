import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_text_styles.dart';
import 'feedback_view_model.dart';

class FeedbackComponent extends StatelessWidget {
  final FeedbackViewModel viewModel;

  const FeedbackComponent({super.key, required this.viewModel});
  String get message => viewModel.message;
  FeedbackTone get tone => viewModel.tone;
  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final isError = tone == FeedbackTone.error;
    final color = isError ? c.danger : c.primary;
    return Semantics(
      liveRegion: true,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isError ? c.dangerBackground : c.sage,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              isError
                  ? Icons.error_outline
                  : tone == FeedbackTone.success
                  ? Icons.check_circle_outline
                  : Icons.info_outline,
              color: color,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: AppTextStyles.body.copyWith(color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
