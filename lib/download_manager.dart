// lib/download_manager.dart
import 'dart:html' as html;
import 'package:flutter/material.dart';

Future<void> downloadResume(BuildContext context, String filepath) async {
  if (filepath.isEmpty) {
    _showSnackBar(context, 'Download failed. Invalid file path.');
    return;
  }

  try {
    _showSnackBar(context, 'Download started!');

    final anchor = html.AnchorElement(href: filepath)
      ..setAttribute('download', 'praveen_yadav_resume')
      ..click();

    await Future.delayed(const Duration(seconds: 2));

    if (anchor.href != null) {
      _showSnackBar(context, 'Download complete!');
    } else {
      _showSnackBar(context, 'Download failed. Invalid link.');
    }
  } catch (e) {
    _showSnackBar(context, 'Download failed. Please try again.');
  }
}

void _showSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(message)),
  );
}
