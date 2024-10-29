import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_website/screens/home_screen.dart';
import 'package:portfolio_website/theme/theme.dart'; // Custom app theme
import 'firebase/firebase_options.dart'; // Firebase options

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Create an instance of AppRouter

    return ScreenUtilInit(
      designSize: const Size(1920, 1080), // Adjust base design size
      minTextAdapt: true, // Ensures text scales accordingly
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Portfolio - Praveen Yadav',
          theme: appTheme(),
          home: const HomeScreen(), // Use the router instance here
        );
      },
    );
  }
}
