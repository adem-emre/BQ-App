import 'package:bloc/bloc.dart';
import 'package:bq_app/core/data/firestore_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../models/book.dart';

part 'books_home_state.dart';

class BooksHomeCubit extends Cubit<BooksHomeState> {
  BooksHomeCubit() : super(BooksHomeInitial());
  final FirestoreHelper _firestoreHelper = FirestoreHelper.instance;

  void fetchBooks(String userId) async {
    try {
      emit(BooksHomeLoading());
      final List<DocumentSnapshot> books =
          await _firestoreHelper.fetchDocuments('users/$userId/books');
      final List<Book> bookList = books
          .map((book) => Book.fromDocumentSnapshot(book))
          .toList()
          .reversed
          .toList();
      await Future.delayed(const Duration(seconds: 3));
      emit(BooksHomeLoaded(books: bookList));
    } catch (e) {
      emit(BooksHomeError(message: e.toString()));
    }
  }
}
