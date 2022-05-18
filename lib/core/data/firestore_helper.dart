import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {

  static final FirestoreHelper instance = FirestoreHelper._internal();

  FirestoreHelper._internal();

  FirebaseFirestore get  _firestore => FirebaseFirestore.instance;

  Future<String> addDocument(String collection, Map<String, dynamic> data) async {
    DocumentReference documentReference = await _firestore.collection(collection).add(data);
    return documentReference.id;
  }

  Future<void> deleteDocument(String collection, String document) async {
    await _firestore.collection(collection).doc(document).delete();
  }


  Future<List<DocumentSnapshot>> fetchDocuments(String collection) async {
    var documents = await _firestore.collection(collection).get();
    return documents.docs;
  }



}
