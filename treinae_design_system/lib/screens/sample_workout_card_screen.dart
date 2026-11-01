import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleWorkoutCardScreen extends StatefulWidget {
  const SampleWorkoutCardScreen({super.key});
  @override
  State<SampleWorkoutCardScreen> createState() =>
      _SampleWorkoutCardScreenState();
}

class _SampleWorkoutCardScreenState extends State<SampleWorkoutCardScreen> {
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
    appBar: AppBarFactory.detail(title: 'Ficha de treino'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Card de ficha', [
          WorkoutCardFactory.standard(
            index: 'A',
            title: 'Treino A — Peito e tríceps',
            exerciseCount: 4,
            onOpen: () => message('Abrir ficha.'),
            onStart: () => message('Iniciar treino.'),
            onAction: (v) => message(
              v == WorkoutAction.edit ? 'Editar ficha.' : 'Excluir ficha.',
            ),
          ),
        ]),
      ],
    ),
  );
}
