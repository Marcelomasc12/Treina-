import 'package:flutter/material.dart';
import '../foundations/tokens.dart';

class TreinaeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TreinaeAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.showBack = true,
    this.actions,
  });
  final String title;
  final VoidCallback? onBack;
  final bool showBack;
  final List<Widget>? actions;
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
      child: Divider(height: 1, color: TreinaeColors.of(context).border),
    ),
  );
}

class TreinaeBottomNavigation extends StatelessWidget {
  const TreinaeBottomNavigation({
    super.key,
    required this.selectedIndex,
    required this.onSelected,
  });
  final int selectedIndex;
  final ValueChanged<int> onSelected;
  @override
  Widget build(BuildContext context) {
    final c = TreinaeColors.of(context);
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
                            style: TreinaeTypography.caption.copyWith(
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
