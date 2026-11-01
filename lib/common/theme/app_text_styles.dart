import 'package:flutter/material.dart';

abstract final class AppTextStyles {
  // Fonte empacotada: sem download de fonte durante a execução.
  static const String family = 'Manrope';
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
