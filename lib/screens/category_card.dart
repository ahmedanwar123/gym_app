// category_card.dart

import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final int workouts;
  final Widget image;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.workouts,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: colorScheme.secondary,
      ),
      child: Row(
        children: [
          image,
          SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: colorScheme.onSecondary)),
              Text('$workouts Workouts', style: TextStyle(color: colorScheme.onSecondary)),
            ],
          ),
        ],
      ),
    );
  }
}
