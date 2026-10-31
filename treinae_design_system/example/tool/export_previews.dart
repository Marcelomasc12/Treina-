import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:treinae_design_system/treinae_design_system.dart';
import 'package:treinae_sample/factories/sample_app_factory.dart';

void main() {
  testWidgets('capturas de revisão visual', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final loader = FontLoader(TreinaeTypography.family);
    for (final weight in [
      'Regular',
      'Medium',
      'SemiBold',
      'Bold',
      'ExtraBold',
    ]) {
      final bytes = File(
        '../assets/fonts/Manrope-$weight.ttf',
      ).readAsBytesSync();
      loader.addFont(Future.value(ByteData.sublistView(bytes)));
    }
    await loader.load();
    final icons = FontLoader('MaterialIcons')
      ..addFont(rootBundle.load('fonts/MaterialIcons-Regular.otf'));
    await icons.load();
    final key = GlobalKey();
    Future<void> capture(String name) async {
      await tester.pumpAndSettle();
      final boundary =
          key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
      await tester.runAsync(() async {
        final image = await boundary.toImage(pixelRatio: 2);
        final data = await image.toByteData(format: ui.ImageByteFormat.png);
        final file = File('../docs/previas/$name.png');
        file.parent.createSync(recursive: true);
        file.writeAsBytesSync(data!.buffer.asUint8List());
        image.dispose();
      });
    }

    await tester.pumpWidget(
      RepaintBoundary(key: key, child: SampleAppFactory.create()),
    );
    await capture('galeria-clara');
    await tester.ensureVisible(find.text('Botões'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Botões'));
    await capture('botoes');
    await tester.tap(find.byTooltip('Voltar'));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Ver telas de exemplo'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Ver telas de exemplo'));
    await capture('login');
    await tester.enterText(
      find.byType(TextFormField).at(0),
      'teste@exemplo.com',
    );
    await tester.enterText(find.byType(TextFormField).at(1), 'Senha#2026');
    await tester.ensureVisible(find.text('Entrar'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Entrar'));
    await capture('inicio-claro');
    await tester.tap(find.byTooltip('Alternar tema'));
    await capture('inicio-escuro');
    expect(tester.takeException(), isNull);
  });
}
