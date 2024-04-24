import 'package:flutter/material.dart';
import 'package:app/shared/theme.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'Onboarding_2.dart';
import 'Onboarding_3.dart';

class Onboarding_1 extends StatefulWidget {
  const Onboarding_1({Key? key}) : super(key: key);

  @override
  _Onboarding_1State createState() => _Onboarding_1State();
}

class _Onboarding_1State extends State<Onboarding_1> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              Scaffold(
                backgroundColor: bgColor,
                body: Stack(
                  children: [
                    Image.asset(
                      'assets/images/Un1.png',
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
                                'WITH YOUR AI COACH,',
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: 22,
                                  fontFamily: 'Roboto',
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 8),
                              const Text(
                                'START YOUR JOURNEY',
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
              ),
              Onboarding_2(),
              Onboarding_3(),
            ],
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 20.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Center(
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3, // Adjust count according to the number of pages
                  effect: ExpandingDotsEffect(
                    dotHeight: 12, // Adjust the height of the dots
                    dotWidth: 24, // Adjust the width of the dots
                    dotColor: unswippedpagecolor, // Set color for unswiped dots
                    activeDotColor: swippedpagecolor, // Set color for swiped dot
                    expansionFactor: 2, // Adjust the expansion factor for the active dot
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
