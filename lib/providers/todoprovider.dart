import 'package:flutter/material.dart';
import '/models/todomodel.dart';

class TodosProvider extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
      createdTime: DateTime.now(),
      title: 'Buy A new Gaming laptop 💻',
      description: '''- Razer Blade 15. The best gaming laptop.
- Asus ROG Zephyrus G14 (2022) The best all-round gaming laptop. 
- Razer Blade 14. The most desirable compact gaming laptop.
- Lenovo Legion 5 Pro (16" AMD)''',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Complete A previous Task 📚',
    ),
    Todo(
      createdTime: DateTime.now(),
      title: 'Buy Food 😋',
      description: '''- Eggs
- Milk
- Bread
- Water''',
    ),
    Todo(createdTime: DateTime.now(), title: 'Walking for 30 minutes 🚶‍♂️'),
  ];
  List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();
  List<Todo> get todosCompleted =>
      _todos.where((todo) => todo.isDone == true).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }

  void updateTodo(Todo todo, String title, String description) {
    todo.title = title;
    todo.description = description;
    notifyListeners();
  }

  bool toggleTodoStatus(Todo todo) {
    todo.isDone = !todo.isDone;
    notifyListeners();
    return todo.isDone;
  }
}
