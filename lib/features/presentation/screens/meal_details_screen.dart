import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/core/theme/app_theme.dart';
import 'package:meals_app/dummy_meals.dart';
import 'package:meals_app/features/data/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, this.meal});
  final Meal? meal;
  Widget _buildContainer(BuildContext context, Widget child) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: child,
    );
  }

  Widget _buildContainerListView(
    Widget child,
    BuildContext context,
    String text,
  ) {
    return Column(
      children: [
        SizedBox(
          child: Text(text, style: Theme.of(context).textTheme.titleMedium),
        ),

        Container(
          margin: const EdgeInsets.only(left: 55, right: 55),
          height: 240,
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: child,
        ),
      ],
    );
  }

  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context)?.settings.arguments as String;

    final mealDetail = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Container(
                margin: EdgeInsets.all(8),
                alignment: Alignment.bottomLeft,
                child: Text(
                  mealDetail.title,
                  style: TextStyle(color: Colors.white),
                ),
              ),

              background: CachedNetworkImage(
                fit: BoxFit.cover,
                width: double.infinity,
                imageUrl: mealDetail.imageUrl,
                placeholder:
                    (context, url) =>
                        const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                SizedBox(height: 70),
                Container(
                  height: 500,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildContainerListView(
                        ListView.builder(
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemCount: mealDetail.ingredients.length,
                          itemBuilder: (context, index) {
                            final meal = mealDetail.ingredients[index];
                            return _buildContainer(
                              context,
                              ListTile(
                                leading: Text(
                                  meal,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            );
                          },
                        ),
                        context,
                        'Ingredients',
                      ),
                      _buildContainerListView(
                        ListView.builder(
                          itemCount: mealDetail.steps.length,
                          itemBuilder: (context, index) {
                            final meal = mealDetail.steps[index];
                            return _buildContainer(
                              context,
                              ListTile(
                                leading: CircleAvatar(
                                  child: Text('#${1 + index}'),
                                ),
                                title: Text(meal),
                              ),
                            );
                          },
                        ),
                        context,
                        'Steps',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
        backgroundColor: ThemeData.light().canvasColor,
      ),
    );
  }
}
// class MealDetailsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var mealId = ModalRoute.of(context)!.settings.arguments as String;
//     var mealDetail = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           /// صورة كبيرة قابلة للانكماش
//           SliverAppBar(
//             expandedHeight: 300,

//             pinned: true,
//             flexibleSpace: FlexibleSpaceBar(
//               title: Text(mealDetail.title),
//               background: Image.network(mealDetail.imageUrl, fit: BoxFit.cover),
//             ),
//           ),

//           /// عنوان Ingredients
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(12),
//               child: Text(
//                 "Ingredients",
//                 style: Theme.of(context).textTheme.titleLarge,
//               ),
//             ),
//           ),

//           /// ليست Ingredients
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (context, index) =>
//                   ListTile(title: Text(mealDetail.ingredients[index])),
//               childCount: mealDetail.ingredients.length,
//             ),
//           ),

//           /// عنوان Steps
//           SliverToBoxAdapter(
//             child: Padding(
//               padding: const EdgeInsets.all(12),
//               child: Text(
//                 "Steps",
//                 style: Theme.of(context).textTheme.titleLarge,
//               ),
//             ),
//           ),

//           /// ليست Steps
//           SliverList(
//             delegate: SliverChildBuilderDelegate(
//               (context, index) => ListTile(
//                 leading: CircleAvatar(child: Text('#${index + 1}')),
//                 title: Text(mealDetail.steps[index]),
//               ),
//               childCount: mealDetail.steps.length,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
