import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleCardScreen extends StatefulWidget {
  const SampleCardScreen({super.key});
  @override
  State<SampleCardScreen> createState() => _SampleCardScreenState();
}

class _SampleCardScreenState extends State<SampleCardScreen> {
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
    appBar: AppBarFactory.detail(title: 'Cards'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Superfícies', [
          CardFactory.standard(child: const Text('Card padrão.')),
          CardFactory.standard(
            highlighted: true,
            child: const Text('Destaque sálvia.'),
          ),
          CardFactory.standard(
            onTap: () => message('Card selecionado.'),
            child: const Text('Toque para testar.'),
          ),
        ]),
      ],
    ),
  );
}
