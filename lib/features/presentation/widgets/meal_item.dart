import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/core/constants/app_strings.dart';
import 'package:meals_app/dummy_meals.dart';
import 'package:meals_app/features/data/models/meal.dart';
import 'package:meals_app/features/presentation/screens/meal_details_screen.dart';
import 'package:meals_app/viewmodel.dart';
import 'package:provider/provider.dart';

class MealItem extends StatefulWidget {
  MealItem({
    super.key,
 
    required this.meal,
    required this.removeItem,
    this.favMeal = const [],

  });

  final Meal meal;
  List<Meal> favMeal;
  final Function(String) removeItem;

  @override
  State<MealItem> createState() => _MealItemState();
}

class _MealItemState extends State<MealItem> {
  var _isFav = false;

  // bool _isFavorite(Meal mmeal) {
  //   return widget.favMeal.any((meal) => meal == mmeal);
  // }

  // void toggleFavorite(Meal meal) {
  //   if (widget.favMeal.contains(meal)) {
  //     widget.favMeal.remove(meal);
  //   } else {
  //     widget.favMeal.add(meal);
  //   }
  // }

  void selectMeal(BuildContext context) async {
    final result = await Navigator.of(
      context,
    ).pushNamed(AppStrings.kMealDetailsScreen, arguments: widget.meal.id);

    if (result != null) widget.removeItem(result as String);
  }

  Widget _row(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: 6),
        text.length > 10 ? Text(text, overflow: TextOverflow.fade) : Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealsVM = context.watch<MealsViewModel>();
    final isFav = mealsVM.isFavorite;
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
                    imageUrl: widget.meal.imageUrl,
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
                    padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    width: 220,
                    color: Colors.black54,
                    child: Text(
                      widget.meal.title,
                      style: TextStyle(fontSize: 26, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
                Positioned(
                  child: IconButton(
                    onPressed: () {
                      mealsVM.toggleFavorite(widget.meal);
                      setState(() {
                        _isFav = !_isFav;
                      });
                    },
                    icon:
                        isFav(widget.meal)
                            ? Icon(Icons.favorite, color: Colors.red)
                            : Icon(Icons.favorite),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _row(Icons.schedule, '${widget.meal.duration}min'),

                  _row(
                    Icons.work,
                    widget.meal.complexity.toString().split('.').last,
                  ),

                  _row(
                    Icons.attach_money,
                    widget.meal.affordability.toString().split('.').last,
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
