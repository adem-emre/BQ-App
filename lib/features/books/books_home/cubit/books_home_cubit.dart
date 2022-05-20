import 'package:bloc/bloc.dart';
import 'package:bq_app/core/data/firestore_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../models/book.dart';

part 'books_home_state.dart';

class BooksHomeCubit extends Cubit<BooksHomeState> {
  BooksHomeCubit() : super(BooksHomeInitial());
  final FirestoreHelper _firestoreHelper = FirestoreHelper.instance;

  void fetchBooks(String userId,{isFirstloading = false}) async {
    try {
      emit(BooksHomeLoading());
      final List<DocumentSnapshot> books =
          await _firestoreHelper.fetchDocuments('users/$userId/books', 'createdAt');
      final List<Book> bookList = books
          .map((book) => Book.fromDocumentSnapshot(book))
          .toList();
        
      if(isFirstloading){
        await Future.delayed(const Duration(seconds: 1)); // simulate network delay
      }
      
      emit(BooksHomeLoaded(books: bookList));
    } catch (e) {
      emit(BooksHomeError(message: e.toString()));
    }
  }

  Future<void> updateReadPages(String userId, Book book,int readPages) async {
    try {
      await _firestoreHelper.updateDocument(
          'users/$userId/books/${book.id}', {'readPages': readPages});
      emit(ReadPagesEditSuccess());
      fetchBooks(userId);
    } catch (e) {
      print("Hata oluştu: $e");
      emit(ReadPagesEditError(message: e.toString()));
    }
  }

  Future<void> deleteBook(String userId, Book book) async {
    try {
      await _firestoreHelper.deleteDocument('users/$userId/books/${book.id}');
      emit(DeleteBookSuccess());
      fetchBooks(userId);
    } catch (e) {
      emit(DeleteBookError(message: e.toString()));
    }
  }
}
