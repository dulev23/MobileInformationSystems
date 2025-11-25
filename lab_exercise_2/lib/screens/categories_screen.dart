import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/category.dart';
import '../widgets/category_card.dart';
import 'meals_screen.dart';
import 'meal_detail_screen.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final ApiService apiService = ApiService();
  List<Category> categories = [];
  List<Category> filteredCategories = [];

  @override
  void initState() {
    super.initState();
    fetchCategories();
  }

  void fetchCategories() async {
    categories = await apiService.getCategories();
    setState(() {
      filteredCategories = categories;
    });
  }

  void searchCategory(String query) {
    final results = categories
        .where((cat) => cat.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {
      filteredCategories = results;
    });
  }

  void showRandomMeal() async {
    final mealDetail = await apiService.getRandomMeal();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MealDetailScreen(mealId: mealDetail.id),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text('Categories'),
            SizedBox(width: 10),
            IconButton(
              icon: Icon(Icons.casino),
              onPressed: showRandomMeal,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(labelText: 'Search Category'),
              onChanged: searchCategory,
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: filteredCategories.length,
              itemBuilder: (context, index) {
                final category = filteredCategories[index];
                return CategoryCard(
                  category: category,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MealsScreen(category: category.name),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
