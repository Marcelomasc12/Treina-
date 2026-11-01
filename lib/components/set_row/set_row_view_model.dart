/// Configuração imutável de apresentação, como no projeto de referência.
class SetRowViewModel {
  final int number;
  final bool completed;
  final bool enabled;
  const SetRowViewModel({
    required this.number,
    required this.completed,
    this.enabled = true,
  });
}
