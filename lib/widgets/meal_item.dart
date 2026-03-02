import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/core/constants/app_strings.dart';
import 'package:meals_app/dummy_meals.dart';
import 'package:meals_app/models/meal.dart';

class MealItem extends StatelessWidget {
  const MealItem({
    super.key,
    // required this.title,
    // required this.affordability,
    // required this.complexity,
    // required this.duration,
    // required this.imageUrl,
    required this.meal,
  });
  final Meal meal;
  // final String title;
  // final String imageUrl;
  // final int duration;
  // final Complexity complexity;
  // final Affordability affordability;
  Widget _row(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 6),
        text.length > 10 ? Text(text, overflow: TextOverflow.fade) : Text(text),
      ],
    );
  }

  // String get comlixityText {
  //   switch (meal.complexity) {
  //     case Complexity.Simple:
  //       return 'Simple';

  //     case Complexity.Challenging:
  //       return 'Challenging';

  //     case Complexity.Hard:
  //       return 'Hard';

  //     default:
  //       return 'unknown';
  //   }
  // }

  void selectMeal(BuildContext context) {
    Navigator.of(
      context,
    ).pushNamed(AppStrings.kMealDetailsScreen, arguments: meal);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    width: double.infinity,
                    imageUrl: meal.imageUrl,
                    placeholder:
                        (context, url) =>
                            Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                  //  Image.network(
                  //   meal.imageUrl,
                  //   height: 250,
                  //   width: double.infinity,
                  //   fit: BoxFit.cover,
                  // ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    width: 220,
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _row(Icons.schedule, '${meal.duration}min'),

                  _row(Icons.work, meal.complexity.toString().split('.').last),

                  _row(
                    Icons.attach_money,
                    meal.affordability.toString().split('.').last,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
