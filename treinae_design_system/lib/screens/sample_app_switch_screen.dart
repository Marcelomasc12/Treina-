import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleSwitchScreen extends StatefulWidget {
  const SampleSwitchScreen({super.key});
  @override
  State<SampleSwitchScreen> createState() => _SampleSwitchScreenState();
}

class _SampleSwitchScreenState extends State<SampleSwitchScreen> {
  bool value = false;
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
    appBar: AppBarFactory.detail(title: 'Switch'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Preferências', [
          SwitchFactory.standard(
            label: 'Ativar lembretes',
            subtitle: 'Demonstração visual.',
            value: value,
            onChanged: (v) => setState(() => value = v),
          ),
          SwitchFactory.standard(
            label: 'Desabilitado',
            value: false,
            onChanged: null,
          ),
        ]),
      ],
    ),
  );
}
