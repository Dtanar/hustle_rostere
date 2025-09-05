import 'package:flutter/material.dart';

enum TaskCategories {
  education(Icons.school, Colors.blue),
  work(Icons.work, Colors.green),
  personal(Icons.person, Colors.orange),
  shopping(Icons.shopping_cart, Colors.purple),
  health(Icons.health_and_safety, Colors.red),
  home(Icons.home, Colors.teal),
  social(Icons.people, Colors.cyan),
  entertainment(Icons.movie, Colors.pink),
  travel(Icons.flight, Colors.amber),
  others(Icons.category, Colors.grey);

  final IconData icon;
  final Color color;

  const TaskCategories(
    this.icon,
    this.color
  );
}
