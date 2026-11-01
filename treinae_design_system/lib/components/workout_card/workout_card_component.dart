import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import '../../common/theme/app_text_styles.dart';
import 'workout_card_view_model.dart';
import '../cards/card_factory.dart';
import '../action_button/action_button_factory.dart';
import '../action_button/action_button_view_model.dart';

class WorkoutCardComponent extends StatelessWidget {
  final WorkoutCardViewModel viewModel;
  final VoidCallback? onOpen;
  final VoidCallback? onStart;
  final ValueChanged<WorkoutAction>? onAction;
  const WorkoutCardComponent({
    super.key,
    required this.viewModel,
    required this.onOpen,
    required this.onStart,
    this.onAction,
  });
  String get index => viewModel.index;
  String get title => viewModel.title;
  int get exerciseCount => viewModel.exerciseCount;
  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    return CardFactory.standard(
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 38,
                height: 38,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: c.sage,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  index,
                  style: AppTextStyles.heading.copyWith(color: c.primary),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.label),
                    const SizedBox(height: 4),
                    Text(
                      '$exerciseCount ${exerciseCount == 1 ? 'exercício' : 'exercícios'}',
                      style: AppTextStyles.caption.copyWith(color: c.muted),
                    ),
                  ],
                ),
              ),
              if (onAction != null)
                PopupMenuButton<WorkoutAction>(
                  tooltip: 'Opções do treino',
                  onSelected: onAction,
                  itemBuilder: (_) => const [
                    PopupMenuItem(
                      value: WorkoutAction.edit,
                      child: Text('Editar treino'),
                    ),
                    PopupMenuItem(
                      value: WorkoutAction.delete,
                      child: Text('Excluir treino'),
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: ActionButtonFactory.standard(
                  label: 'Abrir ficha',
                  compact: true,
                  variant: ActionButtonType.secondary,
                  onPressed: onOpen,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: ActionButtonFactory.standard(
                  label: 'Iniciar',
                  compact: true,
                  icon: Icons.play_arrow_outlined,
                  onPressed: onStart,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
