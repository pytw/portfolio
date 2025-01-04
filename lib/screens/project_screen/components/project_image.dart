import 'package:flutter/material.dart';

class ProjectImage extends StatelessWidget {
  final String imageUrl;

  const ProjectImage({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        imageUrl,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.contain,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.broken_image,
            size: 50,
            color: Theme.of(context).colorScheme.onError,
          );
        },
      ),
    );
  }
}
