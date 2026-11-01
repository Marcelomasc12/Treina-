import 'package:flutter/material.dart';

/// Configuração imutável de apresentação, como no projeto de referência.
class CardViewModel {
  final EdgeInsetsGeometry padding;
  final bool highlighted;
  const CardViewModel({
    this.padding = const EdgeInsets.all(16),
    this.highlighted = false,
  });
}
