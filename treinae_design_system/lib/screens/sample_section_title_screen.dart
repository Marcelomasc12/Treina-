import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleSectionTitleScreen extends StatefulWidget {
  const SampleSectionTitleScreen({super.key});
  @override
  State<SampleSectionTitleScreen> createState() =>
      _SampleSectionTitleScreenState();
}

class _SampleSectionTitleScreenState extends State<SampleSectionTitleScreen> {
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
    appBar: AppBarFactory.detail(title: 'Título de seção'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Variações', [
          SectionTitleFactory.standard(title: 'Meus treinos'),
          SectionTitleFactory.standard(
            title: 'Últimos treinos',
            actionLabel: 'Ver todos',
            onAction: () => message('Ver todos selecionado.'),
          ),
        ]),
      ],
    ),
  );
}
