import 'package:flutter/material.dart';

import '../../../theme/app_constant.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.horizontalPadding,
        vertical: AppSize.verticalPadding,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '\u00A9 2024 Praveen Yadav. All rights reserved.',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: AppSize.spacing),
          Text(
            'Made with Flutter',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
        ],
      ),
    );
  }
}
