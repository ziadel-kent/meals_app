import 'package:flutter/material.dart';
import 'package:meals_app/features/presentation/widgets/category_item.dart';
import 'package:meals_app/dummy_meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  static const id = '/category-screen';
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 220,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      children: [
        ...DUMMY_CATEGORIES
            .map(
              (cat) =>
                  CategoryItem(color: cat.color, title: cat.title, id: cat.id),
            )
            .toList(),
      ],
    );
  }
}
