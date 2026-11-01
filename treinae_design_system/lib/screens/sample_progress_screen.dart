import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleProgressScreen extends StatefulWidget {
  const SampleProgressScreen({super.key});
  @override
  State<SampleProgressScreen> createState() => _SampleProgressScreenState();
}

class _SampleProgressScreenState extends State<SampleProgressScreen> {
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
    appBar: AppBarFactory.detail(title: 'Barra de progresso'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Estados', [
          ProgressFactory.standard(value: 0, label: 'Ainda não começou'),
          ProgressFactory.standard(value: .75, label: '75% concluído'),
          ProgressFactory.standard(value: 1, label: 'Concluído'),
          ProgressFactory.standard(
            value: 1.5,
            label: 'Acima da meta: barra limitada a 100%',
          ),
        ]),
      ],
    ),
  );
}
