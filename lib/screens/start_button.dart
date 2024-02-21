// start_button.dart

import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const StartButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(text),
      style: ElevatedButton.styleFrom(
        primary: colorScheme.primary,
        onPrimary: colorScheme.onPrimary,
      ),
    );
  }
}
