import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProjectImage extends StatelessWidget {
  final String imageUrl;

  const ProjectImage({required this.imageUrl, super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.contain,
        placeholder: (context, url) => const Center(
          child: CircularProgressIndicator(),
        ),
        errorWidget: (context, url, error) => Icon(
          Icons.broken_image,
          size: 50,
          color: Theme.of(context).colorScheme.onError,
        ),
      ),
    );
  }
}
