import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleSearchBarScreen extends StatefulWidget {
  const SampleSearchBarScreen({super.key});
  @override
  State<SampleSearchBarScreen> createState() => _SampleSearchBarScreenState();
}

class _SampleSearchBarScreenState extends State<SampleSearchBarScreen> {
  String query = '';
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
    appBar: AppBarFactory.detail(title: 'Barra de busca'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Buscar exercício', [
          SearchBarFactory.standard(
            hint: 'Buscar exercício',
            onChanged: (v) => setState(() => query = v),
          ),
          for (final n in [
            'Supino reto',
            'Remada baixa',
            'Agachamento',
          ].where((s) => s.toLowerCase().contains(query.toLowerCase())))
            Text(n),
          if (![
            'Supino reto',
            'Remada baixa',
            'Agachamento',
          ].any((s) => s.toLowerCase().contains(query.toLowerCase())))
            const Text('Nenhum exercício encontrado.'),
        ]),
      ],
    ),
  );
}
