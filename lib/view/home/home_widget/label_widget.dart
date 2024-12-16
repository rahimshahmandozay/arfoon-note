import 'package:arfoon_note/configs/assets/app_vectors.dart';
import 'package:arfoon_note/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LabelsWidget extends StatelessWidget {
  const LabelsWidget({
    super.key,
    required this.onUpdate,
    required this.label,
  });
  final VoidCallback onUpdate;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  AppVectors.label,
                  height: 24,
                  width: 24,
                  colorFilter: const ColorFilter.mode(
                    AppColors.disabled,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.secondaryTxtColor,
                  ),
                ),
              ],
            ),
            const Spacer(),
            InkWell(
              onTap: onUpdate,
              child: SvgPicture.asset(
                AppVectors.edit,
                height: 20,
                width: 20,
                colorFilter: const ColorFilter.mode(
                  AppColors.disabled,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
