import 'package:flutter/material.dart';
import '../foundations/tokens.dart';
import 'action_button.dart';

enum TreinaeMessageTone { info, success, error }

class TreinaeMessage extends StatelessWidget {
  const TreinaeMessage(
    this.message, {
    super.key,
    this.tone = TreinaeMessageTone.info,
  });
  final String message;
  final TreinaeMessageTone tone;
  @override
  Widget build(BuildContext context) {
    final c = TreinaeColors.of(context);
    final isError = tone == TreinaeMessageTone.error;
    final color = isError ? c.danger : c.primary;
    return Semantics(
      liveRegion: true,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isError ? c.dangerBackground : c.sage,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              isError
                  ? Icons.error_outline
                  : tone == TreinaeMessageTone.success
                  ? Icons.check_circle_outline
                  : Icons.info_outline,
              color: color,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                message,
                style: TreinaeTypography.body.copyWith(color: color),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

abstract final class TreinaeFeedback {
  static void toast(
    BuildContext context,
    String message, {
    bool error = false,
  }) {
    final c = TreinaeColors.of(context);
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
        final c = TreinaeColors.of(dialogContext);
        return AlertDialog(
          backgroundColor: c.surface,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(22),
          ),
          title: Text(title, style: TreinaeTypography.heading),
          content: Text(message),
          actionsOverflowDirection: VerticalDirection.down,
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext, false),
              child: const Text('Cancelar'),
            ),
            TreinaeButton(
              label: confirmLabel,
              fullWidth: false,
              variant: destructive
                  ? TreinaeButtonVariant.danger
                  : TreinaeButtonVariant.primary,
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
    backgroundColor: TreinaeColors.of(context).background,
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
                  color: TreinaeColors.of(sheetContext).border,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Text(title, style: TreinaeTypography.heading),
                  ),
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
