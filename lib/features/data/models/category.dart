import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final IconData icon;

  const Category({
    required this.icon,
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
}
