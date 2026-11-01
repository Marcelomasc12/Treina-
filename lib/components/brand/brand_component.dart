import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_text_styles.dart';
import 'brand_view_model.dart';

class BrandComponent extends StatelessWidget {
  final BrandViewModel viewModel;

  const BrandComponent({super.key, required this.viewModel});
  bool get showTagline => viewModel.showTagline;
  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    return Row(
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: c.sage,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(Icons.fitness_center, color: c.primary, size: 29),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Treinaê',
                style: AppTextStyles.title.copyWith(
                  color: c.primary,
                  fontSize: 32,
                ),
              ),
              if (showTagline)
                Text(
                  'Seu treino, sua evolução.',
                  style: AppTextStyles.caption.copyWith(color: c.muted),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
