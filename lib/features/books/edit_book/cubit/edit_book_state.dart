part of 'edit_book_cubit.dart';

abstract class EditBookState {
  const EditBookState();
}

class EditBookInitial extends EditBookState {}

class EditBookSuccess extends EditBookState {}

class EditBookError extends EditBookState {
  final String message;

  EditBookError({required this.message});
}
