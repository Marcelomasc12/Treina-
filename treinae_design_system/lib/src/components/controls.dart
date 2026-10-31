import 'package:flutter/material.dart';
import '../foundations/tokens.dart';
import 'surfaces.dart';

class TreinaeProgress extends StatelessWidget {
  const TreinaeProgress({super.key, required this.value, this.label});

  /// Fração entre 0 e 1. Valores fora do intervalo são limitados visualmente.
  final double value;
  final String? label;
  @override
  Widget build(BuildContext context) {
    final safe = value.isFinite ? value.clamp(0.0, 1.0).toDouble() : 0.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: LinearProgressIndicator(
            value: safe,
            minHeight: 7,
            semanticsLabel: label ?? 'Progresso',
            semanticsValue: '${(safe * 100).round()}%',
          ),
        ),
        if (label != null) ...[
          const SizedBox(height: 8),
          Text(
            label!,
            style: TreinaeTypography.caption.copyWith(
              color: TreinaeColors.of(context).muted,
            ),
          ),
        ],
      ],
    );
  }
}

class TreinaeGoalCard extends StatelessWidget {
  const TreinaeGoalCard({
    super.key,
    required this.completed,
    required this.goal,
  });
  final int completed, goal;
  @override
  Widget build(BuildContext context) {
    final ratio = goal > 0 ? completed / goal : 0.0;
    final percent = (ratio * 100).round();
    final c = TreinaeColors.of(context);
    return TreinaeCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Meta mensal',
                  style: TreinaeTypography.caption.copyWith(color: c.muted),
                ),
              ),
              Text(
                '$percent%',
                style: TreinaeTypography.label.copyWith(color: c.primary),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text('$completed de $goal treinos', style: TreinaeTypography.label),
          const SizedBox(height: 12),
          TreinaeProgress(value: ratio, label: '$percent% da meta'),
        ],
      ),
    );
  }
}

class TreinaeCheckbox extends StatelessWidget {
  const TreinaeCheckbox({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });
  final String label;
  final bool value;
  final ValueChanged<bool>? onChanged;
  @override
  Widget build(BuildContext context) => CheckboxListTile(
    contentPadding: EdgeInsets.zero,
    controlAffinity: ListTileControlAffinity.leading,
    title: Text(label, style: TreinaeTypography.body),
    value: value,
    onChanged: onChanged == null ? null : (v) => onChanged!(v ?? false),
  );
}

class TreinaeSwitch extends StatelessWidget {
  const TreinaeSwitch({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.subtitle,
  });
  final String label;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool>? onChanged;
  @override
  Widget build(BuildContext context) => SwitchListTile(
    contentPadding: EdgeInsets.zero,
    title: Text(label, style: TreinaeTypography.label),
    subtitle: subtitle == null
        ? null
        : Text(subtitle!, style: TreinaeTypography.caption),
    value: value,
    onChanged: onChanged,
  );
}

class TreinaeSlider extends StatelessWidget {
  const TreinaeSlider({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.min = 0,
    this.max = 120,
    this.divisions = 12,
  });
  final String label;
  final double value, min, max;
  final int? divisions;
  final ValueChanged<double>? onChanged;
  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('$label: ${value.round()}', style: TreinaeTypography.label),
      Slider(
        value: value.clamp(min, max).toDouble(),
        min: min,
        max: max,
        divisions: divisions,
        label: '${value.round()}',
        onChanged: onChanged,
        semanticFormatterCallback: (v) => '$label: ${v.round()}',
      ),
    ],
  );
}
