import 'package:flutter/material.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Skills')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text('Skills', style: TextStyle(fontSize: 32)),
            ListTile(
              leading: Icon(Icons.code),
              title: Text('Java'),
            ),
            ListTile(
              leading: Icon(Icons.code),
              title: Text('C'),
            ),
            ListTile(
              leading: Icon(Icons.code),
              title: Text('Python'),
            ),
          ],
        ),
      ),
    );
  }
}
