import 'package:app/shared/theme.dart';
import 'package:flutter/material.dart';

class ExpandableBox extends StatefulWidget {
  final String label;
  final bool isExpanded;
  final VoidCallback onToggle;
  final String feedback;
  final Color? feedbackBackgroundColor;

  const ExpandableBox({
    Key? key,
    required this.label,
    required this.isExpanded,
    required this.onToggle,
    required this.feedback,
    this.feedbackBackgroundColor,
  }) : super(key: key);

  @override
  State<ExpandableBox> createState() => _ExpandableBoxState();
}

class _ExpandableBoxState extends State<ExpandableBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onToggle,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 3, // Set border thickness
          ),
          borderRadius: BorderRadius.circular(20), // Set border radius
        ),
        padding: const EdgeInsets.all(16), // Set padding for the box
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.label,
                    style: const TextStyle(
                      color: Colors.white, // Set text color to white
                      fontSize: 20, // Set font size for label
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      widget.isExpanded ? Icons.expand_less : Icons.expand_more,
                      color: Colors.white,
                    ),
                    onPressed: widget.onToggle,
                  ),
                ],
              ),
            ),
            if (widget.isExpanded)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Container(
                  color: widget
                      .feedbackBackgroundColor, // Set feedback background color
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    widget.feedback, // Display feedback text when expanded
                    style: const TextStyle(
                      color: Colors.white, // Set text color to white
                      fontSize: 16, // Set font size for feedback
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
