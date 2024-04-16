  import 'package:flutter/material.dart';

  class MyHome extends StatefulWidget {
    const MyHome({super.key});

    @override
    State<MyHome> createState() => _MyHomeState();
  }

  class _MyHomeState extends State<MyHome> {
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Workout AI"),
        ),
        body: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/logos/fawry.png"),
                SizedBox(
                  height: 20,
                ),
                Text("Welcome to my application")
              ],
            ),
          ),
        ),
      );
    }
  }
