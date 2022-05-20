import 'package:bloc/bloc.dart';
import 'package:bq_app/features/quotes/models/quote.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/data/firestore_helper.dart';

part 'add_quote_state.dart';

class AddQuoteCubit extends Cubit<AddQuoteState> {
  AddQuoteCubit() : super(AddQuoteInitial());
  final FirestoreHelper _firestoreHelper = FirestoreHelper.instance;

  late String quote;

  Future<void> addQuote(String userId, String bookId) async {
    try {
      await _firestoreHelper.addDocument("users/$userId/books/$bookId/quotes",
          Quote(quote: quote, timestamp: Timestamp.now()).toMap());
      emit(AddQuoteSuccess());
      
    } catch (e) {
      emit(AddQuoteError(message: e.toString()));
    }
  }
}
