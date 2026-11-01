enum BadgeTone { neutral, success, danger }

/// Configuração imutável de apresentação, como no projeto de referência.
class BadgeViewModel {
  final String label;
  final BadgeTone tone;
  const BadgeViewModel({required this.label, this.tone = BadgeTone.neutral});
}
