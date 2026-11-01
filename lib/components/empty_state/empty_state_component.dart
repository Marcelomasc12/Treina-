import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_text_styles.dart';
import 'empty_state_view_model.dart';

class EmptyStateComponent extends StatelessWidget {
  final EmptyStateViewModel viewModel;
  final Widget? action;
  const EmptyStateComponent({super.key, required this.viewModel, this.action});
  String get title => viewModel.title;
  String get message => viewModel.message;
  IconData get icon => viewModel.icon;
  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: c.sage,
            child: Icon(icon, color: c.primary),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.heading,
          ),
          const SizedBox(height: 8),
          Text(
            message,
            textAlign: TextAlign.center,
            style: AppTextStyles.body.copyWith(color: c.muted),
          ),
          if (action != null) ...[const SizedBox(height: 20), action!],
        ],
      ),
    );
  }
}
