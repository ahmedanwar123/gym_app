import 'package:flutter/material.dart';
import 'package:app/widgets/expandableBox_Widget.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final String imagePath = 'assets/images/Image-1.png';

  // Define a list with three feedback items
  final List<String> exerciseFeedback = [
    'Item A Feedback',
    'Item B Feedback',
    'Item C Feedback'
  ];

  bool _isExpanded1 = false; // Track expansion state for the first box
  bool _isExpanded2 = false; // Track expansion state for the second box
  bool _isExpanded3 = false; // Track expansion state for the third box

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Feedback'),
        ),
        body: SingleChildScrollView(
          // Wrap the Column with SingleChildScrollView
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 2 / 5,
                width: MediaQuery.of(context).size.width * 19 / 20,
                child: Center(
                  child: Image.asset(imagePath),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    1 /
                    6, // Change the height for the first item
                child: Column(
                  children: [
                    const Text('Exercise Feedback'),
                    ExpandableBox(
                      label:
                          exerciseFeedback[0], // Use the first item in the list
                      isExpanded: _isExpanded1,
                      feedback: "Feedback for item A",
                      onToggle: () => setState(() {
                        _isExpanded1 = !_isExpanded1;
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    1 /
                    6, // Change the height for the second item
                child: Column(
                  children: [
                    const Text('Exercise Feedback'),
                    ExpandableBox(
                      label: exerciseFeedback[
                          1], // Use the second item in the list
                      isExpanded: _isExpanded2,
                      feedback: "Feedback for item B",
                      onToggle: () => setState(() {
                        _isExpanded2 = !_isExpanded2;
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height *
                    1 /
                    5.5, // Change the height for the third item
                child: Column(
                  children: [
                    const Text('Exercise Feedback'),
                    ExpandableBox(
                      label:
                          exerciseFeedback[2], // Use the third item in the list
                      isExpanded: _isExpanded3,
                      feedback: "Feedback for item C",
                      onToggle: () => setState(() {
                        _isExpanded3 = !_isExpanded3;
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
