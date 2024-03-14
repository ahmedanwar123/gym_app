import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum CustomButtonType { primary, social }

class CustomButton extends StatelessWidget {
  const CustomButton(CustomButtonType social, {
    super.key,
    required this.content,
    required this.onPressed,
    this.borderRadius = 20.0,
    this.type = CustomButtonType.primary,
  });

  final CustomButtonType type;
  final String content;
  final void Function() onPressed;
  final double borderRadius; // Add this line

  @override
  Widget build(BuildContext context) {
    ElevatedButton button;

    if (type == CustomButtonType.primary) {
      button = ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                borderRadius), // Use the borderRadius parameter
          ),
        ),
        child: Text(content),
      );
    } else {
      IconData icon;
      Color buttonColor;
      Color iconColor =
          Colors.white; // Set icon color explicitly for visibility

      switch (content) {
        case 'Google':
          icon = FontAwesomeIcons.google;
          buttonColor = const Color(0xFFEA4335);
          break;
        case 'Facebook':
          icon = FontAwesomeIcons.facebookF;
          buttonColor = const Color(0xFF4267B2);
          break;
        case 'Twitter':
          icon = FontAwesomeIcons.twitter;
          buttonColor = const Color(0xFF1DA1F2);
          break;
        default:
          icon = Icons.error;
          buttonColor = Colors.transparent;
          iconColor =
              Colors.black; // Default icon color if button is transparent
      }

      button = ElevatedButton.icon(
        icon: Icon(icon, color: iconColor),
        label: Text(content, style: TextStyle(color: iconColor)),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(50, 45),
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                borderRadius), // Use the borderRadius parameter
          ),
        ),
      );
    }
    return button;
  }
}
