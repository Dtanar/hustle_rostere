import 'package:flutter/material.dart';

enum HustleCategories {
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

  static HustleCategories stringToCategory(String name) {
    try {
      return HustleCategories.values.firstWhere(
        (category) => category.name == name,
      );
    } catch (e) {
      return HustleCategories.others;
    }
  }

  final IconData icon;
  final Color color;

  const HustleCategories(this.icon, this.color);
}
