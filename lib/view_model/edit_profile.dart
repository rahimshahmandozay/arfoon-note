import 'package:flutter/material.dart';

class EditProfileProvider extends ChangeNotifier {
  String _name = "Abdurahman Popal";

  String get name => _name;

  void editName(String newName) {
    _name = newName;
    notifyListeners();
  }

  String get initials {
    final parts = _name.split(' ');
    if (parts.length >= 2) {
      final firstNameInitial = parts.first[0].toUpperCase();
      final lastNameInitial = parts.last[0].toUpperCase();
      return '$firstNameInitial$lastNameInitial';
    }
    return _name.isNotEmpty ? _name[0].toUpperCase() : '';
  }
}
