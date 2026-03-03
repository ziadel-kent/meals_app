import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/dummy_meals.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, this.meal});
  final Meal? meal;
  @override
  Widget _buildContainer(BuildContext context, Widget child) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
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
          margin: EdgeInsets.only(left: 55, right: 55),
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

  // Widget _buildtext(BuildContext context, String text) {
  //   return SizedBox(
  //     child: Text(text, style: Theme.of(context).textTheme.titleMedium),
  //   );
  // }

  Widget build(BuildContext context) {
    var mealId = ModalRoute.of(context)?.settings.arguments as String;

    var mealDetail = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(title: Text(mealDetail.title)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              width: double.infinity,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                width: double.infinity,
                imageUrl: mealDetail.imageUrl,
                placeholder:
                    (context, url) =>
                        Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),

            // Expanded(
            //   child: ListView.builder(
            //     itemBuilder: (context, index) {
            //       var meal = mealDetail.ingredients[index];
            //       return Container(
            //         margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            //         decoration: BoxDecoration(
            //           color: Colors.amber,
            //           borderRadius: BorderRadius.all(Radius.circular(10)),
            //         ),
            //         child: ListTile(
            //           leading: Text(
            //             meal,
            //             style: Theme.of(context).textTheme.titleMedium,
            //           ),
            //         ),
            //       );
            //     },
            //     itemCount: mealDetail.ingredients.length,
            //   ),
            // ),
            Container(
              height: 300,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildContainerListView(
                    ListView.builder(
                      itemCount: mealDetail.ingredients.length,
                      itemBuilder: (context, index) {
                        var meal = mealDetail.ingredients[index];
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
                        var meal = mealDetail.steps[index];
                        return _buildContainer(
                          context,
                          ListTile(
                            leading: CircleAvatar(child: Text('#${1 + index}')),
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
            // SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
