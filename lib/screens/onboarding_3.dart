import 'package:flutter/material.dart';
import 'package:app/shared/theme.dart';
class Onboarding_3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          Image.asset(
            'assets/images/Un3.png',
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
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'ACTION IS THE',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 22,
                        fontFamily: 'Roboto',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'KEY TO ALL SUCCESS',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 22,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton( 
                      onPressed: () {
                        // Handle button press
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                      ),
                      child: const Text('Start Now',
                      style: TextStyle(
                        color: textColor,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                      ),),
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
