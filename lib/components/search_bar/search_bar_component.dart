import 'package:flutter/material.dart';
import 'search_bar_view_model.dart';
import '../../common/theme/input_decoration.dart';

class SearchBarComponent extends StatelessWidget {
  final SearchBarViewModel viewModel;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  const SearchBarComponent({
    super.key,
    required this.viewModel,
    this.controller,
    this.onChanged,
  });
  String get hint => viewModel.hint;
  @override
  Widget build(BuildContext context) => Semantics(
    label: hint,
    child: TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: buildFieldDecoration(context, hint: hint, icon: Icons.search),
    ),
  );
}
