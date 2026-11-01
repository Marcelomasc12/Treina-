import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleSessionTileScreen extends StatefulWidget {
  const SampleSessionTileScreen({super.key});
  @override
  State<SampleSessionTileScreen> createState() =>
      _SampleSessionTileScreenState();
}

class _SampleSessionTileScreenState extends State<SampleSessionTileScreen> {
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
    appBar: AppBarFactory.detail(title: 'Item do histórico'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Sessões', [
          SessionTileFactory.standard(
            title: 'Treino B — Costas e bíceps',
            subtitle: '30/10/2026 • 45 minutos',
            onTap: () => message('Detalhes selecionados.'),
          ),
          SessionTileFactory.standard(
            title: 'Treino A — Peito e tríceps',
            subtitle: '28/10/2026 • 50 minutos',
          ),
        ]),
      ],
    ),
  );
}
