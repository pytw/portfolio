import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  static Future<String> getImageUrl(String filePath) async {
    try {
      final ref = FirebaseStorage.instance.ref(filePath);
      return await ref.getDownloadURL();
    } catch (e) {
      throw Exception("Error fetching image URL: $e");
    }
  }
}
