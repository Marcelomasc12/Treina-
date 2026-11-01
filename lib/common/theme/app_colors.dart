import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  const AppColors({
    required this.background,
    required this.surface,
    required this.sage,
    required this.primary,
    required this.onPrimary,
    required this.text,
    required this.muted,
    required this.border,
    required this.danger,
    required this.dangerBackground,
  });

  final Color background, surface, sage, primary, onPrimary;
  final Color text, muted, border, danger, dangerBackground;

  static const light = AppColors(
    background: Color(0xFFF7F8F5),
    surface: Color(0xFFFFFFFF),
    sage: Color(0xFFE4EBE5),
    primary: Color(0xFF28584A),
    onPrimary: Color(0xFFFFFFFF),
    text: Color(0xFF202723),
    muted: Color(0xFF646B67),
    border: Color(0xFFDFE3DF),
    danger: Color(0xFFA84848),
    dangerBackground: Color(0xFFF8E9E8),
  );

  static const dark = AppColors(
    background: Color(0xFF151A17),
    surface: Color(0xFF1D2420),
    sage: Color(0xFF25342D),
    primary: Color(0xFF7FB29D),
    onPrimary: Color(0xFF10221B),
    text: Color(0xFFF1F5F2),
    muted: Color(0xFFAAB3AE),
    border: Color(0xFF34413A),
    danger: Color(0xFFEC9995),
    dangerBackground: Color(0xFF3C2525),
  );

  static AppColors of(BuildContext context) =>
      Theme.of(context).extension<AppColors>() ??
      (Theme.of(context).brightness == Brightness.dark ? dark : light);

  @override
  AppColors copyWith({
    Color? background,
    Color? surface,
    Color? sage,
    Color? primary,
    Color? onPrimary,
    Color? text,
    Color? muted,
    Color? border,
    Color? danger,
    Color? dangerBackground,
  }) => AppColors(
    background: background ?? this.background,
    surface: surface ?? this.surface,
    sage: sage ?? this.sage,
    primary: primary ?? this.primary,
    onPrimary: onPrimary ?? this.onPrimary,
    text: text ?? this.text,
    muted: muted ?? this.muted,
    border: border ?? this.border,
    danger: danger ?? this.danger,
    dangerBackground: dangerBackground ?? this.dangerBackground,
  );

  @override
  AppColors lerp(covariant AppColors? other, double t) {
    if (other == null) return this;
    return AppColors(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      sage: Color.lerp(sage, other.sage, t)!,
      primary: Color.lerp(primary, other.primary, t)!,
      onPrimary: Color.lerp(onPrimary, other.onPrimary, t)!,
      text: Color.lerp(text, other.text, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
      border: Color.lerp(border, other.border, t)!,
      danger: Color.lerp(danger, other.danger, t)!,
      dangerBackground: Color.lerp(
        dangerBackground,
        other.dangerBackground,
        t,
      )!,
    );
  }
}
