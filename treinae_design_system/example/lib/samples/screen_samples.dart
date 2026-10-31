import 'package:flutter/material.dart';
import 'package:treinae_design_system/treinae_design_system.dart';
import '../viewmodels/sample_view_model.dart';

/// Composições visuais do catálogo. Não é o aplicativo final nem um mock HTTP.
class ScreenSamples extends StatefulWidget {
  const ScreenSamples({super.key, required this.model});
  final SampleViewModel model;
  @override
  State<ScreenSamples> createState() => _ScreenSamplesState();
}

class _ScreenSamplesState extends State<ScreenSamples> {
  final _form = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _search = TextEditingController();
  final _weight = List.generate(3, (_) => TextEditingController(text: '20'));
  final _reps = List.generate(3, (_) => TextEditingController(text: '10'));
  final _done = List.filled(3, false);
  bool _loggedIn = false;
  int _tab = 0;
  String _query = '';
  int _completed = 12;
  static const _names = [
    'Treino A — Peito e tríceps',
    'Treino B — Costas e bíceps',
    'Treino C — Pernas e ombros',
  ];

  List<String> _exercisesFor(String name) => name == _names[1]
      ? ['Remada baixa', 'Puxada frontal', 'Remada unilateral', 'Rosca direta']
      : name == _names[2]
      ? ['Agachamento', 'Leg press', 'Cadeira extensora', 'Desenvolvimento']
      : ['Supino reto', 'Supino inclinado', 'Crucifixo', 'Tríceps na polia'];

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _search.dispose();
    for (final c in [..._weight, ..._reps]) {
      c.dispose();
    }
    super.dispose();
  }

  Widget _login(BuildContext context) {
    final c = TreinaeColors.of(context);
    return ListView(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
      children: [
        const TreinaeBrand(),
        const SizedBox(height: 56),
        const Text('Bom te ver por aqui!', style: TreinaeTypography.title),
        const SizedBox(height: 8),
        Text(
          'Entre para acompanhar seus treinos.',
          style: TreinaeTypography.body.copyWith(color: c.muted),
        ),
        const SizedBox(height: 28),
        Form(
          key: _form,
          child: AutofillGroup(
            child: Column(
              children: [
                TreinaeTextField(
                  label: 'E-mail',
                  controller: _email,
                  hint: 'Digite seu e-mail',
                  icon: Icons.mail_outline,
                  autofillHints: const [AutofillHints.email],
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  validator: (v) =>
                      v == null ||
                          !RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$').hasMatch(v)
                      ? 'Informe um e-mail válido.'
                      : null,
                ),
                const SizedBox(height: 20),
                TreinaePasswordField(
                  controller: _password,
                  validator: (v) => (v?.length ?? 0) < 8
                      ? 'Use pelo menos 8 caracteres.'
                      : null,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => TreinaeFeedback.sheet<void>(
                      context,
                      title: 'Esqueceu sua senha?',
                      child: const TreinaeMessage(
                        'Exemplo visual. A recuperação será conectada à API no aplicativo.',
                      ),
                    ),
                    child: const Text('Esqueci minha senha'),
                  ),
                ),
                const SizedBox(height: 20),
                TreinaeButton(
                  label: 'Entrar',
                  icon: Icons.arrow_forward,
                  onPressed: () {
                    if (_form.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      setState(() => _loggedIn = true);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Text('Ainda não tem uma conta?'),
            TextButton(
              onPressed: () => TreinaeFeedback.toast(
                context,
                'Cadastro será implementado no app. Esta é uma galeria visual.',
              ),
              child: const Text('Cadastre-se'),
            ),
          ],
        ),
        const SizedBox(height: 32),
        Text(
          'Um treino de cada vez.',
          textAlign: TextAlign.center,
          style: TreinaeTypography.caption.copyWith(
            color: c.muted,
            letterSpacing: 2,
          ),
        ),
      ],
    );
  }

  void _openWorkout(String name) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (routeContext) => Scaffold(
          appBar: const TreinaeAppBar(title: 'Ficha de treino'),
          body: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Text(name, style: TreinaeTypography.title),
              const SizedBox(height: 20),
              for (final entry in _exercisesFor(name)) ...[
                TreinaeCard(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(entry, style: TreinaeTypography.label),
                      const SizedBox(height: 6),
                      const Text('3 séries • 10 repetições • descanso de 60 s'),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
              ],
              const SizedBox(height: 12),
              TreinaeButton(
                label: 'Iniciar treino',
                onPressed: () {
                  Navigator.pop(routeContext);
                  _startWorkout(name);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _startWorkout(String name) {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (routeContext) => StatefulBuilder(
          builder: (context, update) => Scaffold(
            appBar: const TreinaeAppBar(title: 'Executar treino'),
            body: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                Text(name, style: TreinaeTypography.heading),
                const SizedBox(height: 12),
                const TreinaeMessage(
                  'Exemplo de composição: registre as três séries do primeiro exercício.',
                ),
                const SizedBox(height: 20),
                TreinaeSectionTitle(_exercisesFor(name).first),
                const SizedBox(height: 12),
                TreinaeProgress(
                  value: _done.where((v) => v).length / 3,
                  label: '${_done.where((v) => v).length} de 3 séries',
                ),
                const SizedBox(height: 20),
                for (var i = 0; i < 3; i++)
                  TreinaeSetRow(
                    number: i + 1,
                    completed: _done[i],
                    weightController: _weight[i],
                    repsController: _reps[i],
                    onCompleted: (v) {
                      if (v) {
                        final weight = double.tryParse(
                          _weight[i].text.replaceAll(',', '.'),
                        );
                        final reps = int.tryParse(_reps[i].text);
                        if (weight == null ||
                            !weight.isFinite ||
                            weight < 0 ||
                            weight > 1000 ||
                            reps == null ||
                            reps < 1 ||
                            reps > 100) {
                          TreinaeFeedback.toast(
                            context,
                            'Revise carga (0 a 1000 kg) e repetições (1 a 100).',
                            error: true,
                          );
                          return;
                        }
                      }
                      update(() => _done[i] = v);
                    },
                  ),
                const SizedBox(height: 24),
                TreinaeButton(
                  label: 'Finalizar exemplo',
                  onPressed: () async {
                    if (!_done.contains(true)) {
                      TreinaeFeedback.toast(
                        context,
                        'Conclua ao menos uma série.',
                        error: true,
                      );
                      return;
                    }
                    if (_done.contains(false)) {
                      final ok = await TreinaeFeedback.confirm(
                        context,
                        title: 'Finalizar com séries pendentes?',
                        message:
                            'Somente as séries concluídas entram neste exemplo.',
                        confirmLabel: 'Finalizar',
                      );
                      if (!ok || !routeContext.mounted) return;
                    }
                    if (!routeContext.mounted) return;
                    Navigator.pop(routeContext);
                    setState(() => _completed++);
                    if (mounted)
                      TreinaeFeedback.toast(
                        this.context,
                        'Treino concluído no exemplo! Os dados não são persistidos.',
                      );
                    _done.fillRange(0, 3, false);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _profile() {
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (context) => ListenableBuilder(
          listenable: widget.model,
          builder: (context, _) => Scaffold(
            appBar: const TreinaeAppBar(title: 'Perfil'),
            body: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                const Center(
                  child: TreinaeAvatar(name: 'Marcelo Negrão', large: true),
                ),
                const SizedBox(height: 16),
                const Text(
                  'Marcelo Negrão',
                  textAlign: TextAlign.center,
                  style: TreinaeTypography.heading,
                ),
                const Text('marcelo@exemplo.com', textAlign: TextAlign.center),
                const SizedBox(height: 24),
                TreinaeGoalCard(completed: _completed, goal: 16),
                const SizedBox(height: 20),
                TreinaeSwitch(
                  label: 'Tema escuro',
                  value: widget.model.isDark,
                  onChanged: (_) => widget.model.toggleTheme(),
                ),
                const SizedBox(height: 20),
                const TreinaeMessage(
                  'Perfil demonstrativo do sample app. Não há uma conta real.',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _home(BuildContext context) => ListView(
    padding: const EdgeInsets.all(20),
    children: [
      Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('OUTUBRO DE 2026', style: TreinaeTypography.caption),
                SizedBox(height: 8),
                Text('Olá, Marcelo!', style: TreinaeTypography.title),
                Text('Bora fazer mais um treino?'),
              ],
            ),
          ),
          TreinaeAvatar(name: 'Marcelo Negrão', onTap: _profile),
        ],
      ),
      const SizedBox(height: 24),
      TreinaeCard(
        child: Row(
          children: [
            const Icon(Icons.calendar_today_outlined),
            const SizedBox(width: 12),
            const Expanded(child: Text('Outubro de 2026')),
            TextButton(
              onPressed: () =>
                  TreinaeFeedback.toast(context, 'Mês fixo de demonstração.'),
              child: const Text('Ver'),
            ),
          ],
        ),
      ),
      const SizedBox(height: 20),
      Text('$_completed treinos realizados', style: TreinaeTypography.heading),
      const SizedBox(height: 12),
      TreinaeGoalCard(completed: _completed, goal: 16),
      const SizedBox(height: 12),
      const TreinaeCard(
        child: Row(
          children: [
            Icon(Icons.schedule),
            SizedBox(width: 12),
            Expanded(child: Text('Tempo treinando: 9 h')),
          ],
        ),
      ),
      const SizedBox(height: 28),
      const TreinaeSectionTitle('Pronto para treinar?'),
      const SizedBox(height: 12),
      TreinaeWorkoutCard(
        index: 'A',
        title: _names[0],
        exerciseCount: 4,
        onOpen: () => _openWorkout(_names[0]),
        onStart: () => _startWorkout(_names[0]),
      ),
      const SizedBox(height: 28),
      const TreinaeSectionTitle('Último treino'),
      const SizedBox(height: 12),
      TreinaeSessionTile(
        title: _names[1],
        subtitle: '30/10/2026 • 45 minutos',
        onTap: _historyDetails,
      ),
    ],
  );

  void _historyDetails() => Navigator.push(
    context,
    MaterialPageRoute<void>(
      builder: (_) => Scaffold(
        appBar: const TreinaeAppBar(title: 'Treino realizado'),
        body: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Text(_names[1], style: TreinaeTypography.heading),
            const SizedBox(height: 12),
            const TreinaeBadge('Concluído', tone: TreinaeBadgeTone.success),
            const SizedBox(height: 16),
            const Text('30/10/2026 • 45 minutos'),
            const SizedBox(height: 20),
            const TreinaeCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Remada baixa', style: TreinaeTypography.label),
                  SizedBox(height: 12),
                  Text('Série 1: 20 kg × 10 repetições'),
                  Text('Série 2: 20 kg × 10 repetições'),
                  Text('Série 3: 20 kg × 8 repetições'),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _workouts() => ListView(
    padding: const EdgeInsets.all(20),
    children: [
      const Text('Meus treinos', style: TreinaeTypography.title),
      const SizedBox(height: 20),
      TreinaeSearchField(
        controller: _search,
        onChanged: (v) => setState(() => _query = v),
      ),
      const SizedBox(height: 20),
      for (var i = 0; i < _names.length; i++)
        if (_names[i].toLowerCase().contains(_query.toLowerCase())) ...[
          TreinaeWorkoutCard(
            index: ['A', 'B', 'C'][i],
            title: _names[i],
            exerciseCount: 4,
            onOpen: () => _openWorkout(_names[i]),
            onStart: () => _startWorkout(_names[i]),
          ),
          const SizedBox(height: 12),
        ],
      if (!_names.any((n) => n.toLowerCase().contains(_query.toLowerCase())))
        const TreinaeEmptyState(
          title: 'Nenhum treino encontrado',
          message: 'Tente buscar por outro nome.',
          icon: Icons.search,
        ),
    ],
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: TreinaeAppBar(
      title: _loggedIn ? 'Aplicação dos componentes' : 'Login • exemplo',
      actions: [
        IconButton(
          tooltip: 'Alternar tema',
          onPressed: widget.model.toggleTheme,
          icon: const Icon(Icons.contrast),
        ),
      ],
    ),
    bottomNavigationBar: _loggedIn
        ? TreinaeBottomNavigation(
            selectedIndex: _tab,
            onSelected: (v) => setState(() => _tab = v),
          )
        : null,
    body: !_loggedIn
        ? _login(context)
        : switch (_tab) {
            0 => _home(context),
            1 => _workouts(),
            _ => ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Text('Histórico', style: TreinaeTypography.title),
                const SizedBox(height: 20),
                TreinaeSessionTile(
                  title: _names[1],
                  subtitle: '30/10/2026 • 45 minutos',
                  onTap: _historyDetails,
                ),
                const SizedBox(height: 12),
                TreinaeSessionTile(
                  title: _names[0],
                  subtitle: '28/10/2026 • 50 minutos',
                ),
              ],
            ),
          },
  );
}
