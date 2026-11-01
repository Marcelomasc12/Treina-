import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleAppBarScreen extends StatefulWidget {
  const SampleAppBarScreen({super.key});
  @override
  State<SampleAppBarScreen> createState() => _SampleAppBarScreenState();
}

class _SampleAppBarScreenState extends State<SampleAppBarScreen> {
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
    appBar: AppBarFactory.detail(title: 'Cabeçalho'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Cabeçalho com retorno', [
          const Text(
            'O cabeçalho desta tela foi criado por AppBarFactory.detail. A seta retorna ao catálogo.',
          ),
          ActionButtonFactory.primary(
            text: 'Abrir exemplo sem retorno',
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => Scaffold(
                  appBar: AppBarFactory.main(title: 'Cabeçalho principal'),
                  body: Center(
                    child: ActionButtonFactory.secondary(
                      text: 'Voltar ao catálogo',
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ],
    ),
  );
}
