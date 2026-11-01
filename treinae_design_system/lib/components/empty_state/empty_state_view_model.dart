import 'package:flutter/material.dart';

/// Configuração imutável de apresentação, como no projeto de referência.
class EmptyStateViewModel {
  final String title;
  final String message;
  final IconData icon;
  const EmptyStateViewModel({
    required this.title,
    required this.message,
    this.icon = Icons.fitness_center,
  });
}
