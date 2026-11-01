import 'package:flutter/material.dart';

/// Configuração imutável de apresentação, como no projeto de referência.
class AvatarViewModel {
  final String name;
  final ImageProvider? image;
  final bool large;
  const AvatarViewModel({required this.name, this.image, this.large = false});
}
