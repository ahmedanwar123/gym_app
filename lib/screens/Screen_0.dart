import 'package:flutter/material.dart';
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 28, 28, 30),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Screen_1()),
            );
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/Icon Logo.png',
                width: 150,
                height: 150,
              ),
              const SizedBox (height: 20),
              const Text(
                'WORKOUT FORM',
                style: TextStyle(
                  color: Color.fromARGB(255,241,153,45),
                  fontSize: 26,
                  fontWeight: FontWeight.bold
                ),
              ),
              const SizedBox (height: 20),
              const Text(
                'ASSESSMENT',
                style: TextStyle(
                  color: Color.fromARGB(255,241,153,45),
                  fontSize: 26,
                  fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
