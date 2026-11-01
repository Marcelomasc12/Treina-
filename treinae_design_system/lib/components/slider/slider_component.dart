import 'package:flutter/material.dart';
import '../../common/theme/app_text_styles.dart';
import 'slider_view_model.dart';

class SliderComponent extends StatelessWidget {
  final SliderViewModel viewModel;
  final ValueChanged<double>? onChanged;
  const SliderComponent({
    super.key,
    required this.viewModel,
    required this.onChanged,
  });
  String get label => viewModel.label;
  double get value => viewModel.value;
  double get min => viewModel.min;
  double get max => viewModel.max;
  int? get divisions => viewModel.divisions;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('$label: ${value.round()}', style: AppTextStyles.label),
      Slider(
        value: value.clamp(min, max).toDouble(),
        min: min,
        max: max,
        divisions: divisions,
        label: '${value.round()}',
        onChanged: onChanged,
        semanticFormatterCallback: (v) => '$label: ${v.round()}',
      ),
    ],
  );
}
