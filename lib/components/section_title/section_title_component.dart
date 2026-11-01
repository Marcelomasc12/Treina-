import 'package:flutter/material.dart';
import '../../common/theme/app_text_styles.dart';
import 'section_title_view_model.dart';

class SectionTitleComponent extends StatelessWidget {
  final SectionTitleViewModel viewModel;
  final VoidCallback? onAction;
  const SectionTitleComponent({
    super.key,
    required this.viewModel,
    this.onAction,
  });
  String get title => viewModel.title;
  String? get actionLabel => viewModel.actionLabel;
  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(child: Text(title, style: AppTextStyles.heading)),
      if (actionLabel != null)
        TextButton(onPressed: onAction, child: Text(actionLabel!)),
    ],
  );
}
