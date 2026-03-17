import 'dart:developer';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  static Future<String?> uploadFile({
    required File file,
    required String baseFolder,
    required String subFolder,
    required String originalFileName,
    required String fileType,
  }) async {
    try {
      String storagePath =
          "$baseFolder/$subFolder/${DateTime.now().millisecondsSinceEpoch}_$originalFileName";
      final storageRef = FirebaseStorage.instance.ref(storagePath);

      final TaskSnapshot snapshot = await storageRef.putFile(
        file,
        SettableMetadata(contentType: fileType),
      );

      String downloadUrl = await snapshot.ref.getDownloadURL();
      log("Download URL: $downloadUrl");
      return downloadUrl;
    } catch (e) {
      log("Error uploading file: $e");
      return null;
    }
  }
}
