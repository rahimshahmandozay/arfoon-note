import 'dart:collection';

import 'package:arfoon_note/model/todo_model.dart';
import 'package:flutter/material.dart';

class TodoProvider with ChangeNotifier {
  List<TodoModel> _todos = [];
  String _search = '';

  UnmodifiableListView<TodoModel> get todos => UnmodifiableListView(_todos);

  // ADD TO-DO
  void addTask(String title, String description, Color color, DateTime saveTime,
      String? label) {
    final newTodo = TodoModel(
      title: title,
      description: description,
      color: color,
      saveTime: saveTime,
      label: label,
      isPined: false,
    );
    _todos.add(newTodo);
    notifyListeners();
  }

  // DELETE TO-DO
  void deleteTask(int index) {
    if (index >= 0 && index < _todos.length) {
      _todos.removeAt(index);
      notifyListeners();
    }
  }

  // SEARCH TO-DO
  List<TodoModel> get searchedTodo {
    if (_search.isEmpty) {
      return _todos;
    }
    return _todos
        .where(
            (todo) => todo.title.toLowerCase().contains(_search.toLowerCase()))
        .toList();
  }

  void searchQuery(String query) {
    _search = query;
    notifyListeners();
  }

// TOGGLING
  void pinOrUnpinTodo(int index) {
    _todos[index].isPined = !_todos[index].isPined;

    List<TodoModel> pinnedTodos = _todos.where((todo) => todo.isPined).toList();
    List<TodoModel> unpinnedTodos =
        _todos.where((todo) => !todo.isPined).toList();

    _todos = [...pinnedTodos, ...unpinnedTodos];

    notifyListeners();
  }
}
