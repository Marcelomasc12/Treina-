import 'package:flutter/material.dart';
import 'card_component.dart';
import 'card_view_model.dart';

class CardFactory {
  CardFactory._();
  static CardComponent standard({
    EdgeInsetsGeometry padding = const EdgeInsets.all(16),
    bool highlighted = false,
    required Widget child,
    VoidCallback? onTap,
  }) => CardComponent(
    viewModel: CardViewModel(padding: padding, highlighted: highlighted),
    child: child,
    onTap: onTap,
  );
}
