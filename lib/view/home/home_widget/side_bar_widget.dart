import 'package:arfoon_note/configs/assets/app_vectors.dart';
import 'package:arfoon_note/configs/theme/app_colors.dart';
import 'package:arfoon_note/view/home/home_widget/label_widget.dart';
import 'package:arfoon_note/view_model/edit_profile.dart';
import 'package:arfoon_note/view_model/greeting_provider.dart';
import 'package:arfoon_note/view_model/label_provider.dart';
import 'package:arfoon_note/widgets/add_dialog.dart';
import 'package:arfoon_note/widgets/edit_dialog.dart';
import 'package:arfoon_note/widgets/delete_dialog.dart';
import 'package:arfoon_note/widgets/settings_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class SideBarWidget extends StatelessWidget {
  const SideBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final editProvider = context.watch<EditProfileProvider>();
    final greetingProvider = context.watch<GreetingProvider>();

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  AppVectors.logo,
                  width: 35,
                  height: 35,
                ),
                const SizedBox(width: 8),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Arfoon Note",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryTxtColor,
                      ),
                    ),
                    Text(
                      "Think. Note. Achieve",
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.secondaryTxtColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SvgPicture.asset(
                              AppVectors.allNotes,
                              height: 24,
                              width: 24,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "All Notes",
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.primaryTxtColor,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {},
                              child: SvgPicture.asset(
                                AppVectors.forward,
                                height: 16,
                                width: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Labels",
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.secondaryTxtColor,
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Expanded(
            child: Consumer<LabelProvider>(
                builder: (context, labelProvider, child) {
              if (labelProvider.labels.isEmpty) {
                return const Center(
                  child: Text("No label, add some"),
                );
              }
              return ListView.builder(
                itemCount: labelProvider.labels.length,
                itemBuilder: (context, index) {
                  final label = labelProvider.labels[index];
                  return InkWell(
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return DeleteDialog(
                            onDelete: () {
                              context.read<LabelProvider>().deleteLabel(index);
                            },
                          );
                        },
                      );
                    },
                    child: LabelsWidget(
                      onUpdate: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AddDialog(
                              onSave: (value) {
                                context
                                    .read<LabelProvider>()
                                    .updateLabel(index, value);
                              },
                            );
                          },
                        );
                      },
                      label: label,
                    ),
                  );
                },
              );
            }),
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AddDialog(
                            onSave: (value) {
                              context.read<LabelProvider>().addLabel(value);
                            },
                          );
                        },
                      );
                    },
                    child: SvgPicture.asset(
                      AppVectors.copy,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add Label",
                        style: TextStyle(
                          color: AppColors.primaryTxtColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const SettingsDialog();
                        },
                      );
                    },
                    child: SvgPicture.asset(
                      AppVectors.setting,
                      width: 24,
                      height: 24,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xFF18181B),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    editProvider.initials,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      editProvider.name.length > 20
                          ? '${editProvider.name.substring(0, 20)}...'
                          : editProvider.name,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryTxtColor,
                      ),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      greetingProvider.greeting,
                      style: const TextStyle(
                        fontSize: 14,
                        color: AppColors.secondaryTxtColor,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return EditDialog(
                          onSave: (value) {
                            context.read<EditProfileProvider>().editName(value);
                          },
                        );
                      },
                    );
                  },
                  child: SvgPicture.asset(AppVectors.changer),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
