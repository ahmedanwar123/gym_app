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
  final String exerciseName;

  const ExpandableBox({
    Key? key,
    required this.title,
    required this.isExpanded,
    required this.onToggle,
    required this.feedback,
    required this.frontGifPath,
    required this.sideGifPath,
    this.feedbackBackgroundColor,
    required this.exerciseName,
  }) : super(key: key);

  @override
  State<ExpandableBox> createState() => _ExpandableBoxState();
}

class _ExpandableBoxState extends State<ExpandableBox> {
  bool image( String exerciseName) {
    bool image;

    if ( exerciseName == 'bicep') {
      image = true;
    } else  {
      image = false;
    }
    return image;
  }
  // Method to show the GIF dialog
  void _showGifDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: AltDlgColor,
              title: Text(
                 'Visual Tip',
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
                    !image(widget.exerciseName) ? widget.frontGifPath : widget.sideGifPath,
                    height: 200,
                  ),
                ],
              ),
              actions: <Widget>[
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
        padding: const EdgeInsets.all(10), // Set padding for the box
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                widget.title,
                style: const TextStyle(
                  color: SectextColor, // Set text color to white
                  fontSize: 16, // Set font size
                  fontWeight: FontWeight.bold, // Make the text bold
                ),
                overflow: TextOverflow.ellipsis, // Adds ellipsis if text overflows
                maxLines: 1, // Restricts text to a single line
                softWrap: false, // Prevents text from wrapping to the next line
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    widget.isExpanded ? Icons.expand_less : Icons.expand_more,
                    color: iconColor,
                  ),
                  onPressed: widget.onToggle,
                ),
                IconButton(
                  icon: Icon(Icons.gif, color: iconColor, size: 33), // Change to the desired icon
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
                padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: widget.feedback.length,
                  itemBuilder: (context, index) {
                    return Text(
                      widget.feedback[index],
                      style: const TextStyle(
                        color: iconColor, // Set text color to white
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
