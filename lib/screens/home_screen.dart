import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_website/helpers/responsive_helper.dart';
import 'package:portfolio_website/screens/sections/about_section.dart';
import 'package:portfolio_website/screens/sections/contact_section.dart';
import 'package:portfolio_website/screens/sections/footer_section.dart';
import 'package:portfolio_website/screens/sections/hero_section.dart';
import 'package:portfolio_website/screens/sections/project_section.dart';
import 'package:portfolio_website/screens/sections/skills_section.dart';
import 'package:portfolio_website/theme/theme.dart';
import 'package:portfolio_website/widgets/navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  String activeSection = 'Home';

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

  void scrollToSection(GlobalKey key, String section) {
    setState(() {
      activeSection = section; // Set active section when clicking a button
    });

    // Smooth scrolling to the target section
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    final screenHeight = ScreenUtil().screenHeight;
    final ScreenType screenType = getScreenType(context);

    final EdgeInsetsGeometry responsiveMargin = screenType == ScreenType.desktop
        ? EdgeInsets.symmetric(horizontal: mediaQuery.width * 0.05)
        : const EdgeInsets.all(5);

    return SafeArea(
      child: Scaffold(
        appBar: Navbar(
          activeSection: activeSection,
          onSectionSelected: (String section) {
            switch (section) {
              case 'Home':
                scrollToSection(_homeKey, section);
                break;
              case 'Projects':
                scrollToSection(_projectsKey, section);
                break;
              case 'Skills':
                scrollToSection(_skillsKey, section);
                break;
              case 'About':
                scrollToSection(_aboutKey, section);
                break;
              case 'Contact':
                scrollToSection(_contactKey, section);
                break;
            }
          },
        ),
        body: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          child: SingleChildScrollView(
            controller: _scrollController,
            child: Container(
              margin: responsiveMargin,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    key: _homeKey,
                    margin: EdgeInsets.symmetric(
                        vertical:
                            screenType == ScreenType.mobile ? 0 : 15.h),
                    height: ((screenType == ScreenType.mobile ? 0.3 : 0.8) *
                            screenHeight).h,
                    width: double.infinity,
                    child: HeroSection(onSectionSelected: (String section) {
                      scrollToSection(_projectsKey, section);
                    }),
                  ),
                  SizedBox(height: screenType==ScreenType.mobile?62.h:108.h),
                  Container(
                    key: _projectsKey,
                    margin: EdgeInsets.symmetric(
                        vertical: screenType == ScreenType.mobile ? 0 : 15.h),
                    height: (screenType == ScreenType.mobile ? null : (1.3*screenHeight).h),
                    child: const ProjectSection(),
                  ),
                  SizedBox(height: AppSizes.mediumSpaceBtwItems.h),
                  Container(
                    key: _skillsKey,
                    margin: EdgeInsets.symmetric(
                        vertical: mediaQuery.height * 0.025),
                    height: mediaQuery.height * 0.7,
                    child: const SkillsSection(),
                  ),
                  SizedBox(height: AppSizes.mediumSpaceBtwItems.h),
                  Container(
                    key: _aboutKey,
                    margin: EdgeInsets.symmetric(
                        vertical: mediaQuery.height * 0.025),
                    height: mediaQuery.height * 0.7,
                    child: const AboutSection(),
                  ),
                  SizedBox(height: AppSizes.mediumSpaceBtwItems.h),
                  Container(
                    key: _contactKey,
                    margin: EdgeInsets.symmetric(
                        vertical: mediaQuery.height * 0.025),
                    height: mediaQuery.height * 0.7,
                    child: const ContactSection(),
                  ),
                  const Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
