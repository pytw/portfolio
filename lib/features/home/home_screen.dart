import 'package:flutter/material.dart';
import 'package:portfolio_website/features/about_screen.dart';
import 'package:portfolio_website/features/contact_screen.dart';
import 'package:portfolio_website/features/project_screen.dart';
import 'package:portfolio_website/features/skills_screen.dart';
import 'package:portfolio_website/widgets/navbar.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: const Navbar(),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ScrollbarTheme(
            data: ScrollbarThemeData(
              thumbColor:
                  WidgetStateProperty.all(Colors.blue), // Set thumb color
              thickness:
                  WidgetStateProperty.all(8), // Thickness of the scrollbar
              radius: const Radius.circular(
                  10), // Apply border radius to scrollbar thumb and track
              thumbVisibility:
                  WidgetStateProperty.all(true), // Make thumb always visible
            ),
            child: Scrollbar(
              controller: _scrollController,
              thumbVisibility: true,
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildHeroSection(context),
                    const ProjectSection(),
                    const SkillsSection(),
                    const AboutSection(),
                    const ContactSection(),
                    _buildFooter(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Hero Section
  Widget _buildHeroSection(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Section: Text and Buttons
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Hey Welcome!',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "I'm ",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: 'Praveen Yadav',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  'Your Aspiring Fullstack Web Developer.',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[400],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle download resume action
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          side: const BorderSide(color: Colors.white),
                        ),
                      ),
                      child: const Text('Download Resume'),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () {
                        // Handle see project action
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 15),
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: const Text('See Project'),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        // Handle LinkedIn action
                      },
                      icon: const Icon(
                          Icons.linked_camera), // Replace with LinkedIn icon
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {
                        // Handle GitHub action
                      },
                      icon: const Icon(Icons.code), // Replace with GitHub icon
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    IconButton(
                      onPressed: () {
                        // Handle Twitter/X action
                      },
                      icon: const Icon(
                          Icons.alternate_email), // Replace with Twitter/X icon
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Right Section: Image
          Expanded(
            flex: 1,
            child: Container(
              decoration: const BoxDecoration(
                  shape:
                      BoxShape.circle, // Change to circle for circular shadow
                  color: Colors.blue),
              child: ClipOval(
                // Use ClipOval for circular image
                child: Image.asset(
                  'assets/images/pyapril15.png', // Ensure the correct image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Footer
  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.blueGrey[900],
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '\u00A9 2024 Praveen Yadav. All rights reserved.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Made with Flutter',
            style: TextStyle(
              color: Colors.white70,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
