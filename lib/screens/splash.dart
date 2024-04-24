import 'dart:async';

import 'package:app/screens/onboarding_1.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/theme.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    // Add a delay of 2 seconds before navigating to the next screen
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Onboarding_1()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/logos/Icon Logo.png',
              width: 150,
              height: 150,
            ),
            SizedBox(height: 20),
            Text(
              'WORKOUT FORM',
              style: TextStyle(
                color: titleColor,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            SizedBox(height: 20),
            Text(
              'ASSESSMENT',
              style: TextStyle(
                color: titleColor,
                fontSize: 26,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
