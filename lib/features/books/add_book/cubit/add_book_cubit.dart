import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bq_app/core/data/firestore_helper.dart';
import 'package:bq_app/features/books/models/book.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../helper/storage_helper.dart';

part 'add_book_state.dart';

class AddBookCubit extends Cubit<AddBookState> {
  AddBookCubit() : super(AddBookInitial());
  final FirestoreHelper _firestoreHelper = FirestoreHelper.instance;
  final StorageHelper _storageHelper = StorageHelper();

  File? bookImageFile;
  String? bookName;
  String? author;
  int? pages;
  int? readPages;

  Future<String?> addImage() async {
    final filePath = await _storageHelper.pickImage();
    if (filePath != null) {
      bookImageFile = File(filePath);
    }

    return filePath;
  }

  Future<void> addBook(String userId) async {
    try {
      String? imageUrl;
      if (bookImageFile != null) {
        imageUrl = await _storageHelper.uploadFile(userId, bookImageFile!);
      }

      await _firestoreHelper.addDocument(
          'users/$userId/books',
          Book(
                  title: bookName!,
                  author: author!,
                  pages: pages!,
                  readPages: readPages ?? 0,
                  imageUrl: imageUrl,
                  createdAt: Timestamp.now())
              .toMap());

      emit(AddBookSuccess());
    } catch (e) {
      emit(AddBookError(message: e.toString()));
    }
  }
}
