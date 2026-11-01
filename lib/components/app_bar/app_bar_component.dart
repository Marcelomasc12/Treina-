import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import 'app_bar_view_model.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  final AppBarViewModel viewModel;
  final VoidCallback? onBack;
  final List<Widget>? actions;
  const AppBarComponent({
    super.key,
    required this.viewModel,
    this.onBack,
    this.actions,
  });
  String get title => viewModel.title;
  bool get showBack => viewModel.showBack;
  @override
  Size get preferredSize => const Size.fromHeight(64);
  @override
  Widget build(BuildContext context) => AppBar(
    toolbarHeight: 64,
    automaticallyImplyLeading: false,
    leading: showBack
        ? IconButton(
            tooltip: 'Voltar',
            onPressed:
                onBack ??
                () {
                  Navigator.of(context).maybePop();
                },
            icon: const Icon(Icons.chevron_left, size: 27),
          )
        : null,
    title: Text(title),
    actions: actions,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1),
      child: Divider(height: 1, color: AppColors.of(context).border),
    ),
  );
}
