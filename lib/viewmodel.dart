import 'package:flutter/material.dart';
import 'package:meals_app/dummy_meals.dart';
import 'package:meals_app/features/data/models/meal.dart';

class MealsViewModel extends ChangeNotifier {
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  List<Meal> get availableMeals => _availableMeals;
  List<Meal> get favoriteMeals => _favoriteMeals;
  List<Meal> displayedMeal = [];


  setCategoryMeals(String CategoryId){
    displayedMeal= 
          availableMeals.where((meal) {
            return meal.categories.contains(CategoryId);
          }).toList();
  }
  void removeItem(String mealId) {
    displayedMeal.removeWhere((meal) => meal.id == mealId);
    ;
  }

  Map<String, bool> filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  void setFilters(Map<String, bool> filterData) {
    filters = filterData;

    _availableMeals =
        DUMMY_MEALS.where((meal) {
          if (filters['gluten']! && !meal.isGlutenFree) return false;
          if (filters['lactose']! && !meal.isLactoseFree) return false;
          if (filters['vegan']! && !meal.isVegan) return false;
          if (filters['vegetarian']! && !meal.isVegetarian) return false;
          return true;
        }).toList();

    notifyListeners();
  }

  bool isFavorite(Meal mmeal) {
    return _favoriteMeals.any((meal) => meal == mmeal);
  }

  void toggleFavorite(Meal meal) {
    if (_favoriteMeals.contains(meal)) {
      _favoriteMeals.remove(meal);
    } else {
      _favoriteMeals.add(meal);
    }
    notifyListeners();
  }
}
