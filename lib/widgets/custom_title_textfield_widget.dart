import 'dart:core';

import 'package:flutter/material.dart';

class CustomTitledTextField extends StatelessWidget {
  final String title;
  final double height;
  final double width;
  final String textHint;
  final double topPadding;
  final double textFieldHeight;
  const CustomTitledTextField({
    super.key,
    required this.height,
    required this.textHint,
    required this.title,
    required this.width,
    required this.topPadding,
    required this.textFieldHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              fontSize: 17,
              color: Color(0xFF1D1E20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: topPadding),
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6FA),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: const Color(0xFFF5F6FA),
                ),
              ),
              child: Container(
                height: textFieldHeight,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: textHint,
                    hintStyle: const TextStyle(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: Color(0xFF8F959E)),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(10.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
