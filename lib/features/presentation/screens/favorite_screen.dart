import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/features/data/models/meal.dart';
import 'package:meals_app/features/presentation/widgets/meal_item.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen(this.meal);
  static const id = '/favorite-meal';
  final List<Meal> meal;


  @override
  Widget build(BuildContext context) {
    if (meal.isEmpty) {
      return Center(
        child: Text('There\'s no Favorites yet- try adding some! '),
      );
    } else {
      return ListView.builder(
        itemCount: meal.length,
        itemBuilder: (context, index) {
          var meals = meal[index];
          return Card(
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
                        imageUrl: meals.imageUrl,
                        placeholder:
                            (context, url) =>
                                Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        width: 220,
                        color: Colors.black54,
                        child: Text(
                          meals.title,
                          style: TextStyle(fontSize: 26, color: Colors.white),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ),

                    Positioned(
                      left: 9,
                      top: 9,
                      child: Icon(Icons.favorite, color: Colors.red),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      );
    }
  }
}
