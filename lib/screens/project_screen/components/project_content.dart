import 'package:flutter/material.dart';
import 'package:portfolio_website/screens/project_screen/components/project_carousel.dart';
import 'package:portfolio_website/screens/project_screen/components/project_grid.dart';
import 'package:portfolio_website/screens/sections/section_wrapper.dart';

import '../../../widgets/custom_header.dart';
import '../../sections/footer_section.dart';

class ProjectContent extends StatelessWidget {
  final ScrollController scrollController;
  final Future<List<Map<String, dynamic>>> projectsFuture;
  final double padding;

  const ProjectContent({
    required this.scrollController,
    required this.projectsFuture,
    required this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: scrollController,
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        children: [
          SectionWrapper(
            child: CustomHeader(
              titleText: "Explore Our ",
              subtitleText: "Projects",
              titleStyle: Theme.of(context).textTheme.displayMedium,
              subtitleStyle:
                  Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
            ),
          ),
          ProjectCarousel(projectsFuture: projectsFuture),
          SectionWrapper(
            child: CustomHeader(
              titleText: "More ",
              subtitleText: "Projects",
              titleStyle: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: Theme.of(context).primaryColor,
                  ),
              subtitleStyle: Theme.of(context).textTheme.displaySmall,
            ),
          ),
          ProjectGrid(projectsFuture: projectsFuture),
          const FooterSection(),
        ],
      ),
    );
  }
}
