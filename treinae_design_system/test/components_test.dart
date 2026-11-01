import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:treinae_design_system/treinae_design_system.dart';

Widget host(Widget child) => MaterialApp(
  theme: AppTheme.theme,
  home: Scaffold(
    body: Padding(padding: const EdgeInsets.all(20), child: child),
  ),
);

void main() {
  test('factory cria componente com configuração no ViewModel', () {
    final button = ActionButtonFactory.primary(
      text: 'Salvar',
      onPressed: () {},
      isLoading: true,
    );
    expect(button, isA<ActionButtonComponent>());
    expect(button.viewModel.label, 'Salvar');
    expect(button.viewModel.loading, isTrue);
    expect(button.viewModel.variant, ActionButtonType.primary);
    expect(
      ActionButtonFactory.secondary(
        text: 'Abrir',
        onPressed: () {},
      ).viewModel.variant,
      ActionButtonType.secondary,
    );
  });
  testWidgets('botão bloqueia toques desabilitado e carregando', (
    tester,
  ) async {
    var taps = 0;
    await tester.pumpWidget(
      host(
        ActionButtonFactory.primary(
          text: 'Salvar',
          onPressed: () => taps++,
          isEnabled: false,
        ),
      ),
    );
    await tester.tap(find.byType(TextButton));
    expect(taps, 0);
    await tester.pumpWidget(
      host(
        ActionButtonFactory.primary(
          text: 'Salvar',
          onPressed: () => taps++,
          isLoading: true,
        ),
      ),
    );
    await tester.tap(find.byType(TextButton));
    expect(taps, 0);
    await tester.pumpWidget(
      host(
        ActionButtonFactory.primary(text: 'Salvar', onPressed: () => taps++),
      ),
    );
    await tester.tap(find.byType(TextButton));
    expect(taps, 1);
  });
  testWidgets('senha muda visibilidade e preserva o controller', (
    tester,
  ) async {
    final controller = TextEditingController(text: 'Senha#2026');
    await tester.pumpWidget(
      host(PasswordFieldFactory.standard(controller: controller)),
    );
    expect(
      tester.widget<TextField>(find.byType(TextField)).obscureText,
      isTrue,
    );
    await tester.tap(find.byTooltip('Mostrar senha'));
    await tester.pump();
    expect(
      tester.widget<TextField>(find.byType(TextField)).obscureText,
      isFalse,
    );
    expect(controller.text, 'Senha#2026');
    await tester.pumpWidget(const SizedBox());
    controller.dispose();
  });
  testWidgets('meta acima de 100% não altera a contagem e limita a barra', (
    tester,
  ) async {
    await tester.pumpWidget(
      host(GoalCardFactory.standard(completed: 18, goal: 16)),
    );
    expect(find.text('18 de 16 treinos'), findsOneWidget);
    expect(
      tester
          .widget<LinearProgressIndicator>(find.byType(LinearProgressIndicator))
          .value,
      1,
    );
    await tester.pumpWidget(
      host(GoalCardFactory.standard(completed: 0, goal: 0)),
    );
    expect(
      tester
          .widget<LinearProgressIndicator>(find.byType(LinearProgressIndicator))
          .value,
      0,
    );
    expect(tester.takeException(), isNull);
  });
}
