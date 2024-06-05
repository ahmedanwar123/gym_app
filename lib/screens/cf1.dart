import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:app/shared/theme.dart';

// Define a class to represent the feedback structure
class FeedbackItem {
  final String cycle;
  final Map<String, int> feedback;

  FeedbackItem({required this.cycle, required this.feedback});

  factory FeedbackItem.fromJson(Map<String, dynamic> json) {
    return FeedbackItem(
      cycle: json['cycle'],
      feedback: Map<String, int>.from(json['feedback']),
    );
  }
}

class CF1 extends StatefulWidget {
  const CF1({Key? key,required this.Workoutlevel, required this.exerciseName}) : super(key: key);
  final String Workoutlevel;
  final String exerciseName;
  @override
  State<CF1> createState() => _CyclesFeedbackState();
}

class _CyclesFeedbackState extends State<CF1> {
  late List<FeedbackItem> feedbackItems = []; // Initialize with an empty list

  @override
  void initState() {
    super.initState();
    _loadFeedbackData();
  }

   String _file(String Workoutlevel, String exerciseName) {
    String feedbackfile = '';

    if (Workoutlevel == 'Beginner' && exerciseName == 'bicep') {
      feedbackfile = 'assets/txt/222.txt';
    } else if (Workoutlevel == 'Intermediate' && exerciseName == 'bicep') {
      feedbackfile = 'assets/txt/02132.txt';
    } else if (Workoutlevel == 'Advanced' && exerciseName == 'bicep') {
      feedbackfile = 'assets/txt/333333.txt';
    } else if (Workoutlevel == 'Beginner' && exerciseName == 'lateral_raise') {
      feedbackfile = 'assets/txt/111222.txt';
    } else if (Workoutlevel == 'Intermediate' && exerciseName == 'lateral_raise') {
      feedbackfile = 'assets/txt/3210.txt';
    } else if (Workoutlevel == 'Advanced' && exerciseName == 'lateral_raise') {
      feedbackfile = 'assets/txt/00000000.txt';
    }
    return feedbackfile;
  }


  Future<void> _loadFeedbackData() async {
    try {
      // Read data from the file
      String data = await rootBundle.loadString(_file(widget.Workoutlevel, widget.exerciseName));

      // Parse the JSON data
      List<dynamic> jsonData = json.decode(data);
      feedbackItems =
          jsonData.map((item) => FeedbackItem.fromJson(item)).toList();

      setState(() {}); // Update the UI after loading data
    } catch (error) {
      // If an error occurs during the request, print the error message
      print('Error loading feedback data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: bgColor,
        title: Text(
          "Cycles Feedback",
          style: TextStyle(
            color: SectextColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      backgroundColor: bgColor,
      body: feedbackItems.isNotEmpty
          ? Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: feedbackItems.length,
              itemBuilder: (context, index) {
                final feedbackItem = feedbackItems[index];
                // Calculate the number of criteria met
                int criteriaMet = feedbackItem.feedback.values
                    .where((value) => value == 1)
                    .length;
                // Determine the overall feedback message
                String overallFeedback =
                    'Wrong cycle'; // Default message
                if (criteriaMet == 0) {
                  overallFeedback = 'Wrong cycle';
                } else if (criteriaMet == 2) {
                  overallFeedback = 'Almost Correct cycle';
                } else if (criteriaMet == 1) {
                  overallFeedback = 'Cycle needs improvement';
                } else {
                  overallFeedback = 'Correct cycle';
                }
                return Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: borderColor,
                      width: 3, // Set border thickness
                    ),
                    borderRadius: BorderRadius.circular(20), // Set border radius
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Cycle: ${feedbackItem.cycle}',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Form & Technique: ${feedbackItem.feedback['Form & Technique'] == 1 ? "Met" : "Unmet"}',
                        style: TextStyle(color: textColor,fontSize: 16),
                      ),
                      Text(
                        'Stability: ${feedbackItem.feedback['Stability'] == 1 ? "Met" : "Unmet"}',
                        style: TextStyle(color: textColor,fontSize: 16),
                      ),
                      Text(
                        'Motion & Control: ${feedbackItem.feedback['Motion & Control'] == 1 ? "Met" : "Unmet"}',
                        style: TextStyle(color: textColor,fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Overall Feedback: ',
                              style: TextStyle(color: textColor, fontSize: 16),
                            ),
                            TextSpan(
                              text: overallFeedback,
                              style: TextStyle(fontWeight:FontWeight.bold,color: SectextColor, fontSize: 16),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
              ),
              child: Text('Return to Overall Feedback',style: TextStyle(
                color: inversetextColor,
                fontSize: 20,
                fontFamily: 'Roboto',
              ),),
            ),
          ),
        ],
      )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
