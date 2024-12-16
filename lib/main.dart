import 'package:arfoon_note/configs/theme/app_theme.dart';
import 'package:arfoon_note/view/example/example_screen/example_screen.dart';
import 'package:arfoon_note/view/home/home_screen/home_screen.dart';
import 'package:arfoon_note/view_model/greeting_provider.dart';
import 'package:arfoon_note/view_model/todo_provider.dart';
import 'package:arfoon_note/view_model/edit_profile.dart';
import 'package:arfoon_note/view_model/label_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => TodoProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => EditProfileProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LabelProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GreetingProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      routes: {
        "/example": (context) => const ExampleScreen(),
        "/home": (context) => const HomeScreen(),
      },
      home: const ExampleScreen(),
    );
  }
}
