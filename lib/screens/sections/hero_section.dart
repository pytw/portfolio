import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/animations/slide_in_animation.dart';
import 'package:portfolio_website/theme/theme.dart';
import 'package:portfolio_website/widgets/custom_button.dart';
import 'package:portfolio_website/widgets/custom_header.dart';
import 'package:portfolio_website/widgets/profile_widget.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.paddingLarge.w,
        vertical: AppSizes.paddingLarge.h,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          double bodyFontSize = AppSizes.extraLargeFontSize.sp;
          double headingFontSize = 72.sp;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Hey Welcome!"),
                          SizedBox(height: AppSizes.mediumSpaceBtwItems.h),
                          CustomHeader(
                            titleText: "I'm ",
                            subtitleText: "Praveen Yadav",
                            headingFontSize: headingFontSize,
                            alignment: Alignment.center,
                          ),
                          SizedBox(height: AppSizes.mediumSpaceBtwItems.h),
                          const Text("Your Aspiring Fullstack Web Developer."),
                          SizedBox(height: AppSizes.mediumSpaceBtwItems.h),
                          Row(
                            children: [
                              OutlinedButton(
                                onPressed: () {
                                  // Your onPressed logic here
                                },
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Colors.white),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: const Text(
                                  "Download",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              CustomButton(label: "See Project", onPressed: (){},)
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

// class HeroSection extends StatelessWidget {
//   const HeroSection({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Left Section: Text and Buttons
//           Expanded(
//             flex: 2,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Hey Welcome!',
//                   style: Theme.of(context).textTheme.headlineMedium?.copyWith(
//                         color: Colors.white, // White text color for contrast
//                         fontWeight: FontWeight.bold, // Bold for emphasis
//                       ),
//                 ),
//                 SizedBox(height: 10.h),
//                 RichText(
//                   text: TextSpan(
//                     children: [
//                       TextSpan(
//                         text: "I'm ",
//                         style:
//                             Theme.of(context).textTheme.headlineSmall?.copyWith(
//                                   color: Colors.white,
//                                 ),
//                       ),
//                       TextSpan(
//                         text: 'Praveen Yadav',
//                         style:
//                             Theme.of(context).textTheme.headlineSmall?.copyWith(
//                                   color: Theme.of(context).primaryColor,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 32.sp, // Increase font size
//                                 ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: 10.h),
//                 Text(
//                   'Your Aspiring Fullstack Web Developer.',
//                   style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                         color: Colors.grey[300], // Light grey for readability
//                         fontSize: 18.sp, // Adjust font size
//                       ),
//                 ),
//                 SizedBox(height: 5.h),
//                 Text(
//                   'Crafting seamless and engaging web experiences.',
//                   style: Theme.of(context).textTheme.bodyMedium?.copyWith(
//                         color: Colors
//                             .grey[400], // Slightly lighter grey for contrast
//                         fontStyle: FontStyle.italic,
//                       ),
//                 ),
//                 SizedBox(height: 20.h),
//                 _buildButtons(context),
//                 SizedBox(height: 20.h),
//                 _buildSocialIcons(context),
//               ],
//             ),
//           ),
//
//           // Right Section: Image
//           Expanded(
//             flex: 1,
//             child: Container(
//               alignment: Alignment.center, // Center the image
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black
//                         .withOpacity(0.5), // Shadow effect for depth
//                     blurRadius: 10, // Soft shadow
//                     offset: Offset(0, 5), // Shadow position
//                   ),
//                 ],
//               ),
//               child: ClipOval(
//                 child: Image.asset(
//                   'assets/images/pyapril15.png',
//                   fit: BoxFit.cover,
//                   width: 220.w, // Increased width for a more prominent display
//                   height: 220.h, // Increased height
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildButtons(BuildContext context) {
//     return Row(
//       children: [
//         HoverableButton(
//           onPressed: () {
//             // Handle button action
//           },
//           label: "Get in Touch",
//           icon: Icons.message,
//         ),
//         SizedBox(width: 20.w),
//         ElevatedButton(
//           onPressed: () {
//             // Handle see project action
//           },
//           style: ElevatedButton.styleFrom(
//             padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
//             backgroundColor: Theme.of(context).primaryColor,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//           ),
//           child: const Text('See Projects'),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildSocialIcons(BuildContext context) {
//     return Row(
//       children: [
//         IconButton(
//           onPressed: () {
//             // Handle LinkedIn action
//           },
//           icon: const Icon(Icons.linked_camera),
//           color: Colors.white,
//         ),
//         SizedBox(width: 10.w),
//         IconButton(
//           onPressed: () {
//             // Handle GitHub action
//           },
//           icon: const Icon(Icons.code),
//           color: Colors.white,
//         ),
//         SizedBox(width: 10.w),
//         IconButton(
//           onPressed: () {
//             // Handle Twitter/X action
//           },
//           icon: const Icon(Icons.alternate_email),
//           color: Colors.white,
//         ),
//         SizedBox(width: 10.w),
//         IconButton(
//           onPressed: () {
//             // Handle additional social media action
//           },
//           icon: const Icon(
//               Icons.personal_video), // Example icon for additional link
//           color: Colors.white,
//         ),
//       ],
//     );
//   }
// }
