import 'package:flutter/material.dart';
import 'workout_card_component.dart';
import 'workout_card_view_model.dart';

class WorkoutCardFactory {
  WorkoutCardFactory._();
  static WorkoutCardComponent standard({
    required String index,
    required String title,
    required int exerciseCount,
    required VoidCallback? onOpen,
    required VoidCallback? onStart,
    ValueChanged<WorkoutAction>? onAction,
  }) => WorkoutCardComponent(
    viewModel: WorkoutCardViewModel(
      index: index,
      title: title,
      exerciseCount: exerciseCount,
    ),
    onOpen: onOpen,
    onStart: onStart,
    onAction: onAction,
  );
}
