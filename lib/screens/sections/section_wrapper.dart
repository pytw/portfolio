import 'package:flutter/material.dart';

class SectionWrapper extends StatelessWidget {
  final GlobalKey? globalKey;
  final Widget child;

  const SectionWrapper({this.globalKey, required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      key: globalKey ,
      margin: EdgeInsets.symmetric(
        vertical: screenHeight * 0.01,
        horizontal: screenWidth * 0.01,
      ),
      padding: EdgeInsets.symmetric(
        vertical: screenHeight * 0.015,
        horizontal: screenWidth * 0.015,
      ),
      child: child,
    );
  }
}
