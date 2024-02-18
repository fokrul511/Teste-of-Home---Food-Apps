import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_maker_apps/presentation/model/data.dart';
import 'package:http/http.dart';

class FoodListScreen extends StatefulWidget {
  const FoodListScreen({super.key});

  @override
  State<FoodListScreen> createState() => _FoodListScreenState();
}

List<Recipes> foodList = [];

class _FoodListScreenState extends State<FoodListScreen> {
  @override
  void initState() {
    super.initState();
    getApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        itemCount: foodList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
          childAspectRatio: 3 / 4,
        ),
        itemBuilder: (context, index) {
          return Card(
            child: Center(
              child: Text(foodList[index].id.toString()),
            ),
          );
        },
      ),
    );
  }

  Future<void> getApi() async {
    Uri url = Uri.parse('https://dummyjson.com/recipes?limit=50');
    Response response = await get(url);

    if (response.statusCode == 200) {
      var responBody = jsonDecode(response.body);
      var list = responBody['recipes'];

      for (var item in list) {
        Recipes recipes = Recipes.fromJson(item);
        foodList.add(recipes);
      }
      setState(() {});
    }
  }
}
