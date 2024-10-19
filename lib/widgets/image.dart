// Image section
import 'package:flutter/material.dart';

Widget assetImage(String imagePath) {
  return Expanded(
    flex: 1,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withOpacity(1),
            blurRadius: 20,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Image.asset(
          imagePath, // Ensure the correct image path
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}