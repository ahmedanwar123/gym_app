import 'package:flutter/material.dart';
import 'package:app/widgets/expandableBox_Widget.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final String imagePath = 'assets/images/Image-1.png';

  final List<String> exerciseFeedback = [
    'Item A Feedback',
    'Item B Feedback',
    'Item C Feedback'
  ];
  final List<bool> _isExpanded =
      List.generate(3, (_) => false); // Track expansion state for each box

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Feedback'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 2 / 5,
              width: MediaQuery.of(context).size.width * 19 / 20,
              child: Center(
                child: Image.asset(imagePath),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 1 / 2.05,
              child: Column(
                children: [
                  const Text('Exercise Feedback'),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: exerciseFeedback.length,
                    itemBuilder: (context, index) {
                      return ExpandableBox(
                        label: exerciseFeedback[index],
                        isExpanded: _isExpanded[index],
                        feedback: exerciseFeedback[index],
                        onToggle: () => setState(() {
                          _isExpanded[index] = !_isExpanded[index];
                        }),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
