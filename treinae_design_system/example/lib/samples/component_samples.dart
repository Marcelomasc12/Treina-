import 'package:flutter/material.dart';
import 'package:treinae_design_system/treinae_design_system.dart';
import '../viewmodels/sample_view_model.dart';

class ComponentSamples extends StatefulWidget {
  const ComponentSamples({
    super.key,
    required this.section,
    required this.model,
  });
  final int section;
  final SampleViewModel model;
  @override
  State<ComponentSamples> createState() => _ComponentSamplesState();
}

class _ComponentSamplesState extends State<ComponentSamples> {
  final weight = TextEditingController(text: '20');
  final reps = TextEditingController(text: '10');
  final form = GlobalKey<FormState>();
  final search = TextEditingController();
  final exercises = ['Supino reto', 'Remada baixa', 'Agachamento'];
  String query = '';
  @override
  void dispose() {
    weight.dispose();
    reps.dispose();
    search.dispose();
    super.dispose();
  }

  Widget group(String title, List<Widget> children) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 24),
      TreinaeSectionTitle(title),
      const SizedBox(height: 12),
      for (final child in children) ...[child, const SizedBox(height: 12)],
    ],
  );

  @override
  Widget build(BuildContext context) {
    final m = widget.model;
    final c = TreinaeColors.of(context);
    const titles = [
      'Fundamentos',
      'Botões',
      'Campos',
      'Controles',
      'Cards e identificação',
      'Navegação e feedback',
      'Componentes de treino',
    ];
    return ListenableBuilder(
      listenable: m,
      builder: (_, __) {
        final content = switch (widget.section) {
          0 => <Widget>[
            group('Cores do tema atual', [
              for (final entry in <String, Color>{
                'Principal': c.primary,
                'Fundo': c.background,
                'Superfície': c.surface,
                'Sálvia': c.sage,
                'Texto': c.text,
                'Texto secundário': c.muted,
                'Borda': c.border,
                'Erro': c.danger,
              }.entries)
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: entry.value,
                        border: Border.all(color: c.border),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(child: Text(entry.key)),
                    Text(
                      '#${entry.value.toARGB32().toRadixString(16).substring(2).toUpperCase()}',
                      style: TreinaeTypography.caption,
                    ),
                  ],
                ),
            ]),
            group('Tipografia Manrope', [
              const Text(
                'Seu treino, sua evolução.',
                style: TreinaeTypography.title,
              ),
              const Text(
                'Título de seção • 18',
                style: TreinaeTypography.heading,
              ),
              const Text(
                'Texto de leitura • 14',
                style: TreinaeTypography.body,
              ),
              const Text(
                'Rótulo de campo • 13',
                style: TreinaeTypography.label,
              ),
              const Text(
                'Informação auxiliar • 12',
                style: TreinaeTypography.caption,
              ),
            ]),
            group('Espaçamento', [
              const Text('4 • 8 • 12 • 16 • 20 • 24 • 32 px'),
              const Text(
                'Campos e botões: raio 14 px. Cards: 18 px. Diálogos: 22 px.',
              ),
            ]),
            TreinaeSwitch(
              label: 'Tema escuro',
              value: m.isDark,
              onChanged: (_) => m.toggleTheme(),
            ),
          ],
          1 => <Widget>[
            group('Variantes', [
              TreinaeButtonFactory.primary(
                label: 'Iniciar treino',
                icon: Icons.play_arrow_outlined,
                onPressed: () =>
                    TreinaeFeedback.toast(context, 'Botão principal acionado.'),
              ),
              TreinaeButtonFactory.secondary(
                label: 'Abrir ficha',
                onPressed: () {},
              ),
              TreinaeButtonFactory.ghost(
                label: 'Voltar ao início',
                onPressed: () {},
              ),
              TreinaeButtonFactory.danger(
                label: 'Excluir treino',
                onPressed: () async {
                  await TreinaeFeedback.confirm(
                    context,
                    title: 'Excluir treino?',
                    message: 'Este é um exemplo de confirmação.',
                    confirmLabel: 'Excluir',
                    destructive: true,
                  );
                },
              ),
            ]),
            group('Estados', [
              const TreinaeButton(label: 'Desabilitado', onPressed: null),
              TreinaeButton(
                label: 'Simular carregamento',
                loading: m.busy,
                onPressed: m.simulateLoading,
              ),
              const Text(
                'O botão bloqueia novos toques durante o carregamento.',
              ),
            ]),
            group('Tamanho compacto', [
              TreinaeButton(
                label: 'Novo treino',
                icon: Icons.add,
                fullWidth: false,
                compact: true,
                onPressed: () {},
              ),
            ]),
          ],
          2 => <Widget>[
            group('Formulário e validação', [
              Form(
                key: form,
                child: Column(
                  children: [
                    TreinaeTextField(
                      label: 'E-mail',
                      hint: 'voce@exemplo.com',
                      icon: Icons.mail_outline,
                      keyboardType: TextInputType.emailAddress,
                      validator: (v) =>
                          v == null ||
                              !RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(v)
                          ? 'Informe um e-mail válido.'
                          : null,
                    ),
                    const SizedBox(height: 16),
                    TreinaePasswordField(
                      helper: 'Use pelo menos 8 caracteres.',
                      validator: (v) => (v?.length ?? 0) < 8
                          ? 'Use pelo menos 8 caracteres.'
                          : null,
                    ),
                    const SizedBox(height: 16),
                    TreinaeButton(
                      label: 'Validar campos',
                      onPressed: () {
                        if (form.currentState!.validate())
                          TreinaeFeedback.toast(context, 'Campos válidos.');
                      },
                    ),
                  ],
                ),
              ),
            ]),
            group('Outros estados', [
              const TreinaeTextField(
                label: 'Nome',
                hint: 'Digite seu nome',
                error: 'Informe seu nome.',
              ),
              const TreinaeTextField(
                label: 'Campo desabilitado',
                hint: 'Indisponível',
                enabled: false,
              ),
              const TreinaeTextField(
                label: 'E-mail de consulta',
                hint: 'marcelo@exemplo.com',
                readOnly: true,
              ),
              const TreinaeTextField(
                label: 'Observações',
                hint: 'Como foi o treino?',
                maxLines: 3,
              ),
              TreinaeSelect<String>(
                label: 'Grupo muscular',
                value: m.muscleGroup,
                items: ['Peito', 'Costas', 'Pernas', 'Ombros']
                    .map((v) => DropdownMenuItem(value: v, child: Text(v)))
                    .toList(),
                onChanged: m.setMuscleGroup,
              ),
            ]),
            group('Busca com resultado local', [
              TreinaeSearchField(
                controller: search,
                hint: 'Buscar exercício',
                onChanged: (v) => setState(() => query = v),
              ),
              for (final e in exercises.where(
                (e) => e.toLowerCase().contains(query.toLowerCase()),
              ))
                Text(e),
              if (!exercises.any(
                (e) => e.toLowerCase().contains(query.toLowerCase()),
              ))
                const Text('Nenhum exercício encontrado.'),
            ]),
          ],
          3 => <Widget>[
            group('Controles interativos', [
              TreinaeCheckbox(
                label: 'Série concluída',
                value: m.checked,
                onChanged: m.setChecked,
              ),
              const TreinaeCheckbox(
                label: 'Opção desabilitada',
                value: false,
                onChanged: null,
              ),
              TreinaeSwitch(
                label: 'Ativar lembretes',
                subtitle: 'Demonstração de controle visual.',
                value: m.notifications,
                onChanged: m.setNotifications,
              ),
              TreinaeSwitch(
                label: 'Tema escuro',
                value: m.isDark,
                onChanged: (_) => m.toggleTheme(),
              ),
              const TreinaeSwitch(
                label: 'Switch desabilitado',
                value: false,
                onChanged: null,
              ),
              TreinaeSlider(
                label: 'Descanso (segundos)',
                value: m.restSeconds,
                onChanged: m.setRest,
              ),
            ]),
            group('Progresso e meta', [
              const TreinaeProgress(value: 0, label: 'Ainda não começou'),
              const TreinaeProgress(value: .75, label: '75% concluído'),
              const TreinaeGoalCard(completed: 12, goal: 16),
              const TreinaeGoalCard(completed: 18, goal: 16),
            ]),
          ],
          4 => <Widget>[
            group('Superfícies', [
              const TreinaeCard(child: Text('Card padrão com borda suave.')),
              const TreinaeCard(
                highlighted: true,
                child: Text('Card com destaque sálvia.'),
              ),
              TreinaeCard(
                onTap: () =>
                    TreinaeFeedback.toast(context, 'Card selecionado.'),
                child: const Text('Card que responde ao toque.'),
              ),
            ]),
            group('Avatar e etiquetas', [
              Wrap(
                spacing: 16,
                runSpacing: 16,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  TreinaeAvatar(
                    name: 'Marcelo Negrão',
                    onTap: () =>
                        TreinaeFeedback.toast(context, 'Perfil selecionado.'),
                  ),
                  const TreinaeAvatar(name: 'Marcelo Negrão', large: true),
                  const TreinaeAvatar(name: ''),
                ],
              ),
              const Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  TreinaeBadge('Peito'),
                  TreinaeBadge('Concluído', tone: TreinaeBadgeTone.success),
                  TreinaeBadge('Cancelado', tone: TreinaeBadgeTone.danger),
                ],
              ),
            ]),
            group('Estado vazio', [
              TreinaeEmptyState(
                title: 'Nenhuma ficha cadastrada',
                message: 'Crie sua primeira ficha para começar.',
                action: TreinaeButton(
                  label: 'Criar treino',
                  icon: Icons.add,
                  onPressed: () =>
                      TreinaeFeedback.toast(context, 'Ação do estado vazio.'),
                ),
              ),
            ]),
          ],
          5 => <Widget>[
            group('Navegação inferior', [
              TreinaeBottomNavigation(
                selectedIndex: m.tab,
                onSelected: m.setTab,
              ),
              Text(
                'Aba selecionada: ${['Início', 'Treinos', 'Histórico'][m.tab]}',
              ),
            ]),
            group('Mensagens', [
              const TreinaeMessage(
                'Você pode retomar seu treino quando quiser.',
              ),
              const TreinaeMessage(
                'Alterações salvas.',
                tone: TreinaeMessageTone.success,
              ),
              const TreinaeMessage(
                'Não foi possível salvar. Tente novamente.',
                tone: TreinaeMessageTone.error,
              ),
            ]),
            group('Diálogo, painel e notificação', [
              TreinaeButton(
                label: 'Abrir confirmação',
                onPressed: () async {
                  final ok = await TreinaeFeedback.confirm(
                    context,
                    title: 'Excluir ficha?',
                    message:
                        'O histórico dos treinos realizados será preservado.',
                    confirmLabel: 'Excluir',
                    destructive: true,
                  );
                  if (context.mounted)
                    TreinaeFeedback.toast(
                      context,
                      ok
                          ? 'Exclusão confirmada no exemplo.'
                          : 'Ação cancelada.',
                    );
                },
              ),
              TreinaeButton(
                label: 'Abrir painel inferior',
                variant: TreinaeButtonVariant.secondary,
                onPressed: () => TreinaeFeedback.sheet<void>(
                  context,
                  title: 'Adicionar exercício',
                  child: const TreinaeTextField(
                    label: 'Nome do exercício',
                    hint: 'Ex.: Supino reto',
                  ),
                ),
              ),
              TreinaeButton(
                label: 'Mostrar notificação',
                variant: TreinaeButtonVariant.secondary,
                onPressed: () =>
                    TreinaeFeedback.toast(context, 'Treino salvo com sucesso.'),
              ),
            ]),
          ],
          _ => <Widget>[
            group('Ficha de treino', [
              TreinaeWorkoutCard(
                index: 'A',
                title: 'Treino A — Peito e tríceps',
                exerciseCount: 4,
                onOpen: () =>
                    TreinaeFeedback.toast(context, 'Abrir ficha selecionado.'),
                onStart: () => TreinaeFeedback.toast(
                  context,
                  'Iniciar treino selecionado.',
                ),
                onAction: (a) => TreinaeFeedback.toast(
                  context,
                  a == TreinaeWorkoutAction.edit
                      ? 'Editar selecionado.'
                      : 'Excluir selecionado.',
                ),
              ),
            ]),
            group('Histórico', [
              TreinaeSessionTile(
                title: 'Treino B — Costas e bíceps',
                subtitle: '30/10/2026 • 45 minutos',
                onTap: () =>
                    TreinaeFeedback.toast(context, 'Detalhes selecionados.'),
              ),
            ]),
            group('Série editável', [
              const Text(
                'Digite carga e repetições e marque a série como concluída.',
              ),
              TreinaeSetRow(
                number: 1,
                completed: m.checked,
                weightController: weight,
                repsController: reps,
                onCompleted: m.setChecked,
              ),
            ]),
          ],
        };
        return Scaffold(
          appBar: TreinaeAppBar(title: titles[widget.section]),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 32),
            children: content,
          ),
        );
      },
    );
  }
}
