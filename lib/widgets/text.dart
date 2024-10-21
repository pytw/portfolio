import 'package:flutter/material.dart';

Widget listDetail(String title, String description,
    List<String> features) {
  return Expanded(
    flex: 1,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: features.map((feature) {
            return Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.green, size: 16),
                const SizedBox(width: 5),
                Text(
                  feature,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
              ],
            );
          }).toList(),
        ),
        const SizedBox(height: 15),
        // Action Buttons (View and Source Code)
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: () {
                // Action to view the project
              },
              icon: const Icon(Icons.open_in_new, color: Colors.white),
              iconAlignment: IconAlignment.end,
              label: const Text('Have a look'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ),
            ),
            const SizedBox(width: 10),
            OutlinedButton(
              onPressed: () {
                // Action for source code
              },
              child: const Text('Source Code'),
            ),
          ],
        ),
      ],
    ),
  );
}
