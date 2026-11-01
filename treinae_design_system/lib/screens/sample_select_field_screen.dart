import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleSelectFieldScreen extends StatefulWidget {
  const SampleSelectFieldScreen({super.key});
  @override
  State<SampleSelectFieldScreen> createState() =>
      _SampleSelectFieldScreenState();
}

class _SampleSelectFieldScreenState extends State<SampleSelectFieldScreen> {
  String? group = 'Peito';
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
    appBar: AppBarFactory.detail(title: 'Campo de seleção'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Grupo muscular', [
          SelectFieldFactory.standard<String>(
            label: 'Grupo muscular',
            value: group,
            items: [
              'Peito',
              'Costas',
              'Pernas',
              'Ombros',
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => group = v),
          ),
          Text('Selecionado: $group'),
          SelectFieldFactory.standard<String>(
            label: 'Seleção desabilitada',
            value: 'Peito',
            items: const [
              DropdownMenuItem(value: 'Peito', child: Text('Peito')),
            ],
            onChanged: null,
          ),
        ]),
      ],
    ),
  );
}
