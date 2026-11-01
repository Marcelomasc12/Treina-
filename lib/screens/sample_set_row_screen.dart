import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleSetRowScreen extends StatefulWidget {
  const SampleSetRowScreen({super.key});
  @override
  State<SampleSetRowScreen> createState() => _SampleSetRowScreenState();
}

class _SampleSetRowScreenState extends State<SampleSetRowScreen> {
  bool done = false;
  final weight = TextEditingController(text: '20');
  final reps = TextEditingController(text: '10');
  @override
  void dispose() {
    weight.dispose();
    reps.dispose();
    super.dispose();
  }

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
    appBar: AppBarFactory.detail(title: 'Registro de série'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Série editável', [
          SetRowFactory.standard(
            number: 1,
            completed: done,
            weightController: weight,
            repsController: reps,
            onCompleted: (v) => setState(() => done = v),
          ),
          Text(done ? 'Série concluída.' : 'Série pendente.'),
        ]),
      ],
    ),
  );
}
