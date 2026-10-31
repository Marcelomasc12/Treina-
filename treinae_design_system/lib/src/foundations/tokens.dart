import 'package:flutter/material.dart';

/// Escala compartilhada, extraída e organizada a partir do protótipo.
abstract final class TreinaeSpacing {
  static const double xs = 4;
  static const double sm = 8;
  static const double md = 12;
  static const double lg = 16;
  static const double xl = 20;
  static const double xxl = 24;
  static const double section = 32;
}

abstract final class TreinaeRadius {
  static const double small = 10;
  static const double field = 14;
  static const double card = 18;
  static const double dialog = 22;
}

abstract final class TreinaeTypography {
  // Fonte empacotada: sem download de fonte durante a execução.
  static const String family = 'packages/treinae_design_system/Manrope';
  static const title = TextStyle(
    fontSize: 27,
    height: 1.2,
    fontWeight: FontWeight.w800,
    letterSpacing: -0.8,
  );
  static const heading = TextStyle(
    fontSize: 18,
    height: 1.35,
    fontWeight: FontWeight.w800,
  );
  static const body = TextStyle(fontSize: 14, height: 1.5);
  static const label = TextStyle(
    fontSize: 13,
    height: 1.4,
    fontWeight: FontWeight.w700,
  );
  // 12px mínimo para conteúdo auxiliar; ampliado em relação a legendas do web.
  static const caption = TextStyle(fontSize: 12, height: 1.45);
}

@immutable
class TreinaeColors extends ThemeExtension<TreinaeColors> {
  const TreinaeColors({
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

  static const light = TreinaeColors(
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

  static const dark = TreinaeColors(
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

  static TreinaeColors of(BuildContext context) =>
      Theme.of(context).extension<TreinaeColors>() ??
      (Theme.of(context).brightness == Brightness.dark ? dark : light);

  @override
  TreinaeColors copyWith({
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
  }) => TreinaeColors(
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
  TreinaeColors lerp(covariant TreinaeColors? other, double t) {
    if (other == null) return this;
    return TreinaeColors(
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
