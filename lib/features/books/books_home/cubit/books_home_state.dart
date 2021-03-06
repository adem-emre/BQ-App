part of 'books_home_cubit.dart';



abstract class BooksHomeState extends Equatable {
  const BooksHomeState();

  @override
  List<Object> get props => [];
}

class BooksHomeInitial extends BooksHomeState {}

class BooksHomeLoading extends BooksHomeState {}

class BooksHomeLoaded extends BooksHomeState {
  final List<Book> books;

  const BooksHomeLoaded({required this.books});

  @override
  List<Object> get props => [books];
}

class BooksHomeError extends BooksHomeState {
  final String message;

  const BooksHomeError({required this.message});

  @override
  List<Object> get props => [message];
}

class ReadPagesEditSuccess extends BooksHomeState {}

class ReadPagesEditError extends BooksHomeState {
  final String message;

  const ReadPagesEditError({required this.message});


}

class DeleteBookSuccess extends BooksHomeState {}

class DeleteBookError extends BooksHomeState {
  final String message;

  const DeleteBookError({required this.message});
}
