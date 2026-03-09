import 'package:flutter/material.dart';
import 'package:meals_app/core/routers/app_routes.dart';
import 'package:meals_app/features/presentation/screens/category_meals_screen.dart';
import 'package:meals_app/features/presentation/screens/favorite_screen.dart';
import 'package:meals_app/features/presentation/screens/filters_screen.dart';
import 'package:meals_app/features/presentation/screens/meal_details_screen.dart';
import 'package:meals_app/features/presentation/screens/tabs_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.kTabs:
        return MaterialPageRoute(
          builder: (context) {
            return const TabsScreen();
          },
        );
      case AppRoutes.kcategories:
        final args = settings.arguments as Map<String, String>;

        return MaterialPageRoute(
          builder: (context) => CategoryMealsScreen(),
          settings: RouteSettings(arguments: args),
        );

      case AppRoutes.kFavorites:
        return MaterialPageRoute(
          builder: (context) {
            return const FavoriteScreen();
          },
        );
      case AppRoutes.kFilters:
        return MaterialPageRoute(
          builder: (context) {
            return const FiltersScreen();
          },
        );
      case AppRoutes.kmealDetails:
        final args = settings.arguments as String;
        return MaterialPageRoute(
          builder: (context) => const MealDetailsScreen(),
          settings: RouteSettings(arguments: args),
        );

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
