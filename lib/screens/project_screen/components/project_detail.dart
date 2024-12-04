import 'package:flutter/material.dart';
import 'package:portfolio_website/widgets/effect.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../theme/app_constant.dart';
import '../../../widgets/simple_custom_button.dart';

class ProjectDetails extends StatelessWidget {
  final Map<String, dynamic> project;

  const ProjectDetails({required this.project, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSize.horizontalPadding),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Colors.black87, Colors.transparent],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
        borderRadius: BorderRadius.circular(AppSize.borderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            project['name'],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSize.spacing),
          Row(
            children: [
              const Icon(Icons.star_outline, color: Colors.yellow, size: 16),
              const SizedBox(width: AppSize.spacing / 2),
              Text(
                project['rating'],
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Spacer(),
              Effect(
                builder: (isHovered, __, ___, ____) => SimpleCustomButton(
                  label: "Get Project",
                  backgroundColor: Colors.transparent,
                  borderColor: isHovered ? Colors.white : Colors.transparent,
                  onPressed: () async {
                    final url = project['link'];
                    if (await canLaunchUrlString(url)) {
                      await launchUrlString(url);
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
