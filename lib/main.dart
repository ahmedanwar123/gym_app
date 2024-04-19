import 'package:flutter/material.dart';
//import 'package:app/screens/home_screen.dart';
import 'package:app/screens/feedback_screen.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "demo",
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true),
      home: const FeedbackScreen(), //change this to your page class to test
    );
  }
}
