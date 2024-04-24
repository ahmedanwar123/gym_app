import 'package:flutter/material.dart';
import 'package:app/shared/theme.dart';
import 'package:app/screens/workout_categories_page.dart';

class Onboarding_3 extends StatelessWidget {
  const Onboarding_3({Key? key}) : super(key: key);

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
            bottom: MediaQuery.of(context).size.height * 0.1,
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
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => WorkoutCategories()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        SizedBox(width: 8),
                        Text(
                          'Start Now',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: 'Roboto',
                          ),
                        ),
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 25.0,),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
