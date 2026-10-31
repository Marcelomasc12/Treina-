import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:treinae_design_system/treinae_design_system.dart';
import 'package:treinae_sample/factories/sample_app_factory.dart';
import 'package:treinae_sample/samples/component_samples.dart';
import 'package:treinae_sample/viewmodels/sample_view_model.dart';

void main() {
  testWidgets('galeria abre, troca tema e valida login demonstrativo', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(SampleAppFactory.create());
    await tester.pumpAndSettle();
    expect(find.text('Treinaê'), findsOneWidget);
    await tester.tap(find.byTooltip('Usar tema escuro'));
    await tester.pumpAndSettle();
    expect(find.byTooltip('Usar tema claro'), findsOneWidget);
    await tester.tap(find.text('Ver telas de exemplo'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Entrar'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Entrar'));
    await tester.pumpAndSettle();
    expect(find.text('Informe um e-mail válido.'), findsOneWidget);
    await tester.enterText(
      find.byType(TextFormField).at(0),
      'teste@exemplo.com',
    );
    await tester.enterText(find.byType(TextFormField).at(1), 'Senha#2026');
    await tester.ensureVisible(find.text('Entrar'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Entrar'));
    await tester.pumpAndSettle();
    expect(find.text('Olá, Marcelo!'), findsOneWidget);
    await tester.tap(find.text('Treinos').last);
    await tester.pumpAndSettle();
    expect(find.text('Meus treinos'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'inexistente');
    await tester.pumpAndSettle();
    expect(find.text('Nenhum treino encontrado'), findsOneWidget);
  });

  for (final dark in [false, true]) {
    for (var section = 0; section < 7; section++) {
      testWidgets(
        'seção $section em 320px no tema ${dark ? 'escuro' : 'claro'} sem overflow',
        (tester) async {
          tester.view.physicalSize = const Size(320, 800);
          tester.view.devicePixelRatio = 1;
          addTearDown(tester.view.resetPhysicalSize);
          addTearDown(tester.view.resetDevicePixelRatio);
          final model = SampleViewModel();
          if (dark) model.toggleTheme();
          await tester.pumpWidget(
            MaterialApp(
              theme: dark ? TreinaeTheme.dark : TreinaeTheme.light,
              home: ComponentSamples(section: section, model: model),
            ),
          );
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull);
          // Percorre também os componentes inicialmente fora da tela.
          for (var i = 0; i < 6; i++) {
            await tester.drag(
              find.byType(ListView).first,
              const Offset(0, -450),
            );
            await tester.pumpAndSettle();
            expect(tester.takeException(), isNull);
          }
          await tester.pumpWidget(const SizedBox());
          model.dispose();
        },
      );
    }
  }
}
