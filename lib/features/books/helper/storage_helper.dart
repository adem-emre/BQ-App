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

  Future<String> uploadFile(String filePath, File file) async {
    try {
      Reference reference = _firebaseStorage.ref().child('images/$filePath');
      UploadTask uploadTask = reference.putFile(file);

      String imageUrl = await (await uploadTask).ref.getDownloadURL();

      return imageUrl;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
