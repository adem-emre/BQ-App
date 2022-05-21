part of '../quotes_list_view.dart';

Future<void> _onEdit(BuildContext context, Quote currentQuote) async {
    bool? isSuccess =
        await showGeneralDialog<bool?>(
            context: context,
            pageBuilder: (context, _, __) {
              return EditQuoteView(
                selectedQuote: currentQuote,
              );
            });
    
    if (isSuccess == true) {
      context
          .read<QuotesListCubit>()
          .fetchQuotes(context
              .read<AuthCubit>()
              .getUserId!);
    }
  }