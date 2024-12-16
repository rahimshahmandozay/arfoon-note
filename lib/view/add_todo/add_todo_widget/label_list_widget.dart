import 'package:arfoon_note/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LabelListWidget extends StatelessWidget {
  const LabelListWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),
      decoration: BoxDecoration(
        color: Color(0xFFF4F4F5),
        borderRadius: BorderRadius.circular(19),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.primaryTxtColor,
        ),
      ),
    );
  }
}
