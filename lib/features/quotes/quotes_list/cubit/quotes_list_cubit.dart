import 'package:bloc/bloc.dart';
import 'package:bq_app/core/data/firestore_helper.dart';
import 'package:equatable/equatable.dart';

import '../../../books/models/book.dart';
import '../../models/quote.dart';

part 'quotes_list_state.dart';

class QuotesListCubit extends Cubit<QuotesListState> {
  QuotesListCubit() : super(QuotesListInitial());
  final FirestoreHelper _firestoreHelper = FirestoreHelper.instance;

  late Book selectedBook;

  void setSelectedBook(Book book) {
    selectedBook = book;
  }

  void fetchQuotes(String userId) async {
    emit(QoutesListLoading());
    try {
      final quotes = await _firestoreHelper.fetchDocuments(
          "users/$userId/books/${selectedBook.id}/quotes", 'timestamp');
      final List<Quote> quoteList =
          quotes.map((quote) => Quote.fromDocumentSnapshot(quote)).toList();
      emit(QuotelistLoaded(quotes: quoteList));
    } catch (e) {
      emit(QuotesListError(message: e.toString()));
    }
  }

  Future<void> deleteQuote(String userId, Quote quote) async {
    try {
      await _firestoreHelper.deleteDocument(
          "users/$userId/books/${selectedBook.id}/quotes/${quote.id}");
      emit(DeleteQuoteSuccess());
    } catch (e) {
      emit(DeleteQuoteError(message: e.toString()));
    }
  }
}
