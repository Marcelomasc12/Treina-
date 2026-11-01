import 'package:flutter/material.dart';
import '../../common/theme/app_colors.dart';
import 'avatar_view_model.dart';

class AvatarComponent extends StatelessWidget {
  final AvatarViewModel viewModel;
  final VoidCallback? onTap;
  const AvatarComponent({super.key, required this.viewModel, this.onTap});
  String get name => viewModel.name;
  ImageProvider? get image => viewModel.image;
  bool get large => viewModel.large;
  @override
  Widget build(BuildContext context) {
    final c = AppColors.of(context);
    final words = name.trim().split(RegExp(r'\s+')).where((s) => s.isNotEmpty);
    final initials = words
        .take(2)
        .map((s) => String.fromCharCode(s.runes.first))
        .join()
        .toUpperCase();
    final size = large ? 92.0 : 48.0;
    final fallback = Center(
      child: Text(
        initials.isEmpty ? '?' : initials,
        style: TextStyle(
          color: c.onPrimary,
          fontSize: large ? 24 : 14,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
    return Semantics(
      label: onTap == null ? 'Avatar de $name' : 'Abrir perfil de $name',
      button: onTap != null,
      child: Tooltip(
        message: name.isEmpty ? 'Perfil' : name,
        child: Material(
          color: c.primary,
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: SizedBox(
              width: size,
              height: size,
              child: image == null
                  ? fallback
                  : Image(
                      image: image!,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => fallback,
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
