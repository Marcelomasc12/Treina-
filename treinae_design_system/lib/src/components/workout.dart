import 'package:flutter/material.dart';
import '../foundations/tokens.dart';
import 'action_button.dart';
import 'surfaces.dart';

enum TreinaeWorkoutAction { edit, delete }

class TreinaeWorkoutCard extends StatelessWidget {
  const TreinaeWorkoutCard({
    super.key,
    required this.index,
    required this.title,
    required this.exerciseCount,
    required this.onOpen,
    required this.onStart,
    this.onAction,
  });
  final String index, title;
  final int exerciseCount;
  final VoidCallback? onOpen, onStart;
  final ValueChanged<TreinaeWorkoutAction>? onAction;
  @override
  Widget build(BuildContext context) {
    final c = TreinaeColors.of(context);
    return TreinaeCard(
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
                  style: TreinaeTypography.heading.copyWith(color: c.primary),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TreinaeTypography.label),
                    const SizedBox(height: 4),
                    Text(
                      '$exerciseCount ${exerciseCount == 1 ? 'exercício' : 'exercícios'}',
                      style: TreinaeTypography.caption.copyWith(color: c.muted),
                    ),
                  ],
                ),
              ),
              if (onAction != null)
                PopupMenuButton<TreinaeWorkoutAction>(
                  tooltip: 'Opções do treino',
                  onSelected: onAction,
                  itemBuilder: (_) => const [
                    PopupMenuItem(
                      value: TreinaeWorkoutAction.edit,
                      child: Text('Editar treino'),
                    ),
                    PopupMenuItem(
                      value: TreinaeWorkoutAction.delete,
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
                child: TreinaeButton(
                  label: 'Abrir ficha',
                  compact: true,
                  variant: TreinaeButtonVariant.secondary,
                  onPressed: onOpen,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: TreinaeButton(
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

class TreinaeSessionTile extends StatelessWidget {
  const TreinaeSessionTile({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap,
  });
  final String title, subtitle;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) => TreinaeCard(
    onTap: onTap,
    child: Row(
      children: [
        const Icon(Icons.history),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TreinaeTypography.label),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TreinaeTypography.caption.copyWith(
                  color: TreinaeColors.of(context).muted,
                ),
              ),
            ],
          ),
        ),
        if (onTap != null) const Icon(Icons.chevron_right),
      ],
    ),
  );
}

/// Apresentação controlada de uma série; validação de domínio pertence ao app.
class TreinaeSetRow extends StatelessWidget {
  const TreinaeSetRow({
    super.key,
    required this.number,
    required this.completed,
    required this.weightController,
    required this.repsController,
    required this.onCompleted,
    this.enabled = true,
  });
  final int number;
  final bool completed, enabled;
  final TextEditingController weightController, repsController;
  final ValueChanged<bool> onCompleted;
  @override
  Widget build(BuildContext context) {
    final c = TreinaeColors.of(context);
    Widget input(
      TextEditingController controller,
      String label,
      bool decimal,
    ) => TextField(
      controller: controller,
      enabled: enabled,
      keyboardType: TextInputType.numberWithOptions(decimal: decimal),
      textAlign: TextAlign.center,
      style: TreinaeTypography.body,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: completed ? c.sage : c.background,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          SizedBox(
            width: 32,
            child: Text('$number', style: TreinaeTypography.label),
          ),
          Expanded(child: input(weightController, 'Carga (kg)', true)),
          const SizedBox(width: 8),
          Expanded(child: input(repsController, 'Repetições', false)),
          SizedBox(
            width: 48,
            child: Semantics(
              label: 'Concluir série $number',
              child: Checkbox(
                value: completed,
                onChanged: enabled ? (v) => onCompleted(v ?? false) : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
