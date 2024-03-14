import 'package:flutter/material.dart';

class OtherFormField extends StatelessWidget {
  final String label;
  final void Function(String) onChanged;
  final String hintText;

  const OtherFormField({
    super.key,
    required this.label,
    required this.onChanged,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: Theme.of(context).textTheme.displaySmall!.fontSize! * 1.2,
            fontWeight: Theme.of(context).textTheme.displayLarge!.fontWeight!,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            onChanged: onChanged,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
            cursorColor: Theme.of(context).colorScheme.secondary,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        )
      ],
    );
  }
}
