import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleAvatarScreen extends StatefulWidget {
  const SampleAvatarScreen({super.key});
  @override
  State<SampleAvatarScreen> createState() => _SampleAvatarScreenState();
}

class _SampleAvatarScreenState extends State<SampleAvatarScreen> {
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
    appBar: AppBarFactory.detail(title: 'Avatar'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Tamanhos e iniciais', [
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              AvatarFactory.standard(
                name: 'Marcelo Negrão',
                onTap: () => message('Perfil selecionado.'),
              ),
              AvatarFactory.standard(name: 'Marcelo Negrão', large: true),
              AvatarFactory.standard(name: ''),
            ],
          ),
        ]),
      ],
    ),
  );
}
