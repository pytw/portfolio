import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/navbar.dart';
import '../widgets/social_links.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Navbar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Hi, I am Praveen Yadav', style: TextStyle(fontSize: 36)),
          Text('BCA Student & Software Developer'),
          SizedBox(height: 20),
          SocialLinks(),
        ],
      ),
    );
  }
}
