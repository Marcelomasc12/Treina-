import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleActionButtonScreen extends StatefulWidget {
  const SampleActionButtonScreen({super.key});
  @override
  State<SampleActionButtonScreen> createState() =>
      _SampleActionButtonScreenState();
}

class _SampleActionButtonScreenState extends State<SampleActionButtonScreen> {
  bool busy = false;
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
    appBar: AppBarFactory.detail(title: 'Botões de ação'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Variantes', [
          ActionButtonFactory.primary(
            text: 'Iniciar treino',
            icon: Icons.play_arrow_outlined,
            onPressed: () => message('Iniciar treino selecionado.'),
          ),
          ActionButtonFactory.secondary(
            text: 'Abrir ficha',
            onPressed: () => message('Abrir ficha selecionado.'),
          ),
          ActionButtonFactory.text(
            text: 'Voltar ao início',
            onPressed: () => message('Voltar selecionado.'),
          ),
          ActionButtonFactory.danger(
            text: 'Excluir treino',
            onPressed: () => FeedbackFactory.confirm(
              context,
              title: 'Excluir treino?',
              message: 'Este é um exemplo de confirmação.',
              confirmLabel: 'Excluir',
              destructive: true,
            ),
          ),
        ]),
        section('Estados', [
          ActionButtonFactory.primary(
            text: 'Desabilitado',
            isEnabled: false,
            onPressed: () {},
          ),
          ActionButtonFactory.primary(
            text: 'Simular carregamento',
            isLoading: busy,
            onPressed: () async {
              setState(() => busy = true);
              await Future<void>.delayed(const Duration(milliseconds: 1000));
              if (mounted) setState(() => busy = false);
            },
          ),
        ]),
      ],
    ),
  );
}
