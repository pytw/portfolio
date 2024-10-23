import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/hoverable_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Left Section: Text and Buttons
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hey Welcome!',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white, // White text color for contrast
                        fontWeight: FontWeight.bold, // Bold for emphasis
                      ),
                ),
                SizedBox(height: 10.h),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "I'm ",
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Colors.white,
                                ),
                      ),
                      TextSpan(
                        text: 'Praveen Yadav',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 32.sp, // Increase font size
                                ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Your Aspiring Fullstack Web Developer.',
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: Colors.grey[300], // Light grey for readability
                        fontSize: 18.sp, // Adjust font size
                      ),
                ),
                SizedBox(height: 5.h),
                Text(
                  'Crafting seamless and engaging web experiences.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors
                            .grey[400], // Slightly lighter grey for contrast
                        fontStyle: FontStyle.italic,
                      ),
                ),
                SizedBox(height: 20.h),
                _buildButtons(context),
                SizedBox(height: 20.h),
                _buildSocialIcons(context),
              ],
            ),
          ),

          // Right Section: Image
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center, // Center the image
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black
                        .withOpacity(0.5), // Shadow effect for depth
                    blurRadius: 10, // Soft shadow
                    offset: Offset(0, 5), // Shadow position
                  ),
                ],
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/pyapril15.png',
                  fit: BoxFit.cover,
                  width: 220.w, // Increased width for a more prominent display
                  height: 220.h, // Increased height
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtons(BuildContext context) {
    return Row(
      children: [
        HoverableButton(
          onPressed: () {
            // Handle button action
          },
          label: "Get in Touch",
          icon: Icons.message,
        ),
        SizedBox(width: 20.w),
        ElevatedButton(
          onPressed: () {
            // Handle see project action
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
            backgroundColor: Theme.of(context).primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          child: const Text('See Projects'),
        ),
      ],
    );
  }

  Widget _buildSocialIcons(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            // Handle LinkedIn action
          },
          icon: const Icon(Icons.linked_camera),
          color: Colors.white,
        ),
        SizedBox(width: 10.w),
        IconButton(
          onPressed: () {
            // Handle GitHub action
          },
          icon: const Icon(Icons.code),
          color: Colors.white,
        ),
        SizedBox(width: 10.w),
        IconButton(
          onPressed: () {
            // Handle Twitter/X action
          },
          icon: const Icon(Icons.alternate_email),
          color: Colors.white,
        ),
        SizedBox(width: 10.w),
        IconButton(
          onPressed: () {
            // Handle additional social media action
          },
          icon: const Icon(
              Icons.personal_video), // Example icon for additional link
          color: Colors.white,
        ),
      ],
    );
  }
}
