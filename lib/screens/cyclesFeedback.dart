import 'dart:convert';
import 'package:app/widgets/videos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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

class CyclesFeedback extends StatefulWidget {
  const CyclesFeedback({Key? key}) : super(key: key);
  final ip ='http://localhost:3000/video-processing';// change the ip address
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
      var response = await http.get(Uri.parse(ip));

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        feedbackItems = jsonData.map((item) => FeedbackItem.fromJson(item)).toList();
        setState(() {}); // Update the UI after loading data
      } else {
        print('Failed to load feedback data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error loading feedback data: $error');
    }
  }

  String _determineOverallFeedback(int criteriaMet) {
    if (criteriaMet == 3) {
      return 'Correct cycle';
    } else if (criteriaMet == 2) {
      return 'Almost Correct cycle';
    } else if (criteriaMet == 1) {
      return 'Cycle needs improvement';
    } else {
      return 'Wrong cycle';
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
                int criteriaMet = feedbackItem.feedback.values.where((value) => value == 1).length;
                String overallFeedback = _determineOverallFeedback(criteriaMet);

                return Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: borderColor, width: 3),
                    borderRadius: BorderRadius.circular(20),
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
                        style: TextStyle(color: textColor, fontSize: 16),
                      ),
                      Text(
                        'Stability: ${feedbackItem.feedback['Stability'] == 1 ? "Met" : "Unmet"}',
                        style: TextStyle(color: textColor, fontSize: 16),
                      ),
                      Text(
                        'Motion & Control: ${feedbackItem.feedback['Motion & Control'] == 1 ? "Met" : "Unmet"}',
                        style: TextStyle(color: textColor, fontSize: 16),
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
                              style: TextStyle(fontWeight: FontWeight.bold, color: SectextColor, fontSize: 16),
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
              child: Text(
                'Return to Overall Feedback',
                style: TextStyle(
                  color: inversetextColor,
                  fontSize: 20,
                  fontFamily: 'Roboto',
                ),
              ),
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
