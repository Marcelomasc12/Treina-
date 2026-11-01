/// Configuração imutável de apresentação, como no projeto de referência.
class SliderViewModel {
  final String label;
  final double value;
  final double min;
  final double max;
  final int? divisions;
  const SliderViewModel({
    required this.label,
    required this.value,
    this.min = 0,
    this.max = 120,
    this.divisions = 12,
  });
}
