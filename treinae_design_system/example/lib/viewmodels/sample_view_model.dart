import 'package:flutter/material.dart';

/// Estado de demonstração. Não autentica usuários nem chama a API.
class SampleViewModel extends ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
  ThemeMode get themeMode => _themeMode;
  bool get isDark => _themeMode == ThemeMode.dark;
  void toggleTheme() {
    _themeMode = isDark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  bool checked = false;
  bool notifications = true;
  double restSeconds = 60;
  String muscleGroup = 'Peito';
  int tab = 0;
  bool busy = false;
  bool _disposed = false;
  void setChecked(bool value) {
    checked = value;
    notifyListeners();
  }

  void setNotifications(bool value) {
    notifications = value;
    notifyListeners();
  }

  void setRest(double value) {
    restSeconds = value;
    notifyListeners();
  }

  void setMuscleGroup(String? value) {
    if (value == null) return;
    muscleGroup = value;
    notifyListeners();
  }

  void setTab(int value) {
    tab = value;
    notifyListeners();
  }

  Future<void> simulateLoading() async {
    if (busy) return;
    busy = true;
    notifyListeners();
    await Future<void>.delayed(const Duration(milliseconds: 1200));
    if (_disposed) return;
    busy = false;
    notifyListeners();
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }
}
