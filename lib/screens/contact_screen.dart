import 'package:flutter/material.dart';
import '../widgets/navbar.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Navbar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Contact Me', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('Email: praveen885127@gmail.com'),
            Text('LinkedIn: linkedin.com/in/pyapril1507'),
          ],
        ),
      ),
    );
  }
}
