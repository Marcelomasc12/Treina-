import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleCheckboxScreen extends StatefulWidget {
  const SampleCheckboxScreen({super.key});
  @override
  State<SampleCheckboxScreen> createState() => _SampleCheckboxScreenState();
}

class _SampleCheckboxScreenState extends State<SampleCheckboxScreen> {
  bool checked = false;
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
    appBar: AppBarFactory.detail(title: 'Caixa de seleção'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Interação', [
          CheckboxFactory.standard(
            label: 'Série concluída',
            value: checked,
            onChanged: (v) => setState(() => checked = v),
          ),
          CheckboxFactory.standard(
            label: 'Desabilitado',
            value: false,
            onChanged: null,
          ),
          Text(checked ? 'Série marcada.' : 'Série pendente.'),
        ]),
      ],
    ),
  );
}
