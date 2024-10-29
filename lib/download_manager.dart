// lib/download_manager.dart
import 'dart:html' as html;
import 'package:flutter/material.dart';

enum DownloadState { started, completed, failed }

Future<DownloadState> downloadResume(
    BuildContext context, String filepath) async {
  if (filepath.isEmpty) {
    _showSnackBar(context, 'Download failed. File path is invalid.',
        duration: 3);
    return DownloadState.failed;
  }

  try {
    if (!context.mounted) return DownloadState.failed;

    _showSnackBar(context, 'Download started!', duration: 1);
    await Future.delayed(const Duration(seconds: 1));

    final anchor = html.AnchorElement(href: filepath)
      ..setAttribute('download', 'praveen_yadav_resume')
      ..click();

    await Future.delayed(const Duration(seconds: 2));
    if (anchor.href != null) {
      if (!context.mounted) return DownloadState.failed;
      _showSnackBar(context, 'Download complete!', duration: 2);
      return DownloadState.completed;
    } else {
      throw Exception('Download link is invalid.');
    }
  } catch (e) {
    if (context.mounted) {
      _showSnackBar(context, 'Download failed. Please try again.', duration: 2);
    }
    return DownloadState.failed;
  }
}

void _showSnackBar(BuildContext context, String message, {int duration = 2}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: duration),
    ),
  );
}
