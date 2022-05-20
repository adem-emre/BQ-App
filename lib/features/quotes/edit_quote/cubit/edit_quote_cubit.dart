import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/data/firestore_helper.dart';
import '../../models/quote.dart';

part 'edit_quote_state.dart';

class EditQuoteCubit extends Cubit<EditQuoteState> {
  EditQuoteCubit() : super(EditQuoteInitial());
  final FirestoreHelper _firestoreHelper = FirestoreHelper.instance;

  late String quote;

  Future<void> editQuote(String userId, String bookId, Quote selectedQuote) async {
    try {
      await _firestoreHelper.updateDocument("users/$userId/books/$bookId/quotes/${selectedQuote.id}",
          selectedQuote.copyWith(
            quote: quote,
          ).toMap());
      emit(EditQuoteSuccess());
      
    } catch (e) {
      emit(EditQuoteError(message: e.toString()));
    }
  }
}
