import 'package:arfoon_note/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AddDialog extends StatelessWidget {
  const AddDialog({
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
        width: 409,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "New Label",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppColors.primaryTxtColor,
                ),
              ),
              const SizedBox(height: 18),
              const Text(
                "Label Name",
                style: TextStyle(
                  color: Color(0xFF09090B),
                ),
              ),
              const SizedBox(height: 4),
              TextField(
                decoration: const InputDecoration(
                  hintText: "A Creative Label Name",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  label = value;
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      backgroundColor: AppColors.surface,
                      foregroundColor: AppColors.disabled,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text("Delete"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
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
                    child: const Text("Save Label"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
