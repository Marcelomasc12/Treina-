import 'package:flutter/material.dart';
import '../treinae_design_system.dart';

class SampleTextFieldScreen extends StatefulWidget {
  const SampleTextFieldScreen({super.key});
  @override
  State<SampleTextFieldScreen> createState() => _SampleTextFieldScreenState();
}

class _SampleTextFieldScreenState extends State<SampleTextFieldScreen> {
  final email = TextEditingController();
  final form = GlobalKey<FormState>();
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

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
    appBar: AppBarFactory.detail(title: 'Campos de texto'),
    body: ListView(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
      children: [
        section('Formulário e validação', [
          Form(
            key: form,
            child: Column(
              children: [
                TextFieldFactory.email(
                  controller: email,
                  validator: (v) => v == null || !v.contains('@')
                      ? 'Informe um e-mail válido.'
                      : null,
                ),
                const SizedBox(height: 16),
                ActionButtonFactory.primary(
                  text: 'Validar campo',
                  onPressed: () {
                    if (form.currentState!.validate())
                      message('E-mail válido.');
                  },
                ),
              ],
            ),
          ),
        ]),
        section('Estados', [
          TextFieldFactory.standard(label: 'Nome', hint: 'Digite seu nome'),
          TextFieldFactory.standard(
            label: 'Nome obrigatório',
            error: 'Informe seu nome.',
          ),
          TextFieldFactory.standard(
            label: 'Desabilitado',
            hint: 'Indisponível',
            enabled: false,
          ),
          TextFieldFactory.standard(
            label: 'Somente leitura',
            hint: 'marcelo@exemplo.com',
            readOnly: true,
          ),
          TextFieldFactory.standard(
            label: 'Observações',
            maxLines: 3,
            hint: 'Como foi seu treino?',
          ),
        ]),
      ],
    ),
  );
}
