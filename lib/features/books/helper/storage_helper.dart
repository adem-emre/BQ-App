import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class StorageHelper {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<String?> pickImage() async {
    final _picker = ImagePicker();
    var image = await _picker.pickImage(source: ImageSource.gallery);

    final path = image?.path;
    if (path != null) {
      return path;
    }
    return null;
  }

  Future<String> uploadFile(String userId, File file) async {
    try {
      final String imageName = file.path.split("/").last;
      Reference reference =
          _firebaseStorage.ref().child('images/$userId/$imageName');
      UploadTask uploadTask = reference.putFile(file);

      String imageUrl = await (await uploadTask).ref.getDownloadURL();

      return imageUrl;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<String> editFile(String bookUrl, File file) async {
    try {
      Reference reference = _firebaseStorage.refFromURL(bookUrl);
      UploadTask uploadTask = reference.putFile(file);
      String imageUrl = await (await uploadTask).ref.getDownloadURL();

      return imageUrl;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> deleteFile(String bookUrl) async {
    try {
      Reference reference = _firebaseStorage.refFromURL(bookUrl);
      await reference.delete();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
