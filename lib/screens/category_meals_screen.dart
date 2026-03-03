import 'package:flutter/material.dart';
import 'package:meals_app/dummy_meals.dart';
import 'package:meals_app/widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var routeArgs =
        (ModalRoute.of(context)?.settings.arguments) as Map<String, String>;
    final title = routeArgs['title'];
    final id = routeArgs['id'];
    final categoryMeal =
        DUMMY_MEALS.where((meal) => meal.categories.contains(id)).toList();
    return Scaffold(
      appBar: AppBar(title: Text('$title')),
      body: ListView.builder(
        itemCount: categoryMeal.length,
        itemBuilder: (ctx, index) {
          return MealItem(
            meal: categoryMeal[index],
            // title: categoryMeal[index].title,
            // affordability: categoryMeal[index].affordability,
            // complexity: categoryMeal[index].complexity,
            // duration: categoryMeal[index].duration,
            // imageUrl: categoryMeal[index].imageUrl,
          );
        },
      ),
    );
  }
}
