import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:treinae_design_system/treinae_design_system.dart';

Widget host(Widget child, {bool dark = false}) => MaterialApp(
  theme: dark ? TreinaeTheme.dark : TreinaeTheme.light,
  home: Scaffold(
    body: Padding(padding: const EdgeInsets.all(20), child: child),
  ),
);

void main() {
  testWidgets('botão impede ação desabilitado e durante carregamento', (
    tester,
  ) async {
    var taps = 0;
    await tester.pumpWidget(
      host(
        TreinaeButton(label: 'Salvar', onPressed: () => taps++, loading: true),
      ),
    );
    await tester.tap(find.byType(TextButton));
    expect(taps, 0);
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
    await tester.pumpWidget(
      host(const TreinaeButton(label: 'Salvar', onPressed: null)),
    );
    await tester.tap(find.byType(TextButton));
    expect(taps, 0);
    await tester.pumpWidget(
      host(TreinaeButton(label: 'Salvar', onPressed: () => taps++)),
    );
    await tester.tap(find.byType(TextButton));
    expect(taps, 1);
  });

  testWidgets('campo de senha alterna visibilidade sem perder o texto', (
    tester,
  ) async {
    final controller = TextEditingController(text: 'Senha#2026');
    await tester.pumpWidget(host(TreinaePasswordField(controller: controller)));
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

  testWidgets('meta acima de 100% mantém contagem e limita barra', (
    tester,
  ) async {
    await tester.pumpWidget(
      host(const TreinaeGoalCard(completed: 18, goal: 16)),
    );
    expect(find.text('18 de 16 treinos'), findsOneWidget);
    expect(
      tester
          .widget<LinearProgressIndicator>(find.byType(LinearProgressIndicator))
          .value,
      1,
    );
    await tester.pumpWidget(host(const TreinaeGoalCard(completed: 0, goal: 0)));
    expect(
      tester
          .widget<LinearProgressIndicator>(find.byType(LinearProgressIndicator))
          .value,
      0,
    );
    expect(tester.takeException(), isNull);
  });

  testWidgets('select devolve a nova opção', (tester) async {
    String? value = 'Peito';
    await tester.pumpWidget(
      host(
        StatefulBuilder(
          builder: (_, update) => TreinaeSelect<String>(
            label: 'Grupo',
            value: value,
            items: const [
              DropdownMenuItem(value: 'Peito', child: Text('Peito')),
              DropdownMenuItem(value: 'Costas', child: Text('Costas')),
            ],
            onChanged: (v) => update(() => value = v),
          ),
        ),
      ),
    );
    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Costas').last);
    await tester.pumpAndSettle();
    expect(value, 'Costas');
  });

  testWidgets('confirmação devolve false ao cancelar e true ao confirmar', (
    tester,
  ) async {
    bool? answer;
    await tester.pumpWidget(
      host(
        Builder(
          builder: (context) => TreinaeButton(
            label: 'Abrir',
            onPressed: () async {
              answer = await TreinaeFeedback.confirm(
                context,
                title: 'Excluir?',
                message: 'Confirma?',
                confirmLabel: 'Excluir',
              );
            },
          ),
        ),
      ),
    );
    await tester.tap(find.text('Abrir'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Cancelar'));
    await tester.pumpAndSettle();
    expect(answer, isFalse);
    await tester.tap(find.text('Abrir'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Excluir'));
    await tester.pumpAndSettle();
    expect(answer, isTrue);
  });

  test('cores de texto e botões têm contraste adequado nos dois temas', () {
    double contrast(Color a, Color b) {
      final x = a.computeLuminance(), y = b.computeLuminance();
      return ((x > y ? x : y) + .05) / ((x < y ? x : y) + .05);
    }

    for (final c in [TreinaeColors.light, TreinaeColors.dark]) {
      expect(contrast(c.text, c.background), greaterThanOrEqualTo(4.5));
      expect(contrast(c.muted, c.surface), greaterThanOrEqualTo(4.5));
      expect(contrast(c.primary, c.onPrimary), greaterThanOrEqualTo(4.5));
      expect(contrast(c.danger, c.dangerBackground), greaterThanOrEqualTo(4.5));
    }
  });
}
