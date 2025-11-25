class Meal {
  final String id;
  final String name;
  final String thumbnail;

  Meal({required this.id, required this.name, required this.thumbnail});

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['idMeal'],
      name: json['strMeal'],
      thumbnail: json['strMealThumb'],
    );
  }
}

class MealDetail {
  final String id;
  final String name;
  final String instructions;
  final String thumbnail;
  final String youtube;
  final List<Map<String, String>> ingredients;

  MealDetail({
    required this.id,
    required this.name,
    required this.instructions,
    required this.thumbnail,
    required this.youtube,
    required this.ingredients,
  });

  factory MealDetail.fromJson(Map<String, dynamic> json) {
    List<Map<String, String>> ingredients = [];
    for (int i = 1; i <= 20; i++) {
      final ingredient = json['strIngredient$i'];
      final measure = json['strMeasure$i'];
      if (ingredient != null && ingredient.isNotEmpty) {
        ingredients.add({'ingredient': ingredient, 'measure': measure});
      }
    }

    return MealDetail(
      id: json['idMeal'],
      name: json['strMeal'],
      instructions: json['strInstructions'],
      thumbnail: json['strMealThumb'],
      youtube: json['strYoutube'] ?? '',
      ingredients: ingredients,
    );
  }
}
