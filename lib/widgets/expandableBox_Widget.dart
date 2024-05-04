import 'package:flutter/material.dart';
import 'package:app/shared/theme.dart';

class ExpandableBox extends StatefulWidget {
  final String title;
  final bool isExpanded;
  final VoidCallback onToggle;
  final List<String> feedback; // Modified to accept a list of strings
  final Color? feedbackBackgroundColor;
  final String frontGifPath; // Path of the GIF from the front
  final String sideGifPath;

  const ExpandableBox({
    Key? key,
    required this.title,
    required this.isExpanded,
    required this.onToggle,
    required this.feedback,
    required this.frontGifPath,
    required this.sideGifPath,
    this.feedbackBackgroundColor,
  }) : super(key: key);

  @override
  State<ExpandableBox> createState() => _ExpandableBoxState();
}

class _ExpandableBoxState extends State<ExpandableBox> {
  bool _showFrontPhoto = true; // Track whether to show front or side photo

  // Method to show the GIF dialog
  void _showGifDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: Colors.black,
              title: Text(
                  _showFrontPhoto ? 'Front' : 'Side',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: SectextColor,
                  ),
                  textAlign: TextAlign.center,
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    _showFrontPhoto ? widget.frontGifPath : widget.sideGifPath,
                    height: 200,
                  ),
                ],
              ),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    setState(() {
                      _showFrontPhoto = !_showFrontPhoto;
                    });
                  },
                  child: Text(
                      _showFrontPhoto ? 'Side' : 'Front',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: buttonColor,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                      'Close',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                      color: buttonColor,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Call onToggle callback to handle box expansion/collapse
        widget.onToggle();
        // Also toggle photo when box is tapped
      },
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white, // Set text color to white
                    fontSize: 20, // Set font size
                    fontWeight: FontWeight.bold, // Make the text bold
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        widget.isExpanded ? Icons.expand_less : Icons.expand_more,
                        color: Colors.white,
                      ),
                      onPressed: widget.onToggle,
                    ),
                    IconButton(
                      icon: Icon(Icons.gif,color: Colors.white,size: 35,), // Change to the desired icon
                      onPressed: _showGifDialog, // Call the method to show the AlertDialog
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 4), // Add space between title and feedback
            if (widget.isExpanded)
              Container(
                color: widget.feedbackBackgroundColor, // Set feedback background color
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.feedback.length,
                  itemBuilder: (context, index) {
                    return Text(
                      widget.feedback[index],
                      style: const TextStyle(
                        color: Colors.white, // Set text color to white
                        fontSize: 16, // Set font size for feedback
                      ),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
