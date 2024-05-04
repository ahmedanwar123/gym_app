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
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 1000), // Adjust duration as needed
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.easeInOutQuart;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
          pageBuilder: (context, animation, secondaryAnimation) => Onboarding_1(),
        ),
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
