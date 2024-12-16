import 'package:arfoon_note/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class EAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const EAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      title: const Text(
        "Examples",
        style: TextStyle(
          fontSize: 32,
          color: Colors.white,
        ),
      ),
      centerTitle: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
