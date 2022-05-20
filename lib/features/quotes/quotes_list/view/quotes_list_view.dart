import 'package:bq_app/core/constant/app_colors.dart';
import 'package:bq_app/core/constant/app_dimensions.dart';
import 'package:bq_app/features/quotes/add_quote/view/add_quote_view.dart';
import 'package:bq_app/features/quotes/edit_quote/view/edit_quote_view.dart';
import 'package:bq_app/features/quotes/quotes_list/cubit/quotes_list_cubit.dart';
import 'package:bq_app/features/quotes/widgets/quote_back_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/auth/cubit/auth_cubit.dart';
import '../../../../core/constant/app_strings.dart';
import '../../../../core/widgets/delete_dialog.dart';
import '../../widgets/quote_card.dart';
import '../../widgets/quote_list_header.dart';

class QuotesListView extends StatelessWidget {
  const QuotesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context
        .read<QuotesListCubit>()
        .fetchQuotes(context.read<AuthCubit>().getUserId!);
    return Scaffold(
      floatingActionButton: const _FloatingActionButton(),
      body: SafeArea(
        child: Padding(
          padding: AppDimensions.pagePadding,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const QuoteListHeader(),
                  Expanded(child: BlocBuilder<QuotesListCubit, QuotesListState>(
                    builder: (context, state) {
                      if (state is QuotelistLoaded) {
                        if (state.quotes.isEmpty) {
                          return const Center(
                            child: Text(
                              AppStrings.noQuotes,
                              style: TextStyle(),
                            ),
                          );
                        }
                        return ListView.builder(
                            padding: const EdgeInsets.only(bottom: 36),
                            itemCount: state.quotes.length,
                            itemBuilder: (context, index) {
                              var currentQuote = state.quotes[index];
                              return QuoteCard(
                                  onTap: () {},
                                  onDelete: () {
                                    showDialog(
                                        context: context,
                                        builder: (context) => DeleteDialog(
                                            message:
                                                AppStrings.deleteQuoteQuest,
                                            onDelete: () {
                                              Navigator.pop(context);
                                            }));
                                  },
                                  onEdit: () {
                                    showGeneralDialog(
                                        context: context,
                                        pageBuilder: (context, _, __) {
                                          return const EditQuoteView();
                                        });
                                  },
                                  onShare: () {},
                                  quote: currentQuote.quote);
                            });
                      } else if (state is QoutesListLoading) {
                        return const Center(
                            child: CircularProgressIndicator(
                          color: AppColors.primaryColor,
                        ));
                      } else {
                        state as QuotesListError;
                        return Center(child: Text(state.message));
                      }
                    },
                  ))
                ],
              ),
              const QuoteBackButton()
            ],
          ),
        ),
      ),
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async{
        bool? isSuccessful = await showGeneralDialog<bool?>(
            context: context,
            pageBuilder: (context, _, __) {
              return const AddQuoteView();
            });
        if (isSuccessful == true) {
          context.read<QuotesListCubit>().fetchQuotes(
              context.read<AuthCubit>().getUserId!);
        }
      },
      child: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      backgroundColor: AppColors.authHeaderColor,
    );
  }
}
