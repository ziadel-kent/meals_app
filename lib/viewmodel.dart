import 'package:flutter/material.dart';
import 'package:meals_app/dummy_meals.dart';
import 'package:meals_app/features/data/models/meal.dart';

class MealsViewModel extends ChangeNotifier {
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  List<Meal> get availableMeals => _availableMeals;
  List<Meal> get favoriteMeals => _favoriteMeals;

  void setFilters(Map<String, bool> filterData) {
    filters = filterData;

    _availableMeals = DUMMY_MEALS.where((meal) {
      if (filters['gluten']! && !meal.isGlutenFree) return false;
      if (filters['lactose']! && !meal.isLactoseFree) return false;
      if (filters['vegan']! && !meal.isVegan) return false;
      if (filters['vegetarian']! && !meal.isVegetarian) return false;
      return true;
    }).toList();

    notifyListeners();
  }

  void toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      _favoriteMeals.removeAt(existingIndex);
    } else {
      _favoriteMeals.add(
        DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
      );
    }

    notifyListeners();
  }
}