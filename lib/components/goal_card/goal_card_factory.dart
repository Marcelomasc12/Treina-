import 'goal_card_component.dart';
import 'goal_card_view_model.dart';

class GoalCardFactory {
  GoalCardFactory._();
  static GoalCardComponent standard({
    required int completed,
    required int goal,
  }) => GoalCardComponent(
    viewModel: GoalCardViewModel(completed: completed, goal: goal),
  );
}
