import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreHelper {

  static final FirestoreHelper instance = FirestoreHelper._internal();

  FirestoreHelper._internal();

  FirebaseFirestore get  _firestore => FirebaseFirestore.instance;

  Future<String> addDocument(String collection, Map<String, dynamic> data) async {
    DocumentReference documentReference = await _firestore.collection(collection).add(data);
    return documentReference.id;
  }

  Future<void> deleteDocument(String document) async {
    await _firestore.doc(document).delete();
  }


  Future<List<DocumentSnapshot>> fetchDocuments(String collection,String field) async {
    var documents = await _firestore.collection(collection).orderBy(field,descending: true).get();
    return documents.docs;
  }

 

  Future<void> updateDocument(String document, Map<String, dynamic> data) async {
    await _firestore.doc(document).update(data);
  }



}
