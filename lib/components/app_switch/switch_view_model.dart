/// Configuração imutável de apresentação, como no projeto de referência.
class SwitchViewModel {
  final String label;
  final bool value;
  final String? subtitle;
  const SwitchViewModel({
    required this.label,
    required this.value,
    this.subtitle,
  });
}
