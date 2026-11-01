import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleSliderScreen extends StatefulWidget {
  const SampleSliderScreen({super.key});
  @override
  State<SampleSliderScreen> createState() => _SampleSliderScreenState();
}

class _SampleSliderScreenState extends State<SampleSliderScreen> {
  double rest = 60;
  void message(String text) => FeedbackFactory.toast(context, text);
  Widget section(String title, List<Widget> children) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: AppSpacing.large),
      Text(title, style: AppTextStyles.heading),
      const SizedBox(height: 12),
      for (final child in children) ...[child, const SizedBox(height: 12)],
    ],
  );
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBarFactory.detail(title: 'Slider'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Descanso', [
          SliderFactory.standard(
            label: 'Descanso em segundos',
            value: rest,
            onChanged: (v) => setState(() => rest = v),
          ),
          SliderFactory.standard(
            label: 'Desabilitado',
            value: 30,
            onChanged: null,
          ),
        ]),
      ],
    ),
  );
}
