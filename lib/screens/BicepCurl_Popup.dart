import 'package:flutter/material.dart';
import 'workout_categories_page.dart';
import 'LateralRaise_Popup.dart';
import 'package:app/shared/theme.dart';


class BicepCurl_Popup extends StatelessWidget {
  const BicepCurl_Popup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate back when background is tapped
        Navigator.pop(context);
      },
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/Popup_BG.png',
              fit: BoxFit.cover,
            ),
            Center(
              child: Container(
                height: 400,
                width: 325,
                decoration: BoxDecoration(
                  color: Colors.grey[800]?.withOpacity(0.8), // Adding opacity to make the background semi-transparent
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Stack(
                        children: [
                          Image.asset(
                            'assets/images/WorkoutCategories_BicepsCurl.png',
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          Positioned(
                            bottom: 20.0,
                            left: 20.0,
                            child: Text(
                              'Dumbbell Biceps Curl',
                              style: TextStyle(
                                color: textColor,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                shadows: [
                                  Shadow(
                                    blurRadius: 2.0,
                                    color: Colors.black,
                                    offset: Offset(2.0, 2.0),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton.icon(
                            onPressed: () {

                            },
                            icon: Icon(Icons.play_arrow),
                            label: Text("Live"),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                              backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 12, horizontal: 98)),
                              shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              )),
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {

                            },
                            icon: Icon(Icons.play_arrow),
                            label: Text("Upload"),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
                              backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 12, horizontal: 90)),
                              shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                              )),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Cancel"),
                            style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(textColor),
                              padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.symmetric(vertical: 12, horizontal: 24)),
                              shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}