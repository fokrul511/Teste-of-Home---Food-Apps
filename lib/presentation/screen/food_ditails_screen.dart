import 'package:flutter/material.dart';
import 'package:food_maker_apps/presentation/model/data.dart';
import 'package:food_maker_apps/presentation/widgets/widget.dart';

class FoodDitailsScreen extends StatefulWidget {
  Recipes recipes;

  FoodDitailsScreen(this.recipes, {super.key});

  @override
  State<FoodDitailsScreen> createState() => _FoodDitailsScreenState();
}

class _FoodDitailsScreenState extends State<FoodDitailsScreen> {
  List ingirdentList = [];
  List instructionsList = [];
  bool isLoding = false;

  ingrident() {
    for (int i = 0; i < widget.recipes.ingredients!.length; i++) {
      ingirdentList.add(widget.recipes.ingredients![i]);
    }
  }

  instructions() {
    for (int i = 0; i < widget.recipes.instructions!.length; i++) {
      instructionsList.add(widget.recipes.instructions![i]);
    }
  }

  @override
  void initState() {
    super.initState();
    ingrident();
    instructions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.recipes.name ?? ""),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: NetworkImage(widget.recipes.image ?? "")),
            const SizedBox(height: 10),
            texts(
              title: 'Rating',
              text: widget.recipes.rating.toString(),
              icon: Icons.star,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                texts(
                  title: 'Prep Time:',
                  icon: Icons.schedule,
                  text: "${widget.recipes.prepTimeMinutes.toString()} min",
                ),
                texts(
                  title: 'Cook Time:',
                  icon: Icons.schedule,
                  text: "${widget.recipes.cookTimeMinutes.toString()} min",
                )
              ],
            ),
            const Divider(
              thickness: 1,
            ),
            Wrap(
              children: [
                texts(
                  title: 'Servings:',
                  icon: Icons.people_outline,
                  text: widget.recipes.servings.toString(),
                ),
                texts(
                  title: 'Calories Per Serving:',
                  icon: Icons.fastfood_rounded,
                  text: widget.recipes.caloriesPerServing.toString(),
                ),
                texts(
                  title: 'Cuisine Country:',
                  icon: Icons.restaurant,
                  text: widget.recipes.cuisine.toString(),
                ),
                const Divider(
                  thickness: 1,
                ),
                texts(
                  title: 'Difficulty:',
                  icon: Icons.restaurant_menu_sharp,
                  text: widget.recipes.difficulty.toString(),
                ),
                texts(
                  title: 'Meal Type:',
                  icon: Icons.set_meal_rounded,
                  text: widget.recipes.mealType.toString(),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Ingredients:",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: 10),
            ingrdentItems(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Instructions:",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
              ),
            ),
            const Divider(),
            instructionitems(),
          ],
        ),
      ),
    );
  }

  Widget instructionitems() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 350,
        width: double.infinity,
        child: ListView.builder(
          itemCount: instructionsList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Text(
                "${index + 1}. ${instructionsList[index]}",
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget ingrdentItems() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 300,
        width: 300,
        child: ListView.builder(
          itemCount: ingirdentList.length,
          itemBuilder: (context, index) {
            return Text(
              "${index + 1}. ${ingirdentList[index]}",
              style: const TextStyle(
                fontSize: 20,
              ),
            );
          },
        ),
      ),
    );
  }
}
