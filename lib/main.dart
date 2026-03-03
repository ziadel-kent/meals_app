import 'package:flutter/material.dart';
import 'package:meals_app/core/constants/app_strings.dart';
import 'package:meals_app/screens/meal_details_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/category_meals_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DeliMeal',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        fontFamily: 'Raleway',
        scaffoldBackgroundColor: const Color.fromARGB(255, 234, 229, 213),
        canvasColor: const Color.fromARGB(222, 145, 175, 196),
        appBarTheme: ThemeData.light().appBarTheme.copyWith(
          // titleTextStyle: TextStyle(fontFamily:'RobotoCondensed')
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
          bodySmall: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          bodyMedium: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
          titleMedium: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
        primaryColor: Colors.blueGrey.shade700,
      ),

      // home: const CategoriesScreen(),
      initialRoute: '/',
      // onGenerateRoute: (settings) =>  ,
      routes: {
        '/': (ctx) => CategoriesScreen(),
        AppStrings.kCategoryMealsScreen: (ctx) => CategoryMealsScreen(),
        AppStrings.kMealDetailsScreen: (ctx) => MealDetailsScreen(),
      },

      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen());
      },
    );
  }
}
