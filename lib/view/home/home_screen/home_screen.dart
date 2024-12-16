import 'package:arfoon_note/configs/layout/responsive.dart';
import 'package:arfoon_note/configs/theme/app_colors.dart';
import 'package:arfoon_note/view/add_todo/add_todo_screen/add_todo_screen.dart';
import 'package:arfoon_note/view/home/home_widget/h_app_bar_widget.dart';
import 'package:arfoon_note/view/home/home_widget/my_note_widget.dart';
import 'package:arfoon_note/view/home/home_widget/side_bar_widget.dart';
import 'package:arfoon_note/widgets/floating_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: Responsive.isMobile(context) ? const HAppBarWidget() : null,
        drawer: Responsive.isMobile(context)
            ? const Drawer(
                backgroundColor: AppColors.surface,
                child: SideBarWidget(),
              )
            : null,
        floatingActionButton:
            Responsive.isMobile(context) ? const FloatingButton() : null,
        body: Responsive(
          mobile: const MyNoteWidget(),
          desktop: Row(
            children: [
              Container(
                width: 256,
                color: AppColors.surface,
                child: const SideBarWidget(),
              ),
              Container(
                width: 345,
                color: AppColors.lightBackground,
                child: const MyNoteWidget(),
              ),
              Expanded(
                child: Container(
                  color: AppColors.lightBackground,
                  child: const AddTodoScreen(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
