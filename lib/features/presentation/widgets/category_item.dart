import 'package:flutter/material.dart';
import 'package:meals_app/core/routers/app_routes.dart';
import 'package:meals_app/features/presentation/screens/category_meals_screen.dart';
import '../../../core/constants/app_strings.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.id,
    required this.color,
    required this.title,
  });

  final String id;
  final String title;
  final Color color;

  void _selectedCategory(BuildContext context) {
    Navigator.of(
      context,
    ).pushNamed(AppRoutes.kcategories, arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      onTap: () => _selectedCategory(context),
      child: Card(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
              colors: [color, color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Text(title, style: Theme.of(context).textTheme.titleMedium),
        ),
      ),
    );
  }
}
