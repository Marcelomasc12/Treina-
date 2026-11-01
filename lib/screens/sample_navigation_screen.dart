import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleNavigationScreen extends StatefulWidget {
  const SampleNavigationScreen({super.key});
  @override
  State<SampleNavigationScreen> createState() => _SampleNavigationScreenState();
}

class _SampleNavigationScreenState extends State<SampleNavigationScreen> {
  int selected = 0;
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
    appBar: AppBarFactory.detail(title: 'Navegação inferior'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Abas', [
          NavigationFactory.standard(
            selectedIndex: selected,
            onSelected: (v) => setState(() => selected = v),
          ),
          Text('Aba: ${['Início', 'Treinos', 'Histórico'][selected]}'),
        ]),
      ],
    ),
  );
}
