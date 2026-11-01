import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_text_styles.dart';
import 'navigation_view_model.dart';

class NavigationComponent extends StatelessWidget {
  final NavigationViewModel viewModel;
  final ValueChanged<int> onSelected;
  const NavigationComponent({
    super.key,
    required this.viewModel,
    required this.onSelected,
  });
  int get selectedIndex => viewModel.selectedIndex;
  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    const icons = [Icons.home_outlined, Icons.fitness_center, Icons.history];
    const labels = ['Início', 'Treinos', 'Histórico'];
    return Material(
      color: c.surface,
      child: SafeArea(
        top: false,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(top: BorderSide(color: c.border)),
          ),
          child: Row(
            children: List.generate(
              3,
              (i) => Expanded(
                child: Semantics(
                  selected: i == selectedIndex,
                  button: true,
                  child: InkWell(
                    onTap: () => onSelected(i),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                        horizontal: 4,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            icons[i],
                            color: i == selectedIndex ? c.primary : c.muted,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            labels[i],
                            style: AppTextStyles.caption.copyWith(
                              fontWeight: FontWeight.w700,
                              color: i == selectedIndex ? c.primary : c.muted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
