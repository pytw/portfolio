import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/models/models.dart';

class AppColor {
  static const Color primaryColor = Color(0xff2196f3);
  static const Color secondaryColor = Color(0xFF03DAC6);
  static const Color backgroundColor = Color(0xFF121212);
  static const Color surfaceColor = Color(0xFF1E1E1E);
  static const Color errorColor = Color(0xFFCF6679);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color onSecondary = Color(0xff9ca3af);
  static const Color onBackground = Color(0xFFFFFFFF);
  static const Color onError = Color(0xFFFFFFFF);
}

class AppSize {
  static const double horizontalPadding = 16;
  static const double verticalPadding = 16;
  static const double spacing = 8;
  static const double borderSize = 8;
  static const double iconSize = 24;
  static const double borderRadius = 8;
  static const double screenBreakPoint = 768;
  static const double smallScreenBreakPoint = 600;
  static const double layoutBuilderBreakPoint = 625;
}

class AppImage {
  static const String _assetIcon = 'assets/icons/';

  static const String handImage =
      'https://firebasestorage.googleapis.com/v0/b/portfolio-1952e.appspot.com/o/assets%2Fgif%2Fhand.gif?alt=media&token=4d41440e-0270-4140-bd54-6ed97b1e6ead';

  //additional images
  static const String heroicImage =
      'https://firebasestorage.googleapis.com/v0/b/portfolio-1952e.appspot.com/o/profile%2Fpyapril15.png?alt=media&token=73fbd140-f2d1-4f87-afa4-dae0c8062dc2';
  static const String aboutImage =
      'https://firebasestorage.googleapis.com/v0/b/portfolio-1952e.appspot.com/o/assets%2Fabout-me.png?alt=media&token=dedb14d5-c58f-4be6-a91c-8e06ac2a87c6';
  static const String contactImage =
      'https://firebasestorage.googleapis.com/v0/b/portfolio-1952e.appspot.com/o/assets%2Fconnect.png?alt=media&token=ba67304e-7f42-4357-8c13-1005540bafa2';

  // icons
  static const String pythonSvgIcon = '${_assetIcon}Python.svg';
  static const String matplotlibSvgIcon = '${_assetIcon}Matplotlib.svg';
  static const String pandasSvgIcon = '${_assetIcon}pandas.svg';
  static const String numpySvgIcon = '${_assetIcon}NumPy.svg';
  static const String djangoSvgIcon = '${_assetIcon}Django.svg';
  static const String djangoRestSvgIcon = '${_assetIcon}django-rest.svg';
  static const String qtSvgIcon = '${_assetIcon}Qt-Framework.svg';

  static const String dartSvgIcon = '${_assetIcon}Dart.svg';
  static const String flutterSvgIcon = '${_assetIcon}Flutter.svg';
  static const String firebaseSvgIcon = '${_assetIcon}Firebase.svg';

  static const String mysqlSvgIcon = '${_assetIcon}MySQl.svg';
  static const String sqlLiteSvgIcon = '${_assetIcon}SQLite.svg';
  static const String postmanSvgIcon = '${_assetIcon}Postman.svg';

  static const String gitSvgIcon = '${_assetIcon}Git.svg';
  static const String githubSvgIcon = '${_assetIcon}GitHub.svg';
  static const String githubActionSvgIcon = '${_assetIcon}github-actions.svg';

  static const String html5SvgIcon = '${_assetIcon}HTML5.svg';
  static const String css3SvgIcon = '${_assetIcon}css3.svg';

  static const String javaSvgIcon = '${_assetIcon}Java.svg';
}

class AppText {
  // Heroic Section
  static const String profession = 'Aspiring Software & UI/UX Developer';

  static const Map<String, String> downloadLinks = {
    'PDF':
        'https://firebasestorage.googleapis.com/v0/b/portfolio-1952e.appspot.com/o/resume%2FPraveen%20Yadav(Resume).pdf?alt=media&token=438855fd-da69-499f-b8ab-4f88a541a815',
    'DOCX':
        'https://firebasestorage.googleapis.com/v0/b/portfolio-1952e.appspot.com/o/resume%2FPraveen%20Yadav(Resume).docx?alt=media&token=b157c7cb-a25c-40ac-934a-80857a216e50',
    'PNG':
        'https://firebasestorage.googleapis.com/v0/b/portfolio-1952e.appspot.com/o/resume%2FPraveen%20Yadav(Resume).jpg?alt=media&token=1832d978-9d27-4c33-8b10-8c166bd62bed',
  };

  static List<SocialMedia> socialMedia = [
    SocialMedia(
        'Github', FontAwesomeIcons.github, 'https://www.github.com/pyapril15'),
    SocialMedia('LinkedIn', FontAwesomeIcons.linkedin,
        'www.linkedin.com/in/praveen-yadav-1947222ab'),
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
      "https://firebasestorage.googleapis.com/v0/b/portfolio-1952e.appspot.com/o/assets%2Fgif%2Ftmc.gif?alt=media&token=75138057-b92a-48e1-8f18-7c05bfe811b3",
      "The project is called Transport Management System (TMC), developed using the PyQt6 package in Python, designed specifically for transport booking in colleges. This application is cross-platform.\n\n"
          "The frontend of the application was created using Qt Designer in Python, while the backend is powered by Python and utilizes MySQL as the database. The system comes with a variety of features, including transport booking for exams, events, and regular services.\n\n"
          "This application provides a comprehensive solution for managing transport services in colleges.",
      _technicalSkills(),
    );
  }

  static List<TechnicalSkill> _technicalSkills() {
    return [
      TechnicalSkill('Tkinter', AppImage.pythonSvgIcon),
      TechnicalSkill('Qt', AppImage.qtSvgIcon),
      TechnicalSkill('QSS', AppImage.css3SvgIcon),
    ];
  }

  // Skill Section

  static List<TechnicalSkill> _frontendSkill() {
    return [
      TechnicalSkill('Flutter', AppImage.flutterSvgIcon),
      TechnicalSkill('Tkinter', AppImage.pythonSvgIcon),
      TechnicalSkill('Qt', AppImage.qtSvgIcon),
      TechnicalSkill('HTML', AppImage.html5SvgIcon),
      TechnicalSkill('CSS', AppImage.css3SvgIcon),
    ];
  }

  static List<TechnicalSkill> _backendSkill() {
    return [
      TechnicalSkill('Firebase', AppImage.firebaseSvgIcon),
      TechnicalSkill('Dart', AppImage.dartSvgIcon),
      TechnicalSkill('Python', AppImage.pythonSvgIcon),
      TechnicalSkill('Java', AppImage.javaSvgIcon),
      TechnicalSkill('Django', AppImage.djangoSvgIcon),
      TechnicalSkill('Django Rest', AppImage.djangoRestSvgIcon),
      TechnicalSkill('MySQL', AppImage.mysqlSvgIcon),
      TechnicalSkill('SQLite', AppImage.sqlLiteSvgIcon),
      TechnicalSkill('Postman', AppImage.postmanSvgIcon),
    ];
  }

  static List<TechnicalSkill> _otherToolsSkill() {
    return [
      TechnicalSkill('Matplotlib', AppImage.matplotlibSvgIcon),
      TechnicalSkill('Pandas', AppImage.pandasSvgIcon),
      TechnicalSkill('NumPy', AppImage.numpySvgIcon),
      TechnicalSkill('Git', AppImage.gitSvgIcon),
      TechnicalSkill('Github', AppImage.githubSvgIcon),
      TechnicalSkill('Github Action', AppImage.githubActionSvgIcon),
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
