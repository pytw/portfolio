import 'package:flutter/material.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              SkillItem(skill: 'Flutter'),
              SkillItem(skill: 'Dart'),
              SkillItem(skill: 'Firebase'),
            ],
          ),
        ],
      ),
    );
  }
}

class SkillItem extends StatelessWidget {
  final String skill;

  const SkillItem({
    super.key,
    required this.skill,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        skill,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
