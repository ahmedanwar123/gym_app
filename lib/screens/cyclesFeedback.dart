import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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

class CyclesFeedback extends StatefulWidget {
  const CyclesFeedback({Key? key}) : super(key: key);

  @override
  State<CyclesFeedback> createState() => _CyclesFeedbackState();
}

class _CyclesFeedbackState extends State<CyclesFeedback> {
  late List<FeedbackItem> feedbackItems = []; // Initialize with an empty list

  @override
  void initState() {
    super.initState();
    _loadFeedbackData();
  }

  Future<void> _loadFeedbackData() async {
    try {
      // Make a GET request to the local server
      var response =
          await http.get(Uri.parse('http://localhost:3000/video-processing'));

      if (response.statusCode == 200) {
        // If the request is successful, parse the JSON data
        List<dynamic> jsonData = json.decode(response.body);
        feedbackItems =
            jsonData.map((item) => FeedbackItem.fromJson(item)).toList();

        setState(() {}); // Update the UI after loading data
      } else {
        // If the request fails, print the error message
        print('Failed to load feedback data: ${response.statusCode}');
      }
    } catch (error) {
      // If an error occurs during the request, print the error message
      print('Error loading feedback data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cycles Feedback",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: feedbackItems
              .isNotEmpty // Check if feedbackItems is not empty before accessing it
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
                      String overallFeedback = 'Wrong cycle'; // Default message
                      if (criteriaMet == 3) {
                        overallFeedback = 'Correct cycle';
                      } else if (criteriaMet == 2) {
                        overallFeedback = 'Almost Correct cycle';
                      } else if (criteriaMet == 1) {
                        overallFeedback = 'Cycle needs improvement';
                      }
                      return Container(
                        margin: EdgeInsets.all(8),
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Cycle: ${feedbackItem.cycle}',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Form & Technique: ${feedbackItem.feedback['Form & Technique'] == 1 ? "Met" : "Unmet"}',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Stability: ${feedbackItem.feedback['Stability'] == 1 ? "Met" : "Unmet"}',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              'Motion & Control: ${feedbackItem.feedback['Motion & Control'] == 1 ? "Met" : "Unmet"}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 8),
                            Text(
                              'Overall Feedback: $overallFeedback',
                              style: TextStyle(fontSize: 16),
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
                    child: Text('Return to Feedback'),
                  ),
                ),
              ],
            )
          : Center(
              child:
                  CircularProgressIndicator(), // Show loading indicator until data is loaded
            ),
    );
  }
}
