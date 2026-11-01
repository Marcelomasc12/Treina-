import 'package:flutter/material.dart';
import 'app_bar_component.dart';
import 'app_bar_view_model.dart';

class AppBarFactory {
  AppBarFactory._();
  static AppBarComponent standard({
    required String title,
    bool showBack = true,
    VoidCallback? onBack,
    List<Widget>? actions,
  }) => AppBarComponent(
    viewModel: AppBarViewModel(title: title, showBack: showBack),
    onBack: onBack,
    actions: actions,
  );
  static AppBarComponent main({required String title, List<Widget>? actions}) =>
      standard(title: title, showBack: false, actions: actions);
  static AppBarComponent detail({
    required String title,
    VoidCallback? onBack,
    List<Widget>? actions,
  }) => standard(title: title, onBack: onBack, actions: actions);
}
