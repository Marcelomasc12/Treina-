import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SamplePasswordFieldScreen extends StatefulWidget {
  const SamplePasswordFieldScreen({super.key});
  @override
  State<SamplePasswordFieldScreen> createState() =>
      _SamplePasswordFieldScreenState();
}

class _SamplePasswordFieldScreenState extends State<SamplePasswordFieldScreen> {
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
    appBar: AppBarFactory.detail(title: 'Campo de senha'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Visibilidade e estados', [
          PasswordFieldFactory.standard(helper: 'Use pelo menos 8 caracteres.'),
          PasswordFieldFactory.standard(
            label: 'Nova senha',
            error: 'As senhas devem coincidir.',
          ),
          PasswordFieldFactory.standard(label: 'Desabilitado', enabled: false),
        ]),
      ],
    ),
  );
}
