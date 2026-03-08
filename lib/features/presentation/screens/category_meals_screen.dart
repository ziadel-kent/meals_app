import 'package:flutter/material.dart';
import 'package:meals_app/dummy_meals.dart';
import 'package:meals_app/features/data/models/meal.dart';
import 'package:meals_app/features/presentation/widgets/meal_item.dart';
import 'package:meals_app/viewmodel.dart';
import 'package:provider/provider.dart';

class CategoryMealsScreen extends StatefulWidget {
  @override
  State<CategoryMealsScreen> createState() => _CategoryMealsScreenState();
  static const id = '/category-meal-screen';
  // CategoryMealsScreen(this.availableMeals,);
  // final List<Meal> availableMeals;
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  var title;
  var id;
  bool _loadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      title = routeArgs['title'];
      id = routeArgs['id'];

      // displayedMeal =
      //     widget.availableMeals.where((meal) {
      //       return meal.categories.contains(id);
      //     }).toList();
      Provider.of<MealsViewModel>(context, listen: false).setCategoryMeals(id);

      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  // void _removeItem(String mealId) {
  //   setState(() {
  //     displayedMeal.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final removeItem = context.watch<MealsViewModel>().removeItem;
    final displayedMeal = context.watch<MealsViewModel>().displayedMeal;

    return Scaffold(
      appBar: AppBar(
        title: Text('$title', style: TextStyle(color: Colors.black)),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: displayedMeal.length,
        itemBuilder: (ctx, index) {
          return MealItem(meal: displayedMeal[index], removeItem: removeItem);
        },
      ),
    );
  }
}
