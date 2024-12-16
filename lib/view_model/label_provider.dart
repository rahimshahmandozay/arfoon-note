import 'package:flutter/material.dart';

class LabelProvider extends ChangeNotifier {
  final List<String> _labels = [];

  List<String> get labels => _labels;

  // CREATE
  void addLabel(String label) {
    _labels.add(label);
    notifyListeners();
  }

  // UPDATE
  void updateLabel(int index, String updatedLabel) {
    if (index >= 0 && index < _labels.length) {
      _labels[index] = updatedLabel;
      notifyListeners();
    }
  }

// DELETE
  void deleteLabel(int index) {
    if (index >= 0 && index < _labels.length) {
      _labels.removeAt(index);
    }
    notifyListeners();
  }
}
