import 'package:flutter/material.dart';
import 'avatar_component.dart';
import 'avatar_view_model.dart';

class AvatarFactory {
  AvatarFactory._();
  static AvatarComponent standard({
    required String name,
    ImageProvider? image,
    bool large = false,
    VoidCallback? onTap,
  }) => AvatarComponent(
    viewModel: AvatarViewModel(name: name, image: image, large: large),
    onTap: onTap,
  );
}
