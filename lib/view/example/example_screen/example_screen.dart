import 'package:arfoon_note/configs/theme/app_colors.dart';
import 'package:arfoon_note/data/example.dart';
import 'package:arfoon_note/view/example/example_widget/app_bar_widget.dart';
import 'package:arfoon_note/view/example/example_widget/list_widget.dart';
import 'package:flutter/material.dart';

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const EAppBarWidget(),
      body: SafeArea(
        child: ListView.builder(
          itemCount: exampleData.length,
          itemBuilder: (context, index) {
            final data = exampleData[index];
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/home");
              },
              child: ListWidget(
                title: data.title,
                description: data.description,
                color: index.isEven ? Colors.transparent : AppColors.surface,
              ),
            );
          },
        ),
      ),
    );
  }
}
