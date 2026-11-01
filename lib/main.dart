import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'common/theme/app_theme.dart';
import 'screens/sample_screen.dart';

void main() => runApp(const TreinaeDesignSystemApp());

class TreinaeDesignSystemApp extends StatefulWidget {
  const TreinaeDesignSystemApp({super.key});
  @override
  State<TreinaeDesignSystemApp> createState() => _TreinaeDesignSystemAppState();
}

class _TreinaeDesignSystemAppState extends State<TreinaeDesignSystemApp> {
  bool _isDark = false;
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Treinaê - Design System',
    debugShowCheckedModeBanner: false,
    theme: AppTheme.light,
    darkTheme: AppTheme.dark,
    themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
    locale: const Locale('pt', 'BR'),
    supportedLocales: const [Locale('pt', 'BR')],
    localizationsDelegates: GlobalMaterialLocalizations.delegates,
    home: SampleScreen(
      isDark: _isDark,
      onToggleTheme: () => setState(() => _isDark = !_isDark),
    ),
  );
}
