import 'package:arfoon_note/configs/assets/app_vectors.dart';
import 'package:arfoon_note/configs/theme/app_colors.dart';
import 'package:arfoon_note/view/add_todo/add_todo_screen/add_todo_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FloatingButton extends StatelessWidget {
  const FloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.primary,
      onPressed: () async {
        await Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddTodoScreen(),
          ),
        );
      },
      child: SvgPicture.asset(
        AppVectors.plus,
        colorFilter: const ColorFilter.mode(
          Colors.white,
          BlendMode.srcIn,
        ),
      ),
    );
  }
}
