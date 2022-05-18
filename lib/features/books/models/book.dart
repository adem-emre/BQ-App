import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  final String? id;
  final String title;
  final String author;
  final String? imageUrl;
  final int pages;
  final int readPages;


  Book(
      {this.id,
      this.imageUrl,
      required this.title,
      required this.author,
      required this.pages,
      required this.readPages});

  factory Book.fromDocumentSnapshot(DocumentSnapshot doc) {
    return Book(
      id: doc.id,
      title: doc['title'],
      author: doc['author'],
      imageUrl: doc['imageUrl'],
      pages: doc['pages'],
      readPages: doc['readPages'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'imageUrl': imageUrl,
      'pages': pages,
      'readPages': readPages,
    };
  }

  Book copyWith({
    String? id,
    String? title,
    String? author,
    String? imageUrl,
    int? pages,
    int? readPages,
    Timestamp? date,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      imageUrl: imageUrl ?? this.imageUrl,
      pages: pages ?? this.pages,
      readPages: readPages ?? this.readPages,
    );
  }
}
