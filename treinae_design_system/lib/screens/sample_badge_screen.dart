import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleBadgeScreen extends StatefulWidget {
  const SampleBadgeScreen({super.key});
  @override
  State<SampleBadgeScreen> createState() => _SampleBadgeScreenState();
}

class _SampleBadgeScreenState extends State<SampleBadgeScreen> {
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
    appBar: AppBarFactory.detail(title: 'Etiquetas'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Estados', [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              BadgeFactory.standard(label: 'Peito'),
              BadgeFactory.standard(
                label: 'Concluído',
                tone: BadgeTone.success,
              ),
              BadgeFactory.standard(label: 'Cancelado', tone: BadgeTone.danger),
            ],
          ),
        ]),
      ],
    ),
  );
}
