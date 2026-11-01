import 'package:flutter/material.dart';
import 'empty_state_component.dart';
import 'empty_state_view_model.dart';

class EmptyStateFactory {
  EmptyStateFactory._();
  static EmptyStateComponent standard({
    required String title,
    required String message,
    IconData icon = Icons.fitness_center,
    Widget? action,
  }) => EmptyStateComponent(
    viewModel: EmptyStateViewModel(title: title, message: message, icon: icon),
    action: action,
  );
}
