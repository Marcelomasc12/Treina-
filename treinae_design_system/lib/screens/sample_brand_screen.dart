import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleBrandScreen extends StatefulWidget {
  const SampleBrandScreen({super.key});
  @override
  State<SampleBrandScreen> createState() => _SampleBrandScreenState();
}

class _SampleBrandScreenState extends State<SampleBrandScreen> {
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
    appBar: AppBarFactory.detail(title: 'Identidade do Treinaê'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Marca com assinatura', [BrandFactory.standard()]),
        section('Marca compacta', [BrandFactory.standard(showTagline: false)]),
      ],
    ),
  );
}
