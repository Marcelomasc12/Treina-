import 'package:flutter/material.dart';
import 'slider_component.dart';
import 'slider_view_model.dart';

class SliderFactory {
  SliderFactory._();
  static SliderComponent standard({
    required String label,
    required double value,
    double min = 0,
    double max = 120,
    int? divisions = 12,
    required ValueChanged<double>? onChanged,
  }) => SliderComponent(
    viewModel: SliderViewModel(
      label: label,
      value: value,
      min: min,
      max: max,
      divisions: divisions,
    ),
    onChanged: onChanged,
  );
}
