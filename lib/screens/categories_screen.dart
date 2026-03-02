import 'package:flutter/material.dart';
import 'package:meals_app/widgets/category_item.dart';
import 'package:meals_app/dummy_meals.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: AppBar(
        title: Text('Categories'),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: GridView(
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
                (cat) => CategoryItem(
                  color: cat.color,
                  title: cat.title,
                  id: cat.id,
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
