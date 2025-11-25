import 'package:flutter/material.dart';
import '../services/api_service.dart';
import '../models/meal.dart';
import 'package:url_launcher/url_launcher.dart';

class MealDetailScreen extends StatefulWidget {
  final String mealId;

  const MealDetailScreen({required this.mealId});

  @override
  _MealDetailScreenState createState() => _MealDetailScreenState();
}

class _MealDetailScreenState extends State<MealDetailScreen> {
  final ApiService apiService = ApiService();
  MealDetail? mealDetail;

  @override
  void initState() {
    super.initState();
    fetchMealDetail();
  }

  void fetchMealDetail() async {
    mealDetail = await apiService.getMealDetail(widget.mealId);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (mealDetail == null) {
      return Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(title: Text(mealDetail!.name)),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Image.network(mealDetail!.thumbnail),
            SizedBox(height: 8),
            Text(
              mealDetail!.name,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(mealDetail!.instructions),
            SizedBox(height: 16),
            Text('Ingredients:', style: TextStyle(fontWeight: FontWeight.bold)),
            ...mealDetail!.ingredients.map(
              (ing) => Text('${ing['ingredient']}: ${ing['measure']}'),
            ),
            SizedBox(height: 16),
            if (mealDetail!.youtube.isNotEmpty)
              ElevatedButton(
                child: Text('Watch on YouTube'),
                onPressed: () async {
                  final url = Uri.parse(mealDetail!.youtube);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                },
              ),
          ],
        ),
      ),
    );
  }
}
