import 'package:arfoon_note/configs/assets/app_vectors.dart';
import 'package:arfoon_note/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const HAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      forceMaterialTransparency: true,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppVectors.logo,
            height: 28,
            width: 28,
          ),
          SizedBox(width: 4),
          Text(
            "Arfoon Note",
            style: TextStyle(
              fontSize: 20,
              color: AppColors.primaryTxtColor,
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
