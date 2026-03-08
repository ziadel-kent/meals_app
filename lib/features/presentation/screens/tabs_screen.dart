import 'package:flutter/material.dart';
import 'package:meals_app/features/data/models/meal.dart';
import 'package:meals_app/features/presentation/screens/favorite_screen.dart';
import 'package:meals_app/features/presentation/widgets/main_drawer.dart';
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
  const TabsScreen(this.favMeal);
  final List<Meal> favMeal;
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late List<Map<String, Object>> _pages;
  initState() {
    _pages = [
      {'page': CategoriesScreen(), 'title': 'Categories'},
      {'page': FavoriteScreen(widget.favMeal), 'title': 'Favorite'},
    ];
    super.initState();
  }

  int _selectedIndexPage = 0;
  void _selectedIndex(int index) {
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
        title: Text(_pages[_selectedIndexPage]['title'] as String),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _pages[_selectedIndexPage]['page'] as Widget,
      drawer: MainDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedIndex,
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
