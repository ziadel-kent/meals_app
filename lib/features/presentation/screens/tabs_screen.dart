import 'package:flutter/material.dart';
import 'package:meals_app/features/data/models/meal.dart';
import 'package:meals_app/features/presentation/screens/favorite_screen.dart';
import 'package:meals_app/features/presentation/widgets/main_drawer.dart';
import 'package:meals_app/viewmodel.dart';
import 'package:provider/provider.dart';
import 'categories_screen.dart';
import 'meal_details_screen.dart';

// class TabsScreen extends StatefulWidget {
//   const TabsScreen({super.key});

//   @override
//   State<TabsScreen> createState() => _TabsScreenState();
// }

// class _TabsScreenState extends State<TabsScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Theme.of(context).primaryColor,
//           bottom: PreferredSize(
//             preferredSize: Size.fromHeight(20),
//             child: TabBar(
//               labelPadding: EdgeInsets.all(0),
//               unselectedLabelColor: Colors.black54,
//               labelColor: Theme.of(context).canvasColor,
//               tabs: [
//                 Tab(icon: Icon(Icons.category), text: 'categories'),
//                 Tab(icon: Icon(Icons.star), text: 'Favorites'),
//               ],
//             ),
//           ),
//         ),
//         body: TabBarView(children: [CategoriesScreen(), FavoriteScreen()]),

//       ),
//     );
//   }
// }

class TabsScreen extends StatefulWidget {
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> _screen = [CategoriesScreen(), FavoriteScreen()];
  final List<String> _titles = ['Categories', 'Favorite'];

  int _selectedIndexPage = 0;
  void _selectedtab(int index) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _selectedIndexPage = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndexPage]),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _screen[_selectedIndexPage],
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedtab,
        selectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndexPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
