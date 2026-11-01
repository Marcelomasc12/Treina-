import 'dart:io';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'projeto executa pela raiz e cada componente tem seu trio de arquivos',
    () {
      expect(File('lib/main.dart').existsSync(), isTrue);
      expect(Directory('example').existsSync(), isFalse);
      expect(Directory('lib/screens').existsSync(), isTrue);
      final folders = Directory(
        'lib/components',
      ).listSync().whereType<Directory>();
      expect(folders.length, 22);
      for (final folder in folders) {
        final files = folder.listSync().whereType<File>().toList();
        expect(
          files.where((f) => f.path.endsWith('_component.dart')).length,
          1,
        );
        expect(files.where((f) => f.path.endsWith('_factory.dart')).length, 1);
        expect(
          files.where((f) => f.path.endsWith('_view_model.dart')).length,
          1,
        );
        final component = files
            .firstWhere((f) => f.path.endsWith('_component.dart'))
            .readAsStringSync();
        final factory = files
            .firstWhere((f) => f.path.endsWith('_factory.dart'))
            .readAsStringSync();
        final model = files
            .firstWhere((f) => f.path.endsWith('_view_model.dart'))
            .readAsStringSync();
        expect(
          component.contains('required this.viewModel'),
          isTrue,
          reason: folder.path,
        );
        expect(
          factory.contains('ViewModel(') || factory.contains('ViewModel<T>('),
          isTrue,
          reason: folder.path,
        );
        expect(model.contains('ChangeNotifier'), isFalse, reason: folder.path);
        expect(
          model.contains('TextEditingController'),
          isFalse,
          reason: folder.path,
        );
        expect(model.contains('VoidCallback'), isFalse, reason: folder.path);
      }
      for (final file
          in Directory('lib')
              .listSync(recursive: true)
              .whereType<File>()
              .where((f) => f.path.endsWith('.dart'))) {
        expect(
          file.readAsStringSync().contains('example/'),
          isFalse,
          reason: file.path,
        );
      }
    },
  );
}
