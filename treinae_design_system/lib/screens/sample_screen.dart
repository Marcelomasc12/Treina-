import 'package:flutter/material.dart';
import '../treinae_design_system.dart';
import 'sample_action_button_screen.dart';
import 'sample_text_field_screen.dart';
import 'sample_password_field_screen.dart';
import 'sample_search_bar_screen.dart';
import 'sample_select_field_screen.dart';
import 'sample_cards_screen.dart';
import 'sample_badge_screen.dart';
import 'sample_avatar_screen.dart';
import 'sample_brand_screen.dart';
import 'sample_empty_state_screen.dart';
import 'sample_section_title_screen.dart';
import 'sample_progress_screen.dart';
import 'sample_goal_card_screen.dart';
import 'sample_checkbox_screen.dart';
import 'sample_app_switch_screen.dart';
import 'sample_slider_screen.dart';
import 'sample_app_bar_screen.dart';
import 'sample_navigation_screen.dart';
import 'sample_feedback_screen.dart';
import 'sample_workout_card_screen.dart';
import 'sample_session_tile_screen.dart';
import 'sample_set_row_screen.dart';

class ListItem {
  final String title;
  final Widget screen;
  const ListItem({required this.title, required this.screen});
}

class SampleScreen extends StatelessWidget {
  const SampleScreen({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });
  final bool isDark;
  final VoidCallback onToggleTheme;
  static const components = <ListItem>[
    ListItem(title: 'Botões de ação', screen: const SampleActionButtonScreen()),
    ListItem(title: 'Campos de texto', screen: const SampleTextFieldScreen()),
    ListItem(
      title: 'Campo de senha',
      screen: const SamplePasswordFieldScreen(),
    ),
    ListItem(title: 'Barra de busca', screen: const SampleSearchBarScreen()),
    ListItem(
      title: 'Campo de seleção',
      screen: const SampleSelectFieldScreen(),
    ),
    ListItem(title: 'Cards', screen: const SampleCardScreen()),
    ListItem(title: 'Etiquetas', screen: const SampleBadgeScreen()),
    ListItem(title: 'Avatar', screen: const SampleAvatarScreen()),
    ListItem(title: 'Identidade do Treinaê', screen: const SampleBrandScreen()),
    ListItem(title: 'Estado vazio', screen: const SampleEmptyStateScreen()),
    ListItem(
      title: 'Título de seção',
      screen: const SampleSectionTitleScreen(),
    ),
    ListItem(title: 'Barra de progresso', screen: const SampleProgressScreen()),
    ListItem(title: 'Meta mensal', screen: const SampleGoalCardScreen()),
    ListItem(title: 'Caixa de seleção', screen: const SampleCheckboxScreen()),
    ListItem(title: 'Switch', screen: const SampleSwitchScreen()),
    ListItem(title: 'Slider', screen: const SampleSliderScreen()),
    ListItem(title: 'Cabeçalho', screen: const SampleAppBarScreen()),
    ListItem(
      title: 'Navegação inferior',
      screen: const SampleNavigationScreen(),
    ),
    ListItem(
      title: 'Mensagens e confirmações',
      screen: const SampleFeedbackScreen(),
    ),
    ListItem(title: 'Ficha de treino', screen: const SampleWorkoutCardScreen()),
    ListItem(
      title: 'Item do histórico',
      screen: const SampleSessionTileScreen(),
    ),
    ListItem(title: 'Registro de série', screen: const SampleSetRowScreen()),
  ];
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBarFactory.main(
      title: 'Treinaê • Design System',
      actions: [
        IconButton(
          tooltip: isDark ? 'Usar tema claro' : 'Usar tema escuro',
          onPressed: onToggleTheme,
          icon: Icon(
            isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
          ),
        ),
      ],
    ),
    body: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        BrandFactory.standard(),
        const SizedBox(height: 24),
        const Text('Catálogo de componentes', style: AppTextStyles.heading),
        const SizedBox(height: 8),
        const Text(
          'Cada componente possui Component, Factory e ViewModel. Toque para testar.',
        ),
        const SizedBox(height: 24),
        for (final item in components) ...[
          CardFactory.standard(
            padding: EdgeInsets.zero,
            child: ListTile(
              title: Text(item.title),
              subtitle: const Text('Ver exemplos e estados'),
              leading: const Icon(Icons.widgets_outlined),
              trailing: const Icon(Icons.chevron_right),
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute<void>(builder: (_) => item.screen),
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
        const SizedBox(height: 16),
        const Text(
          'Marcelo Negrão • Mobile 2\nProfessor Malfatti • Versão 2.0',
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
