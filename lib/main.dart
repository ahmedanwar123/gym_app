import 'package:app/screens/onboarding_1.dart';
import 'package:app/screens/splash.dart';
import 'package:app/screens/workout_categories_page.dart';
import 'package:app/screens/cyclesFeedback.dart';
import 'package:flutter/material.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Workout Form Assessment",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: Onboarding_1(), //change this to your page class to test
    );
  }
}
