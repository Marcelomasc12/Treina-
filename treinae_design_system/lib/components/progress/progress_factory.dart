import 'progress_component.dart';
import 'progress_view_model.dart';

class ProgressFactory {
  ProgressFactory._();
  static ProgressComponent standard({required double value, String? label}) =>
      ProgressComponent(
        viewModel: ProgressViewModel(value: value, label: label),
      );
}
