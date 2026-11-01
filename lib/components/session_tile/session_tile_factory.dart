import 'package:flutter/material.dart';
import 'session_tile_component.dart';
import 'session_tile_view_model.dart';

class SessionTileFactory {
  SessionTileFactory._();
  static SessionTileComponent standard({
    required String title,
    required String subtitle,
    VoidCallback? onTap,
  }) => SessionTileComponent(
    viewModel: SessionTileViewModel(title: title, subtitle: subtitle),
    onTap: onTap,
  );
}
