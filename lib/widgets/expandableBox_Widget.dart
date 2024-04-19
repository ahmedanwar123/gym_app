import 'package:flutter/material.dart';

class ExpandableBox extends StatefulWidget {
  final String label;
  final bool isExpanded;
  final VoidCallback onToggle;
  final String feedback; // New property to hold feedback text

  const ExpandableBox({
    Key? key,
    required this.label,
    required this.isExpanded,
    required this.onToggle,
    required this.feedback, // Pass feedback text
  }) : super(key: key);

  @override
  State<ExpandableBox> createState() => _ExpandableBoxState();
}

class _ExpandableBoxState extends State<ExpandableBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onToggle,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(widget.label),
              IconButton(
                icon: Icon(
                  widget.isExpanded ? Icons.expand_less : Icons.expand_more,
                ),
                onPressed: widget.onToggle,
              ),
            ],
          ),
          if (widget.isExpanded)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                widget.feedback, // Display feedback text when expanded
              ),
            ),
        ],
      ),
    );
  }
}
