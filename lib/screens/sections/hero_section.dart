import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/hoverable_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.w),
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
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                SizedBox(height: 10.h),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "I'm ",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                      TextSpan(
                        text: 'Praveen Yadav',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: Theme.of(context).primaryColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Text(
                  'Your Aspiring Fullstack Web Developer.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: Colors.grey[400]),
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
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/pyapril15.png',
                  fit: BoxFit.cover,
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
          onPressed: () {},
          label: "Have",
          icon: Icons.add,
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
          child: const Text('See Project'),
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
      ],
    );
  }
}
