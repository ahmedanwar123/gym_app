import 'dart:convert';
import 'package:app/shared/theme.dart';
import 'package:flutter/material.dart';

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
    // Read the contents of the "feedback.txt" file
    String data = await DefaultAssetBundle.of(context)
        .loadString('assets/txt/feedback.txt');

    // Parse the JSON data into instances of the feedback class
    List<dynamic> jsonData = json.decode(data);
    feedbackItems =
        jsonData.map((item) => FeedbackItem.fromJson(item)).toList();

    setState(() {}); // Update the UI after loading data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cycles Feedback",
          style: TextStyle(
            color: inversetextColor,
            fontSize: 40,
            wordSpacing: 2.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: bgColor,
      body: feedbackItems
              .isNotEmpty // Check if feedbackItems is not empty before accessing it
          ? ListView.builder(
              itemCount: feedbackItems.length,
              itemBuilder: (context, index) {
                final feedbackItem = feedbackItems[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        feedbackItem.cycle,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Form & Technique: ${feedbackItem.feedback['Form & Technique'] == 1 ? "Met" : "Unmet"}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Stability: ${feedbackItem.feedback['Stability'] == 1 ? "Met" : "Unmet"}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Motion & Control: ${feedbackItem.feedback['Motion & Control'] == 1 ? "Met" : "Unmet"}',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            )
          : Center(
              child:
                  CircularProgressIndicator(), // Show loading indicator until data is loaded
            ),
    );
  }
}
