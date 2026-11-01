import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleFeedbackScreen extends StatefulWidget {
  const SampleFeedbackScreen({super.key});
  @override
  State<SampleFeedbackScreen> createState() => _SampleFeedbackScreenState();
}

class _SampleFeedbackScreenState extends State<SampleFeedbackScreen> {
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
    appBar: AppBarFactory.detail(title: 'Mensagens e confirmações'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Mensagens', [
          FeedbackFactory.standard(message: 'Você pode retomar seu treino.'),
          FeedbackFactory.standard(
            message: 'Alterações salvas.',
            tone: FeedbackTone.success,
          ),
          FeedbackFactory.standard(
            message: 'Não foi possível salvar.',
            tone: FeedbackTone.error,
          ),
        ]),
        section('Interações', [
          ActionButtonFactory.primary(
            text: 'Abrir confirmação',
            onPressed: () async {
              final result = await FeedbackFactory.confirm(
                context,
                title: 'Excluir ficha?',
                message: 'O histórico será preservado.',
                confirmLabel: 'Excluir',
                destructive: true,
              );
              if (mounted) message(result ? 'Confirmado.' : 'Cancelado.');
            },
          ),
          ActionButtonFactory.secondary(
            text: 'Abrir painel inferior',
            onPressed: () => FeedbackFactory.sheet<void>(
              context,
              title: 'Adicionar exercício',
              child: TextFieldFactory.standard(
                label: 'Nome do exercício',
                hint: 'Ex.: Supino reto',
              ),
            ),
          ),
          ActionButtonFactory.secondary(
            text: 'Mostrar notificação',
            onPressed: () => message('Treino salvo.'),
          ),
        ]),
      ],
    ),
  );
}
