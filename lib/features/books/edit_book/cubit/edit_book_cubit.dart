import 'dart:io';

import 'package:bloc/bloc.dart';

import '../../../../core/data/firestore_helper.dart';
import '../../helper/storage_helper.dart';
import '../../models/book.dart';

part 'edit_book_state.dart';

class EditBookCubit extends Cubit<EditBookState> {
  EditBookCubit() : super(EditBookInitial());

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

  Future<void> editBook(String userId, Book book) async {
    String? imageUrl;
    try {
      if (bookImageFile != null) {
        if (book.imageUrl != null) {
          imageUrl =
              await _storageHelper.editFile(book.imageUrl!, bookImageFile!);
        } else {
          imageUrl = await _storageHelper.uploadFile(userId, bookImageFile!);
        }
      }

      await _firestoreHelper.updateDocument(
          'users/$userId/books/${book.id}',
          book
              .copyWith(
                title: bookName!,
                author: author!,
                pages: pages!,
                readPages: readPages ?? 0,
                imageUrl: imageUrl,
              )
              .toMap());

      emit(EditBookSuccess());
    } catch (e) {
      emit(EditBookError(message: e.toString()));
    }
  }
}
