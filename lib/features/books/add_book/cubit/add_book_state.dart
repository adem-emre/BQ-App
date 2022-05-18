part of 'add_book_cubit.dart';

abstract class AddBookState extends Equatable {
  const AddBookState();

  @override
  List<Object> get props => [];
}

class AddBookInitial extends AddBookState {}

class AddBookSuccess extends AddBookState {}

class AddBookError extends AddBookState {
  final String message;

  const AddBookError({required this.message});

  @override
  List<Object> get props => [message];
}
