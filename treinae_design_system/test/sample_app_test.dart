import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:treinae_design_system/main.dart';
import 'package:treinae_design_system/screens/sample_screen.dart';
import 'package:treinae_design_system/treinae_design_system.dart';

void main() {
  testWidgets('main da raiz abre catálogo, troca tema e navega pelos samples', (
    tester,
  ) async {
    await tester.pumpWidget(const TreinaeDesignSystemApp());
    await tester.pumpAndSettle();
    expect(find.text('Catálogo de componentes'), findsOneWidget);
    await tester.tap(find.byTooltip('Usar tema escuro'));
    await tester.pumpAndSettle();
    expect(find.byTooltip('Usar tema claro'), findsOneWidget);
    await tester.ensureVisible(find.text('Botões de ação'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Botões de ação'));
    await tester.pumpAndSettle();
    expect(find.text('Variantes'), findsOneWidget);
    await tester.tap(find.byTooltip('Voltar'));
    await tester.pumpAndSettle();
    expect(find.byType(SampleScreen), findsOneWidget);
    expect(find.text('Botões de ação'), findsOneWidget);
  });
  for (final dark in [false, true]) {
    for (final item in SampleScreen.components) {
      testWidgets(
        '${item.title} em 320px no tema ${dark ? 'escuro' : 'claro'}',
        (tester) async {
          tester.view.physicalSize = const Size(320, 800);
          tester.view.devicePixelRatio = 1;
          addTearDown(tester.view.resetPhysicalSize);
          addTearDown(tester.view.resetDevicePixelRatio);
          await tester.pumpWidget(
            MaterialApp(
              theme: dark ? AppTheme.dark : AppTheme.light,
              home: item.screen,
            ),
          );
          await tester.pumpAndSettle();
          expect(tester.takeException(), isNull);
          for (var i = 0; i < 5; i++) {
            await tester.drag(
              find.byType(ListView).first,
              const Offset(0, -350),
            );
            await tester.pumpAndSettle();
            expect(tester.takeException(), isNull);
          }
        },
      );
    }
  }
}
