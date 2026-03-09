import 'package:flutter/material.dart';
import 'package:meals_app/core/routers/app_routes.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.id,
    required this.color,
    required this.title,
    required this.icon,
  });

  final String id;
  final String title;
  final Color color;
  final IconData icon;

  void _selectedCategory(BuildContext context) {
    Navigator.of(
      context,
    ).pushNamed(AppRoutes.kcategories, arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: const BorderRadius.all(Radius.circular(15)),
      onTap: () => _selectedCategory(context),
      child: Card(
        elevation: 5,
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            gradient: LinearGradient(
              colors: [color, color.withOpacity(0.7), color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: color,
                radius: 22,
                child: Icon(icon, size: 30, color: Colors.white),
              ),
              Text(title, style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }
}
