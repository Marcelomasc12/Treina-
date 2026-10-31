import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:treinae_design_system/treinae_design_system.dart';
import '../viewmodels/sample_view_model.dart';
import 'component_samples.dart';
import 'screen_samples.dart';

class TreinaeSampleApp extends StatefulWidget {
  const TreinaeSampleApp({super.key, required this.model});
  final SampleViewModel model;
  @override
  State<TreinaeSampleApp> createState() => _TreinaeSampleAppState();
}

class _TreinaeSampleAppState extends State<TreinaeSampleApp> {
  SampleViewModel get model => widget.model;
  @override
  void dispose() {
    model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => ListenableBuilder(
    listenable: model,
    builder: (_, __) => MaterialApp(
      title: 'Treinaê - Design System',
      debugShowCheckedModeBanner: false,
      theme: TreinaeTheme.light,
      darkTheme: TreinaeTheme.dark,
      themeMode: model.themeMode,
      locale: const Locale('pt', 'BR'),
      supportedLocales: const [Locale('pt', 'BR')],
      localizationsDelegates: GlobalMaterialLocalizations.delegates,
      builder: (context, child) => ColoredBox(
        color: TreinaeColors.of(context).sage,
        child: Align(
          alignment: Alignment.topCenter,
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: child!,
          ),
        ),
      ),
      home: GalleryHome(model: model),
    ),
  );
}

class GalleryHome extends StatelessWidget {
  const GalleryHome({super.key, required this.model});
  final SampleViewModel model;
  @override
  Widget build(BuildContext context) {
    final c = TreinaeColors.of(context);
    final categories = [
      (
        'Fundamentos',
        'Paleta, tipografia e espaçamentos',
        Icons.palette_outlined,
      ),
      (
        'Botões',
        'Variantes, desabilitado e carregando',
        Icons.touch_app_outlined,
      ),
      ('Campos', 'Texto, senha, busca e seleção', Icons.edit_note_outlined),
      ('Controles', 'Checkbox, switch, slider e progresso', Icons.tune),
      (
        'Cards e identificação',
        'Cards, avatar, etiquetas e estado vazio',
        Icons.dashboard_outlined,
      ),
      (
        'Navegação e feedback',
        'Menu, cabeçalho, mensagens e diálogos',
        Icons.navigation_outlined,
      ),
      (
        'Componentes de treino',
        'Ficha, histórico e registro de série',
        Icons.fitness_center,
      ),
    ];
    return Scaffold(
      appBar: TreinaeAppBar(
        title: 'Design System',
        showBack: false,
        actions: [
          IconButton(
            tooltip: model.isDark ? 'Usar tema claro' : 'Usar tema escuro',
            onPressed: model.toggleTheme,
            icon: Icon(
              model.isDark
                  ? Icons.light_mode_outlined
                  : Icons.dark_mode_outlined,
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const TreinaeBrand(),
          const SizedBox(height: 24),
          const Text(
            'Uma base para cada conquista.',
            style: TreinaeTypography.heading,
          ),
          const SizedBox(height: 8),
          Text(
            'Explore os componentes e teste seus estados. '
            'As demonstrações usam dados locais.',
            style: TreinaeTypography.body.copyWith(color: c.muted),
          ),
          const SizedBox(height: 24),
          TreinaeButton(
            label: 'Ver telas de exemplo',
            icon: Icons.arrow_forward,
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (_) => ScreenSamples(model: model),
              ),
            ),
          ),
          const SizedBox(height: 24),
          for (var i = 0; i < categories.length; i++) ...[
            TreinaeCard(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => ComponentSamples(section: i, model: model),
                ),
              ),
              child: Row(
                children: [
                  Icon(categories[i].$3),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(categories[i].$1, style: TreinaeTypography.label),
                        const SizedBox(height: 4),
                        Text(
                          categories[i].$2,
                          style: TreinaeTypography.caption.copyWith(
                            color: c.muted,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
          const SizedBox(height: 12),
          Text(
            'Marcelo Negrão • Mobile 2\nProfessor Malfatti • Versão 1.0',
            textAlign: TextAlign.center,
            style: TreinaeTypography.caption.copyWith(color: c.muted),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
