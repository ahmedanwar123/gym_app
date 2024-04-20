import 'package:flutter/material.dart';
import 'package:app/widgets/expandableBox_Widget.dart';
import 'package:app/shared/theme.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final String imagePath = 'assets/images/Image-1.png';

  // Define a list with three feedback items
  final List<String> exerciseFeedback = [
    '1. Form & Technique',
    '2. Stability',
    '3. Motion & Control'
  ];

  bool _isExpanded1 = false;
  bool _isExpanded2 = false;
  bool _isExpanded3 = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: bgColor, // Set background color to black
        body: Material(
          color: bgColor, // Set background color to black
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset(
                      imagePath,
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 2 / 7,
                    ),
                    const Positioned(
                      top: 200,
                      left: 20,
                      // Adjust the position of the text vertically
                      child: Text(
                        'Dumbbell Biceps Curl',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: _isExpanded1
                      ? MediaQuery.of(context).size.height * 1.2 / 6
                      : MediaQuery.of(context).size.height * 0.63 / 6,
                  child: ExpandableBox(
                    label: exerciseFeedback[0],
                    isExpanded: _isExpanded1,
                    feedback: "",
                    onToggle: () => setState(() {
                      _isExpanded1 = !_isExpanded1;
                    }),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 50,
                ),
                SizedBox(
                  height: _isExpanded2
                      ? MediaQuery.of(context).size.height * 1.2 / 6
                      : MediaQuery.of(context).size.height * 0.63 / 6,
                  child: ExpandableBox(
                    label: exerciseFeedback[1],
                    isExpanded: _isExpanded2,
                    feedback: "Feedback for item B",
                    onToggle: () => setState(() {
                      _isExpanded2 = !_isExpanded2;
                    }),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 1 / 50,
                ),
                SizedBox(
                  height: _isExpanded3
                      ? MediaQuery.of(context).size.height * 1.2 / 6
                      : MediaQuery.of(context).size.height * 0.63 / 6,
                  child: ExpandableBox(
                    label: exerciseFeedback[2],
                    isExpanded: _isExpanded3,
                    feedback: "Feedback for item C",
                    onToggle: () => setState(() {
                      _isExpanded3 = !_isExpanded3;
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
