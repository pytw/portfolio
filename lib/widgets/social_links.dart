import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinks extends StatelessWidget {
  const SocialLinks({super.key});

  void _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.link),
          onPressed: () => _launchURL('https://linkedin.com/in/pyapril1507'),
        ),
        IconButton(
          icon: const Icon(Icons.code),
          onPressed: () => _launchURL('https://github.com/pyapril15'),
        ),
      ],
    );
  }
}
