import 'dart:async';
import 'package:flutter/material.dart';

class GreetingProvider extends ChangeNotifier {
  String _greeting = "";

  GreetingProvider() {
    _updateGreeting();
    Timer.periodic(const Duration(seconds: 1), (timer) => _updateGreeting());
  }

  String get greeting => _greeting;

  void _updateGreeting() {
    final hour = DateTime.now().hour;

    String newGreeting;
    if (hour < 12) {
      newGreeting = "Good Morning";
    } else if (hour < 17) {
      newGreeting = "Good Afternoon";
    } else {
      newGreeting = "Good Evening";
    }

    if (newGreeting != _greeting) {
      _greeting = newGreeting;
      notifyListeners();
    }
  }
}
