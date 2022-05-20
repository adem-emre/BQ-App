part of 'add_quote_cubit.dart';

abstract class AddQuoteState extends Equatable {
  const AddQuoteState();

  @override
  List<Object> get props => [];
}

class AddQuoteInitial extends AddQuoteState {}

class AddQuoteSuccess extends AddQuoteState {}

class AddQuoteError extends AddQuoteState {
  final String message;

  const AddQuoteError({required this.message});

  @override
  List<Object> get props => [message];
}
