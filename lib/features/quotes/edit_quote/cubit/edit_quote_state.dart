part of 'edit_quote_cubit.dart';

abstract class EditQuoteState extends Equatable {
  const EditQuoteState();

  @override
  List<Object> get props => [];
}

class EditQuoteInitial extends EditQuoteState {}

class EditQuoteSuccess extends EditQuoteState {}

class EditQuoteError extends EditQuoteState {
  final String message;

  const EditQuoteError({required this.message});

  @override
  List<Object> get props => [message];
}
