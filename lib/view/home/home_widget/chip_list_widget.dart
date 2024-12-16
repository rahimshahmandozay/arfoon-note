import 'package:arfoon_note/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ChipListWidget extends StatelessWidget {
  const ChipListWidget({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
  });
  final String text;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: AppColors.borderColor,
        ),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: textColor,
        ),
      ),
    );
  }
}
