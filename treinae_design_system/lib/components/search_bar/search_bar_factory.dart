import 'package:flutter/material.dart';
import 'search_bar_component.dart';
import 'search_bar_view_model.dart';

class SearchBarFactory {
  SearchBarFactory._();
  static SearchBarComponent standard({
    String hint = 'Buscar treino',
    TextEditingController? controller,
    ValueChanged<String>? onChanged,
  }) => SearchBarComponent(
    viewModel: SearchBarViewModel(hint: hint),
    controller: controller,
    onChanged: onChanged,
  );
}
