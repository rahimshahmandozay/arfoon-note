import 'package:arfoon_note/configs/assets/app_vectors.dart';
import 'package:arfoon_note/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class EditDialog extends StatelessWidget {
  const EditDialog({
    super.key,
    required this.onSave,
    this.initialLabel = '',
  });

  final Function(String) onSave;
  final String initialLabel;

  @override
  Widget build(BuildContext context) {
    String label = initialLabel;

    return Dialog(
      backgroundColor: AppColors.lightBackground,
      child: SizedBox(
        width: 434,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(40, 60, 40, 28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(AppVectors.logo, height: 89, width: 89),
              SizedBox(height: 20),
              const Text(
                "Welcome to Arfoon Note",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTxtColor,
                ),
              ),
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Full Name",
                    style: TextStyle(
                      color: Color(0xFF09090B),
                    ),
                  ),
                  const SizedBox(height: 4),
                  TextField(
                    decoration: const InputDecoration(
                      hintText: "Full Name",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      label = value;
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                onPressed: () {
                  onSave(label);
                  Navigator.of(context).pop();
                  label = '';
                },
                child: const Text("Continue"),
              ),
              SizedBox(height: 7),
              Text(
                "By using X note you agree to Terms of Services and Privacy Policy",
                style: TextStyle(
                  color: Color(0xFFA2A2A2),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
