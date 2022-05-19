import 'package:cloud_firestore/cloud_firestore.dart';

class Book {
  final String? id;
  final String title;
  final String author;
  final String? imageUrl;
  final int pages;
  final int readPages;
  final Timestamp createdAt;


  Book(
      {this.id,
      this.imageUrl,
      required this.title,
      required this.author,
      required this.pages,
      required this.readPages,
      required this.createdAt});

  factory Book.fromDocumentSnapshot(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Book(
      id: doc.id,
      title: data['title'],
      author: data['author'],
      imageUrl: data['imageUrl'],
      pages: data['pages'],
      readPages: data['readPages'],
      createdAt: data['createdAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'imageUrl': imageUrl,
      'pages': pages,
      'readPages': readPages,
      'createdAt': createdAt,
    };
  }

  Book copyWith({
    String? id,
    String? title,
    String? author,
    String? imageUrl,
    int? pages,
    int? readPages,
    Timestamp? createdAt,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      author: author ?? this.author,
      imageUrl: imageUrl ?? this.imageUrl,
      pages: pages ?? this.pages,
      readPages: readPages ?? this.readPages,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
