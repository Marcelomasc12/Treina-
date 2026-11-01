import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_text_styles.dart';
import 'badge_view_model.dart';

class BadgeComponent extends StatelessWidget {
  final BadgeViewModel viewModel;

  const BadgeComponent({super.key, required this.viewModel});
  String get label => viewModel.label;
  BadgeTone get tone => viewModel.tone;
  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final danger = tone == BadgeTone.danger;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: danger ? c.dangerBackground : c.sage,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (tone == BadgeTone.success) ...[
            Icon(Icons.check, size: 14, color: c.primary),
            const SizedBox(width: 4),
          ],
          Flexible(
            child: Text(
              label,
              style: AppTextStyles.caption.copyWith(
                color: danger ? c.danger : c.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
