import 'badge_component.dart';
import 'badge_view_model.dart';

class BadgeFactory {
  BadgeFactory._();
  static BadgeComponent standard({
    required String label,
    BadgeTone tone = BadgeTone.neutral,
  }) => BadgeComponent(
    viewModel: BadgeViewModel(label: label, tone: tone),
  );
}
