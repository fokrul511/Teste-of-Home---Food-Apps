import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food_maker_apps/presentation/model/data.dart';
import 'package:food_maker_apps/presentation/screen/food_ditails_screen.dart';
import 'package:food_maker_apps/presentation/widgets/cart_view.dart';
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

  bool isLoding = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              const PopupMenuItem(
                child: Text('Setting'),
              ),const PopupMenuItem(
                child: Text('Copy Link'),
              ),const PopupMenuItem(
                child: Text('Shere'),
              ), const PopupMenuItem(
                child: Text('Developer Info'),
              ),
            ],
          )
        ],
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            Text(' Test of Home'),
          ],
        ),
      ),
      body: Visibility(
        visible: isLoding == false,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: GridView.builder(
          itemCount: foodList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
            childAspectRatio: 3 / 2,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FoodDitailsScreen(foodList[index]),
                  ),
                );
              },
              child: RecipeCart(
                title: foodList[index].name,
                thumbnailUrl: foodList[index].image,
                cookTime: foodList[index].cookTimeMinutes.toString(),
                rating: foodList[index].rating.toString(),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> getApi() async {
    isLoding = true;
    setState(() {});
    Uri url = Uri.parse('https://dummyjson.com/recipes?limit=50');
    Response response = await get(url);

    if (response.statusCode == 200) {
      var responBody = jsonDecode(response.body);
      var list = responBody['recipes'];

      for (var item in list) {
        Recipes recipes = Recipes.fromJson(item);
        foodList.add(recipes);
        isLoding = false;
        setState(() {});
      }
      setState(() {});
    }
  }
}
