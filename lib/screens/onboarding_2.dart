import 'package:flutter/material.dart';
import 'package:app/shared/theme.dart';

class Onboarding_2 extends StatelessWidget {
  const Onboarding_2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Un2.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'CREATE A WORKOUT PLAN',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 22,
                        fontFamily: 'Roboto',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    const Text(
                      'TO STAY FIT',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 22,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
