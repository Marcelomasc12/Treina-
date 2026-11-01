import 'package:flutter/material.dart';
import 'feedback_component.dart';
import 'feedback_view_model.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_text_styles.dart';
import '../action_button/action_button_factory.dart';
import '../action_button/action_button_view_model.dart';

class FeedbackFactory {
  FeedbackFactory._();
  static FeedbackComponent standard({
    required String message,
    FeedbackTone tone = FeedbackTone.info,
  }) => FeedbackComponent(
    viewModel: FeedbackViewModel(message: message, tone: tone),
  );

  static void toast(
    BuildContext context,
    String message, {
    bool error = false,
  }) {
    final c = AppColors.of(context);
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            message,
            style: TextStyle(
              color: error
                  ? (Theme.of(context).brightness == Brightness.dark
                        ? const Color(0xFF301010)
                        : Colors.white)
                  : c.onPrimary,
            ),
          ),
          behavior: SnackBarBehavior.floating,
          backgroundColor: error ? c.danger : c.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      );
  }

  static Future<bool> confirm(
    BuildContext context, {
    required String title,
    required String message,
    String confirmLabel = 'Confirmar',
    bool destructive = false,
  }) async {
    final answer = await showDialog<bool>(
      context: context,
      builder: (dialogContext) {
        final c = AppColors.of(dialogContext);
        return AlertDialog(
          backgroundColor: c.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          title: Text(title, style: AppTextStyles.heading),
          content: Text(message),
          actionsOverflowDirection: VerticalDirection.down,
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('Cancelar'),
            ),
            ActionButtonFactory.standard(
              label: confirmLabel,
              fullWidth: false,
              variant: destructive
                  ? ActionButtonType.danger
                  : ActionButtonType.primary,
              onPressed: () => Navigator.pop(dialogContext, true),
            ),
          ],
        );
      },
    );
    return answer ?? false;
  }

  static Future<T?> sheet<T>(
    BuildContext context, {
    required String title,
    required Widget child,
  }) => showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    backgroundColor: AppColors.of(context).background,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (sheetContext) => Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.viewInsetsOf(sheetContext).bottom,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 38,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.of(sheetContext).border,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(child: Text(title, style: AppTextStyles.heading)),
                  IconButton(
                    tooltip: 'Fechar',
                    onPressed: () => Navigator.pop(sheetContext),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              child,
            ],
          ),
        ),
      ),
    ),
  );
}
