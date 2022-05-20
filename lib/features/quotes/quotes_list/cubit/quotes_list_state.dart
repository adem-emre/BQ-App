part of 'quotes_list_cubit.dart';

abstract class QuotesListState extends Equatable {
  const QuotesListState();

  @override
  List<Object> get props => [];
}

class QuotesListInitial extends QuotesListState {}

class QoutesListLoading extends QuotesListState {}

class QuotelistLoaded extends QuotesListState {
  final List<Quote> quotes;

  const QuotelistLoaded({required this.quotes});

  @override
  List<Object> get props => [quotes];
}

class QuotesListError extends QuotesListState {
  final String message;

  const QuotesListError({required this.message});

  @override
  List<Object> get props => [message];
}

class DeleteQuoteSuccess extends QuotesListState{}

class DeleteQuoteError extends QuotesListState{
  final String message;

  const DeleteQuoteError({required this.message});
}
