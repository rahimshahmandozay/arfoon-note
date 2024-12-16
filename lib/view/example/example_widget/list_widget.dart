import 'package:arfoon_note/configs/layout/responsive.dart';
import 'package:arfoon_note/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({
    super.key,
    required this.title,
    required this.description,
    required this.color,
  });

  final String title;
  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6, top: 14),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Responsive.isMobile(context) ? 26 : 27,
          vertical: Responsive.isMobile(context) ? 13 : 28,
        ),
        decoration: BoxDecoration(color: color),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: Responsive.isMobile(context) ? 24 : 37,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              description,
              style: TextStyle(
                fontSize: Responsive.isMobile(context) ? 14 : 24,
                color: AppColors.disabled,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
