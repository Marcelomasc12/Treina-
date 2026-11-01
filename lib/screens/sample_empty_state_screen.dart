import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleEmptyStateScreen extends StatefulWidget {
  const SampleEmptyStateScreen({super.key});
  @override
  State<SampleEmptyStateScreen> createState() => _SampleEmptyStateScreenState();
}

class _SampleEmptyStateScreenState extends State<SampleEmptyStateScreen> {
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
    appBar: AppBarFactory.detail(title: 'Estado vazio'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        EmptyStateFactory.standard(
          title: 'Nenhuma ficha cadastrada',
          message: 'Crie sua primeira ficha para começar.',
          action: ActionButtonFactory.primary(
            text: 'Criar treino',
            onPressed: () => message('Criar selecionado.'),
          ),
        ),
      ],
    ),
  );
}
