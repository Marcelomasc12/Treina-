import 'package:flutter/material.dart';
import 'navigation_component.dart';
import 'navigation_view_model.dart';

class NavigationFactory {
  NavigationFactory._();
  static NavigationComponent standard({
    required int selectedIndex,
    required ValueChanged<int> onSelected,
  }) => NavigationComponent(
    viewModel: NavigationViewModel(selectedIndex: selectedIndex),
    onSelected: onSelected,
  );
}
