import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_text_styles.dart';
import 'session_tile_view_model.dart';
import '../cards/card_factory.dart';

class SessionTileComponent extends StatelessWidget {
  final SessionTileViewModel viewModel;
  final VoidCallback? onTap;
  const SessionTileComponent({super.key, required this.viewModel, this.onTap});
  String get title => viewModel.title;
  String get subtitle => viewModel.subtitle;
  @override
  Widget build(BuildContext context) => CardFactory.standard(
    onTap: onTap,
    child: Row(
      children: [
        const Icon(Icons.history),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.label),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.of(context).muted,
                ),
              ),
            ],
          ),
        ),
        if (onTap != null) const Icon(Icons.chevron_right),
      ],
    ),
  );
}
