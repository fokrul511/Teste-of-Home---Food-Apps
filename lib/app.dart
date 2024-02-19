import 'package:flutter/material.dart';
import 'package:food_maker_apps/presentation/screen/splsh_screen.dart';

class TestOfHome extends StatelessWidget {
  const TestOfHome({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.pink
        )
      ),
      home: const SpalshScreen(),
    );
  }
}
