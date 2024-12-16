import 'package:arfoon_note/configs/assets/app_vectors.dart';
import 'package:arfoon_note/configs/layout/responsive.dart';
import 'package:arfoon_note/configs/theme/app_colors.dart';
import 'package:arfoon_note/view/add_todo/add_todo_widget/a_app_bar_widget.dart';
import 'package:arfoon_note/view/add_todo/add_todo_widget/color_palette_widget.dart';
import 'package:arfoon_note/view_model/todo_provider.dart';
import 'package:arfoon_note/widgets/add_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' show pi;
import 'package:provider/provider.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends State<AddTodoScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  Color _backgroundColor = AppColors.surface;
  final DateTime saveTime = DateTime.now();
  String label = "";

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<bool> _onWillPop() async {
    if (_titleController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty) {
      context.read<TodoProvider>().addTask(
            _titleController.text,
            _descriptionController.text,
            _backgroundColor,
            saveTime,
            label,
          );
      _titleController.clear();
      _descriptionController.clear();
      setState(() {
        label = "";
        _backgroundColor = AppColors.surface;
      });
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    if (Responsive.isMobile(context)) {
      // ignore: deprecated_member_use
      return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          appBar: AAppBarWidget(),
          body: todoDetailsWidget(),
        ),
      );
    } else {
      return todoDetailsWidget();
    }
  }

  Widget todoDetailsWidget() {
    return Padding(
      padding: EdgeInsets.all(Responsive.isDesktop(context) ? 20 : 0),
      child: Column(
        children: [
          const SizedBox(height: 10),
          if (Responsive.isDesktop(context))
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "My Notes",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF09090B),
                      ),
                    ),
                    const SizedBox(width: 10),
                    SvgPicture.asset(
                      AppVectors.forward,
                      height: 16,
                      width: 16,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFF09090B),
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Untitled",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF09090B),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "Last Update Dec 17",
                      style: TextStyle(
                        color: AppColors.secondaryTxtColor,
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        if (_titleController.text.isNotEmpty &&
                            _descriptionController.text.isNotEmpty) {
                          context.read<TodoProvider>().addTask(
                                _titleController.text,
                                _descriptionController.text,
                                _backgroundColor,
                                saveTime,
                                label,
                              );
                          _titleController.clear();
                          _descriptionController.clear();
                          setState(() {
                            label = "";
                            _backgroundColor = AppColors.surface;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFF4F4F5),
                        foregroundColor: AppColors.primaryTxtColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      icon: SvgPicture.asset(AppVectors.save),
                      label: const Text("Save Changes"),
                    ),
                    const SizedBox(width: 10),
                    Transform.rotate(
                      angle: 0.5 * pi,
                      child: SvgPicture.asset(
                        AppVectors.dots,
                        height: 24,
                        width: 24,
                        colorFilter: const ColorFilter.mode(
                          Color(0xFF73737E),
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          if (Responsive.isDesktop(context))
            Divider(
              thickness: 1,
              color: AppColors.dividerColor,
            ),
          Expanded(
            child: Container(
              color: _backgroundColor,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (Responsive.isMobile(context))
                      const SizedBox(height: 20),
                    if (Responsive.isMobile(context))
                      Text(
                        "Updated at Dec 17",
                        style: TextStyle(
                          color: AppColors.secondaryTxtColor,
                        ),
                      ),
                    if (Responsive.isDesktop(context))
                      const SizedBox(height: 20),
                    TextField(
                      controller: _titleController,
                      style: const TextStyle(
                        fontSize: 36,
                        fontWeight: FontWeight.w600,
                        color: AppColors.hintTextColor,
                      ),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        hintText: "Untitled",
                        hintStyle: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w600,
                          color: AppColors.hintTextColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        autofocus: true,
                        controller: _descriptionController,
                        maxLines: null,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.hintTextColor,
                        ),
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Description",
                          hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.hintTextColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 8,
            ),
            decoration: Responsive.isMobile(context)
                ? BoxDecoration(
                    border: Border.all(
                      width: 0.5,
                      color: AppColors.borderColor,
                    ),
                  )
                : null,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AddDialog(
                          onSave: (value) {
                            setState(() {
                              label = value;
                            });
                          },
                        );
                      },
                    );
                  },
                  child: const Text(
                    "Add Label",
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColors.hintTextColor,
                    ),
                  ),
                ),
                if (Responsive.isMobile(context))
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ColorPaletteWidget(
                        color: AppColors.zengalyColor,
                        onTap: () => setState(
                          () => _backgroundColor = AppColors.zengalyColor,
                        ),
                      ),
                      Positioned(
                        right: 15,
                        child: ColorPaletteWidget(
                          color: AppColors.orangeColor,
                          onTap: () => setState(
                            () => _backgroundColor = AppColors.orangeColor,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 30,
                        child: ColorPaletteWidget(
                          color: AppColors.blueColor,
                          onTap: () => setState(
                            () => _backgroundColor = AppColors.blueColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                // Wrap(
                //   spacing: 5,
                //   alignment: WrapAlignment.center,
                //   children: [
                //     ColorPalette(
                //       color: AppColors.zengalyColor,
                //       onTap: () => setState(
                //         () => _bgColor = AppColors.zengalyColor,
                //       ),
                //     ),
                //     Positioned(
                //       right: 30,
                //       child: ColorPalette(
                //         color: AppColors.orangeColor,
                //         onTap: () => setState(
                //           () => _bgColor = AppColors.orangeColor,
                //         ),
                //       ),
                //     ),
                //     Positioned(
                //       right: 60,
                //       child: ColorPalette(
                //         color: AppColors.blueColor,
                //         onTap: () => setState(
                //           () => _bgColor = AppColors.blueColor,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                if (Responsive.isDesktop(context))
                  Row(
                    children: [
                      ColorPaletteWidget(
                        color: AppColors.blueColor,
                        onTap: () => setState(
                          () => _backgroundColor = AppColors.blueColor,
                        ),
                      ),
                      const SizedBox(width: 16),
                      ColorPaletteWidget(
                        color: AppColors.orangeColor,
                        onTap: () => setState(
                          () => _backgroundColor = AppColors.orangeColor,
                        ),
                      ),
                      const SizedBox(width: 16),
                      ColorPaletteWidget(
                        color: AppColors.zengalyColor,
                        onTap: () => setState(
                          () => _backgroundColor = AppColors.zengalyColor,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
