import 'package:flutter/material.dart';

class SocialMedia {
  final String name;
  final IconData icon;
  final String url;

  SocialMedia(this.name, this.icon, this.url);
}

class ProjectDetail {
  final String title;
  final String imagePath;
  final String overview;
  final List<TechnicalSkill> skills;

  ProjectDetail(this.title, this.imagePath, this.overview, this.skills);
}

class SkillCategory {
  final String title;
  final IconData icon;
  final List<TechnicalSkill> skills;

  SkillCategory(
      {required this.title, required this.icon, required this.skills});
}

class TechnicalSkill {
  final String name;
  final String iconPath;

  TechnicalSkill(this.name, this.iconPath);
}
