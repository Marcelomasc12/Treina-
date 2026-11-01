import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import 'card_view_model.dart';

class CardComponent extends StatelessWidget {
  final CardViewModel viewModel;
  final Widget child;
  final VoidCallback? onTap;
  const CardComponent({
    super.key,
    required this.viewModel,
    required this.child,
    this.onTap,
  });
  EdgeInsetsGeometry get padding => viewModel.padding;
  bool get highlighted => viewModel.highlighted;
  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    return Material(
      color: highlighted ? c.sage : c.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: c.border),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(padding: padding, child: child),
      ),
    );
  }
}
