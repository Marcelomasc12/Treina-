enum FeedbackTone { info, success, error }

/// Configuração imutável de apresentação, como no projeto de referência.
class FeedbackViewModel {
  final String message;
  final FeedbackTone tone;
  const FeedbackViewModel({
    required this.message,
    this.tone = FeedbackTone.info,
  });
}
