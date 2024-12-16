import 'package:flutter/material.dart';

class TodoModel {
  final String title;
  final String description;
  final Color color;
  final DateTime saveTime;
  final String? label;
  bool isPined;

  TodoModel({
    required this.title,
    required this.description,
    required this.color,
    required this.saveTime,
    required this.label,
    this.isPined = false,
  });
}
