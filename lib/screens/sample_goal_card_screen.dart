import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleGoalCardScreen extends StatefulWidget {
  const SampleGoalCardScreen({super.key});
  @override
  State<SampleGoalCardScreen> createState() => _SampleGoalCardScreenState();
}

class _SampleGoalCardScreenState extends State<SampleGoalCardScreen> {
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
    appBar: AppBarFactory.detail(title: 'Meta mensal'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Metas', [
          GoalCardFactory.standard(completed: 12, goal: 16),
          GoalCardFactory.standard(completed: 18, goal: 16),
          GoalCardFactory.standard(completed: 0, goal: 16),
        ]),
      ],
    ),
  );
}
