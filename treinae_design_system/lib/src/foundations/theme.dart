import 'package:flutter/material.dart';
import 'tokens.dart';

abstract final class TreinaeTheme {
  static ThemeData get light => _build(Brightness.light, TreinaeColors.light);
  static ThemeData get dark => _build(Brightness.dark, TreinaeColors.dark);

  static ThemeData _build(Brightness brightness, TreinaeColors c) {
    final scheme =
        ColorScheme.fromSeed(
          seedColor: c.primary,
          brightness: brightness,
        ).copyWith(
          primary: c.primary,
          onPrimary: c.onPrimary,
          surface: c.surface,
          onSurface: c.text,
          error: c.danger,
          onError: brightness == Brightness.dark
              ? const Color(0xFF301010)
              : Colors.white,
        );
    final base = ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      fontFamily: TreinaeTypography.family,
      scaffoldBackgroundColor: c.background,
      extensions: <ThemeExtension<dynamic>>[c],
    );
    return base.copyWith(
      textTheme: base.textTheme.copyWith(
        headlineMedium: TreinaeTypography.title.copyWith(
          color: c.text,
          fontFamily: TreinaeTypography.family,
        ),
        titleLarge: TreinaeTypography.heading.copyWith(
          color: c.text,
          fontFamily: TreinaeTypography.family,
        ),
        bodyMedium: TreinaeTypography.body.copyWith(
          color: c.text,
          fontFamily: TreinaeTypography.family,
        ),
        labelLarge: TreinaeTypography.label.copyWith(
          color: c.text,
          fontFamily: TreinaeTypography.family,
        ),
      ),
      dividerColor: c.border,
      iconTheme: IconThemeData(color: c.primary, size: 22),
      appBarTheme: AppBarTheme(
        backgroundColor: c.background,
        foregroundColor: c.text,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: TreinaeTypography.label.copyWith(
          color: c.text,
          fontFamily: TreinaeTypography.family,
          fontSize: 16,
        ),
      ),
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: c.primary,
        linearTrackColor: c.sage,
      ),
      checkboxTheme: CheckboxThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        fillColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? c.primary : null,
        ),
        checkColor: WidgetStatePropertyAll(c.onPrimary),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? c.onPrimary : c.muted,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (s) => s.contains(WidgetState.selected) ? c.primary : c.sage,
        ),
      ),
      sliderTheme: base.sliderTheme.copyWith(
        activeTrackColor: c.primary,
        thumbColor: c.primary,
        inactiveTrackColor: c.sage,
      ),
      tooltipTheme: const TooltipThemeData(
        waitDuration: Duration(milliseconds: 400),
      ),
    );
  }
}
