enum WorkoutAction { edit, delete }

/// Configuração imutável de apresentação, como no projeto de referência.
class WorkoutCardViewModel {
  final String index;
  final String title;
  final int exerciseCount;
  const WorkoutCardViewModel({
    required this.index,
    required this.title,
    required this.exerciseCount,
  });
}
