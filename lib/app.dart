import 'package:flutter/material.dart';
import 'package:food_maker_apps/presentation/screen/home_screen.dart';

class TestOfHome extends StatelessWidget {
  const TestOfHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FoodListScreen(),
    );
  }
}
