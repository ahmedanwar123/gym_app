import 'package:app/screens/onboarding_2.dart';
import 'package:app/screens/onboarding_3.dart';
import 'package:flutter/material.dart';
import 'package:app/shared/theme.dart';
// Import Screen_3

class Onboarding_1 extends StatelessWidget {
  const Onboarding_1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          Scaffold(
            backgroundColor: bgColor,
            body: Stack(
              children: [
                Image.asset(
                  'assets/images/Un1.png',
                  fit: BoxFit.cover, // Cover the entire screen
                  width: MediaQuery.of(context)
                      .size
                      .width, // Set width to screen width
                  height: MediaQuery.of(context)
                      .size
                      .height, // Set height to screen height
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: MediaQuery.of(context).size.height *
                      0.2, // Adjust this value to move the text higher
                  child: const Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'WITH YOUR AI COACH,',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 22,
                              fontFamily: 'Roboto',
                            ),
                            textAlign: TextAlign.center, // Justify the text
                          ),
                          SizedBox(
                              height:
                                  8), // Add some space between the two lines
                          Text(
                            'START YOUR JOURNEY',
                            style: TextStyle(
                              color: textColor,
                              fontSize: 22,
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.bold, // Make the text bold
                            ),
                            textAlign: TextAlign.center, // Justify the text
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Onboarding_2(),
          Onboarding_3(),
        ],
      ),
    );
  }
}
