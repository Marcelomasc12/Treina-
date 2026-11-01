import 'package:flutter/material.dart';
import 'set_row_component.dart';
import 'set_row_view_model.dart';

class SetRowFactory {
  SetRowFactory._();
  static SetRowComponent standard({
    required int number,
    required bool completed,
    bool enabled = true,
    required TextEditingController weightController,
    required TextEditingController repsController,
    required ValueChanged<bool> onCompleted,
  }) => SetRowComponent(
    viewModel: SetRowViewModel(
      number: number,
      completed: completed,
      enabled: enabled,
    ),
    weightController: weightController,
    repsController: repsController,
    onCompleted: onCompleted,
  );
}
