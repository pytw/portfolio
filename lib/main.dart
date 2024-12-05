import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio_website/router/app_router.dart';
import 'theme/app_theme.dart';
import 'firebase/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Portfolio - Praveen Yadav',
      theme: appThemeData(context),
      routerConfig: AppRouter.router,
    );
  }
}
