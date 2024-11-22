import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/models/models.dart';

class AppText {
  // Heroic Section
  static const String profession = 'Aspiring Software & UI/UX Developer';

  static const Map<String, String> downloadLinks = {
    'PDF':
        'https://firebasestorage.googleapis.com/v0/b/portfolio-1952e.appspot.com/o/resume.pdf?alt=media&token=1f10e879-5234-4ab4-ab7c-c272e81f38fb',
    'DOCX':
        'https://firebasestorage.googleapis.com/v0/b/portfolio-1952e.appspot.com/o/resume.docx?alt=media&token=6bc02eaa-f332-46b0-b34a-fb51aeb2aa42',
    'PNG':
        'https://firebasestorage.googleapis.com/v0/b/portfolio-1952e.appspot.com/o/resume.png?alt=media&token=09985770-9968-4df8-8508-2942cd18935b',
  };

  static List<SocialMedia> socialMedia = [
    SocialMedia(
        'Github', FontAwesomeIcons.github, 'https://www.github.com/pyapril15'),
    SocialMedia('LinkedIn', FontAwesomeIcons.linkedin,
        'https://www.linkedin.com/in/pyapril15'),
    SocialMedia('Instagram', FontAwesomeIcons.instagram,
        'https://www.instagram.com/codelabpraveen'),
    SocialMedia('Twitter', FontAwesomeIcons.twitter,
        'https://www.twitter.com/pyapril15'),
  ];

  static const String email = 'praveen885127@gmail.com';

  // Project Section

  static ProjectDetail sampleProject() {
    return ProjectDetail(
      "Dashboard",
      "assets/gif/tmc.gif",
      "An admin dashboard serves multiple crucial functions, enhancing operational efficiency, decision-making, and user management. It provides a centralized platform for overseeing components, making informed decisions, and managing user interactions. The dashboard presents real-time data and analytics, enabling prompt responses to emerging trends and issues. It empowers data-driven decision-making, efficient user management, and content oversight. The dashboard also monitors system health, ensures security and compliance, and facilitates communication among team members. Its scalability supports long-term growth, adapting to changing business environments.",
      _technicalSkills(),
    );
  }

  static List<TechnicalSkill> _technicalSkills() {
    return [
      TechnicalSkill('Tkinter', 'assets/icons/Python.svg'),
      TechnicalSkill('Qt', 'assets/icons/Qt-Framework.svg'),
      TechnicalSkill('QSS', 'assets/icons/css3.svg'),
    ];
  }

  // Skill Section

  static List<TechnicalSkill> _frontendSkill() {
    return [
      TechnicalSkill('Flutter', 'assets/icons/Flutter.svg'),
      TechnicalSkill('Tkinter', 'assets/icons/Python.svg'),
      TechnicalSkill('Qt', 'assets/icons/Qt-Framework.svg'),
      TechnicalSkill('HTML', 'assets/icons/HTML5.svg'),
      TechnicalSkill('CSS', 'assets/icons/css3.svg'),
    ];
  }

  static List<TechnicalSkill> _backendSkill() {
    return [
      TechnicalSkill('Firebase', 'assets/icons/Firebase.svg'),
      TechnicalSkill('Dart', 'assets/icons/Dart.svg'),
      TechnicalSkill('Python', 'assets/icons/Python.svg'),
      TechnicalSkill('Java', 'assets/icons/Java.svg'),
      TechnicalSkill('Django', 'assets/icons/Django.svg'),
      TechnicalSkill('Django Rest', 'assets/icons/django-rest.svg'),
      TechnicalSkill('MySQL', 'assets/icons/MySQl.svg'),
      TechnicalSkill('SQLite', 'assets/icons/SQLite.svg'),
      TechnicalSkill('Postman', 'assets/icons/Postman.svg'),
    ];
  }

  static List<TechnicalSkill> _otherToolsSkill() {
    return [
      TechnicalSkill('Matplotlib', 'assets/icons/Matplotlib.svg'),
      TechnicalSkill('Pandas', 'assets/icons/pandas.svg'),
      TechnicalSkill('NumPy', 'assets/icons/NumPy.svg'),
      TechnicalSkill('Git', 'assets/icons/Git.svg'),
      TechnicalSkill('Github', 'assets/icons/GitHub.svg'),
      TechnicalSkill('Github Action', 'assets/icons/github-actions.svg'),
    ];
  }

  static final List<SkillCategory> skillCategories = [
    SkillCategory(
      title: 'Frontend',
      icon: Icons.web,
      skills: _frontendSkill(),
    ),
    SkillCategory(
      title: 'Backend',
      icon: Icons.storage,
      skills: _backendSkill(),
    ),
    SkillCategory(
      title: 'Other Tools',
      icon: Icons.build,
      skills: _otherToolsSkill(),
    ),
  ];

  static const String aboutMeText = """
        Hello! I’m Praveen Yadav, an enthusiastic undergraduate currently pursuing my Bachelor of Computer Applications (BCA). My passion lies in software development, where I strive to master both front-end and back-end technologies. I am driven by a love for coding and a desire to create innovative solutions that address real-world challenges.
        \nI thrive in collaborative environments, where exchanging ideas and learning from others fuels my creativity and problem-solving skills. I’m always eager to explore new technologies and refine my abilities, as I believe in the power of continuous growth in this ever-evolving field.
        """;

  static const String introText = """
I’m excited to connect with you! Whether you have a project in mind, questions about web development, or just want to chat, I’m here to help. Feel free to reach out via email or find me on social media platforms like Instagram, Twitter, and LinkedIn.
  """;

  static const String contactMeText = """
For collaboration, insights, or tech discussions, don’t hesitate to reach out through my GitHub or Discord. I value every conversation and look forward to building something amazing together.
  """;
}
