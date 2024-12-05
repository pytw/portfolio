import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:portfolio_website/router/app_router.dart';
import 'theme/app_theme.dart';
import 'firebase/firebase_options.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configureApp();

  runApp(const PortfolioApp());
}

void configureApp() {
  setUrlStrategy(PathUrlStrategy());
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
