import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../widgets/navbar.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: Navbar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('About Me', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            Text('I am a passionate developer with experience in Flutter, Java, and more...'),
          ],
        ),
      ),
    );
  }
}

class AboutSection extends StatelessWidget{
  const AboutSection({super.key});


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'But wait.. Who am I...',
            style: TextStyle(
              fontSize: screenWidth < 600 ? 24 : 28,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: SvgPicture.asset(
                    'assets/images/about-me.svg', // Ensure this path is correct
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, I'm Praveen Yadav, a dedicated undergraduate student with a profound interest in web development. Currently pursuing my Bachelor of Computer Applications (BCA) degree, my goal is to master both front-end and back-end technologies, aiming to become a versatile and skilled developer. I thrive on the creativity and problem-solving that web development offers. Let's connect and exchange ideas in the dynamic world of web development. I'm always open to new connections and exciting opportunities. Feel free to reach out, and let's embark on this journey together.",
                        style: TextStyle(
                            fontSize: screenWidth < 600 ? 14 : 20,
                            color: const Color(0xff9ca3af),
                            height: 2),
                      ),
                      const SizedBox(height: 50),
                      ElevatedButton.icon(
                        onPressed: () {
                          // Action to connect with me
                        },
                        icon: const Icon(FontAwesomeIcons.link,
                            color: Colors.white),
                        iconAlignment: IconAlignment.end,
                        label: const Text('Connect with me'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
