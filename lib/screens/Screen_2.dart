import 'package:flutter/material.dart';

class Screen_2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 28, 28, 30),
      body: Stack(
        children: [
          Image.asset(
            'assets/Un2.png',
            fit: BoxFit.cover, // Cover the entire screen
            width: MediaQuery.of(context).size.width, // Set width to screen width
            height: MediaQuery.of(context).size.height, // Set height to screen height
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.2, // Adjust this value to move the text higher
            child: const Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'CREATE A WORKOUT PLAN',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      textAlign: TextAlign.center, // Justify the text
                    ),
                    SizedBox(height: 8), // Add some space between the two lines
                    Text(
                      'TO STAY FIT',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
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
    );
  }
}
