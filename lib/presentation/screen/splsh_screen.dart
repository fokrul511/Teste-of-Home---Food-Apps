import 'package:flutter/material.dart';
import 'package:food_maker_apps/presentation/screen/home_screen.dart';

class SpalshScreen extends StatefulWidget {
  const SpalshScreen({super.key});

  @override
  State<SpalshScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SpalshScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2)).then((value) => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FoodListScreen(),)));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Image(
          image: AssetImage('assets/back.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
