import 'package:flutter/material.dart';
import 'package:portfolio_website/firebase/storage/firebase_storage_service.dart';

class FirebaseImage extends StatelessWidget {
  final String filePath;
  final BoxFit fit;

  const FirebaseImage({super.key,
    required this.filePath,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: FirebaseStorageService.getImageUrl(filePath),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (snapshot.hasData) {
          return Image.network(
            snapshot.data!,
            fit: fit,
          );
        } else {
          return const Center(child: Text("Image not found"));
        }
      },
    );
  }
}
