import 'package:flutter/material.dart';
import 'package:meals_app/core/routers/app_router.dart';
import 'package:meals_app/core/routers/app_routes.dart';
import 'package:meals_app/core/theme/app_theme.dart';
import 'package:meals_app/dummy_meals.dart';
import 'package:meals_app/features/presentation/screens/favorite_screen.dart';
import 'package:meals_app/viewmodel.dart';
import 'package:provider/provider.dart';
import './core/constants/app_strings.dart';
import 'features/data/models/meal.dart';
import 'features/presentation/screens/filters_screen.dart';
import 'features/presentation/screens/meal_details_screen.dart';
import 'features/presentation/screens/tabs_screen.dart';
import 'features/presentation/screens/categories_screen.dart';
import 'features/presentation/screens/category_meals_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MealsViewModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> favMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals =
          DUMMY_MEALS.where((meal) {
            if (_filters['gluten']! && !meal.isGlutenFree) {
              return false;
            }
            if (_filters['lactose']! && !meal.isLactoseFree) {
              return false;
            }
            if (_filters['vegan']! && !meal.isVegan) {
              return false;
            }
            if (_filters['vegetarian']! && !meal.isVegetarian) {
              return false;
            }
            return true;
          }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeal',

      theme: AppTheme.lightTheme,

      // home: const CategoriesScreen(),
      // initialRoute: '/',
      // onGenerateRoute: (settings) =>  ,
      onGenerateRoute: AppRouter().generateRoute,
      routes: {
        // AppRoutes.kcategories: (ctx) => CategoryMealsScreen(),
        // AppStrings.kMealDetailsScreen: (ctx) => MealDetailsScreen(),

        FiltersScreen.routeName:
            (ctx) => FiltersScreen(
              currentFilters: _filters,
              setFilters: _setFilters,
            ),
      },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
