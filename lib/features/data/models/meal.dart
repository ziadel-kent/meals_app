enum Complexity { Simple, Challenging, Hard }

enum Affordability { Affordable, Pricey, Luxurious }

class Meal {
  final String id;
  final List<String> ingredients;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final int duration;
  final List<String> steps;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isVegetarian;
  final bool isVegan;
  final bool isLactoseFree;
  const Meal({
    required this.complexity,
    required this.duration,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegetarian,
    required this.isVegan,
    required this.affordability,
    required this.steps,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.ingredients,
    required this.categories,
  });
}
