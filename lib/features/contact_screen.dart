import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher_string.dart';
import '../widgets/navbar.dart';
import '../widgets/social_button.dart';

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

class ContactSection extends StatelessWidget{
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth < 600 ? 10 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Let's get to know each other better.",
            style: TextStyle(
              fontSize: screenWidth < 600 ? 24 : 32,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 20),

          // Row for SVG and text with 50% width each
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: SvgPicture.asset(
                  'assets/images/connect.svg', // Ensure this path is correct
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 20), // Space between SVG and text

              // Text with 50% width
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Thank you for visiting! This is your direct line to reach me. Whether you have a project in mind, a question about web development, or just want to say hello, I'm here and eager to connect with you.",
                        style: TextStyle(
                            fontSize: screenWidth < 600 ? 14 : 20,
                            color: const Color(0xff9ca3af),
                            height: 3),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Reach me out:-",
                        style: TextStyle(
                          fontSize: screenWidth < 600 ? 14 : 20,
                          color: const Color(0xff9ca3af),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    // Email Button
                    SocialButton(
                      label: 'praveen885127@gmail.com',
                      icon: Icons.mail_outline,
                      onPressed: () {
                        launchUrlString('mailto:praveen885127@gmail.com');
                      },
                    ),
                    const SizedBox(height: 40),

                    // Social Links as buttons
                    Wrap(
                      spacing: screenWidth < 600 ? 10 : 20,
                      runSpacing: 10,
                      children: [
                        SocialButton(
                          label: 'Github',
                          icon: FontAwesomeIcons.github,
                          onPressed: () {
                            launchUrlString("https://www.github.com/pyapril15");
                          },
                        ),
                        SocialButton(
                          label: 'LinkedIn',
                          icon: FontAwesomeIcons.linkedin,
                          onPressed: () {
                            launchUrlString("https://www.linkedin.com/pyapril1507");
                          },
                        ),
                        SocialButton(
                          label: 'Twitter',
                          icon: FontAwesomeIcons.twitter,
                          onPressed: () {
                            launchUrlString("https://www.twitter.com/pyapril15");
                          },
                        ),
                        SocialButton(
                          label: 'Discord',
                          icon: FontAwesomeIcons.discord,
                          onPressed: () {
                            launchUrlString('https://www.discord.com/pyapril15');
                          },
                        ),
                        SocialButton(
                          label: 'Instagram',
                          icon: FontAwesomeIcons.instagram,
                          onPressed: () {
                            launchUrlString(
                                'https://www.instagram.com/__pyapril15.py__');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
