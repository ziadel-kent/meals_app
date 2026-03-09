import 'package:flutter/material.dart';
import 'package:meals_app/core/routers/app_routes.dart';

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
          style: const TextStyle(
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
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.amber,
            ),
            padding: const EdgeInsets.all(20),
            height: 80,
            width: double.infinity,
            alignment: Alignment.centerLeft,

            child: const Text(
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
            Navigator.of(context).pushReplacementNamed(AppRoutes.kFilters);
          }),
        ],
      ),
    );
  }
}
