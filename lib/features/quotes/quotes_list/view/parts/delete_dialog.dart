part of '../quotes_list_view.dart';

_deleteDialog(BuildContext context, Quote currentQuote) async {
    showDialog(
                                      context: context,
                                      builder: (context) => DeleteDialog(
                                          message:
                                              AppStrings.deleteQuoteQuest,
                                          onDelete: () async {
                                            await context
                                                .read<QuotesListCubit>()
                                                .deleteQuote(
                                                    context
                                                        .read<AuthCubit>()
                                                        .getUserId!,
                                                    currentQuote);

                                            Navigator.of(context).pop();
                                          }));
  }