import 'package:flutter/material.dart';
import 'package:meals_app/core/routers/app_routes.dart';
import 'package:meals_app/dummy_meals.dart';
import 'package:meals_app/features/data/models/meal.dart';
import 'package:meals_app/features/presentation/screens/categories_screen.dart';
import 'package:meals_app/features/presentation/screens/category_meals_screen.dart';
import 'package:meals_app/features/presentation/screens/favorite_screen.dart';
import 'package:meals_app/features/presentation/screens/filters_screen.dart';
import 'package:meals_app/features/presentation/screens/tabs_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case AppRoutes.kTabs:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return TabsScreen();
      //     },

      //   );
      // case AppRoutes.kcategories:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return CategoryMealsScreen();
      //     },

      //   );
      case AppRoutes.kFavorites:
        return MaterialPageRoute(
          builder: (context) {
            return FavoriteScreen();
          },
        );
      // case AppRoutes.kFilters:
      //   return MaterialPageRoute(
      //     builder: (context) {
      //       return FiltersScreen();
      //     },

      //   );
      default:
        return MaterialPageRoute(
          builder: (context) {
            return Scaffold(
              body: Center(child: Text('No routes found for ${settings.name}')),
            );
          },
        );
    }
  }
}
