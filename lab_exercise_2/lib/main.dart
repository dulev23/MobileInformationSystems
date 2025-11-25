import 'package:flutter/material.dart';
import 'screens/categories_screen.dart';

void main() {
  runApp(MealApp());
}

class MealApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meal Recipes',
      theme: ThemeData(primarySwatch: Colors.orange),
      home: CategoriesScreen(),
    );
  }
}
