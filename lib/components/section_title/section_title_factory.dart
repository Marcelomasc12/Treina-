import 'package:flutter/material.dart';
import 'section_title_component.dart';
import 'section_title_view_model.dart';

class SectionTitleFactory {
  SectionTitleFactory._();
  static SectionTitleComponent standard({
    required String title,
    String? actionLabel,
    VoidCallback? onAction,
  }) => SectionTitleComponent(
    viewModel: SectionTitleViewModel(title: title, actionLabel: actionLabel),
    onAction: onAction,
  );
}
