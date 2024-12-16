import 'package:flutter/material.dart';
import 'package:arfoon_note/configs/assets/app_vectors.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' show pi;

class AAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        Transform.rotate(
          angle: 0.5 * pi,
          child: SvgPicture.asset(
            AppVectors.dots,
            height: 24,
            width: 24,
            colorFilter: const ColorFilter.mode(
              Color(0xFF73737E),
              BlendMode.srcIn,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
