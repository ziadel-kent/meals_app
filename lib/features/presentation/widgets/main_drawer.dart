import 'package:flutter/material.dart';
import 'package:meals_app/core/constants/app_strings.dart';
import 'package:meals_app/features/presentation/screens/categories_screen.dart';
import 'package:meals_app/features/presentation/screens/favorite_screen.dart';
import 'package:meals_app/features/presentation/screens/filters_screen.dart';
import 'package:meals_app/features/presentation/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    Widget _buildListTile(
      String title,
      IconData icon,
      GestureTapCallback tapHandler,
    ) {
      return ListTile(
        leading: Icon(icon, size: 26),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 22,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        ),
        onTap: tapHandler,
      );
    }

    return Drawer(
      backgroundColor: const Color.fromARGB(255, 253, 240, 203),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.amber,
            ),
            padding: EdgeInsets.all(20),
            height: 80,
            width: double.infinity,
            alignment: Alignment.centerLeft,

            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 32,
                color: Colors.red,
              ),
            ),
          ),
          _buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          _buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}