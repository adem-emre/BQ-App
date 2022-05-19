import 'package:bq_app/core/auth/cubit/auth_cubit.dart';
import 'package:bq_app/core/constant/app_colors.dart';
import 'package:bq_app/core/constant/app_dimensions.dart';
import 'package:bq_app/core/constant/app_strings.dart';
import 'package:bq_app/core/widgets/custom_button.dart';
import 'package:bq_app/core/widgets/custom_text_form.dart';
import 'package:bq_app/core/widgets/delete_dialog.dart';
import 'package:bq_app/features/books/add_book/view/add_book_view.dart';
import 'package:bq_app/features/books/books_home/cubit/books_home_cubit.dart';
import 'package:bq_app/features/books/edit_book/edit_book_view.dart';
import 'package:bq_app/features/books/widgets/shimmer_book_card.dart';
import 'package:bq_app/features/quotes/quotes_list/view/quotes_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/book_card.dart';

class BooksHomeView extends StatelessWidget {
  const BooksHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          BooksHomeCubit()..fetchBooks(context.read<AuthCubit>().getUserId!),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(),
          drawer: const Drawer(),
          floatingActionButton: const _FloatingActionButton(),
          body: Padding(
            padding: AppDimensions.pagePadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    AppStrings.booksStr,
                    style: GoogleFonts.inter(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  color: AppColors.primaryColor,
                  thickness: 1,
                ),
                Expanded(child: BlocBuilder<BooksHomeCubit, BooksHomeState>(
                  builder: (context, state) {
                    if (state is BooksHomeLoaded) {
                      return ListView.builder(
                          itemCount: state.books.length,
                          itemBuilder: (context, index) {
                            return BookCard(
                              book: state.books[index],
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const QuotesListView()));
                              },
                              onDelete: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => DeleteDialog(
                                        message: AppStrings.deleteBookQuest,
                                        onDelete: () {
                                          Navigator.pop(context);
                                        }));
                              },
                              onEdit: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const EditBookView()));
                              },
                              onForward: () {
                                _pageNumberDialog(context);
                              },
                            );
                          });
                    } else if (state is BooksHomeError) {
                      return Center(child: Text(state.message));
                    }

                    return const _ShimmerLoading();
                  },
                ))
              ],
            ),
          ),
        );
      }),
    );
  }

  Future<dynamic> _pageNumberDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text(AppStrings.pageNumberQuestStr),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const CustomTextForm(
                    padding: EdgeInsets.zero,
                    hintText: AppStrings.pageNumberStr,
                    keyboardType: TextInputType.number,
                  ),
                  CustomButton(
                    label: AppStrings.saveStr,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ));
  }
}

class _ShimmerLoading extends StatelessWidget {
  const _ShimmerLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ShimmerBookCard();
        });
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        splashColor: AppColors.bookSplashColor,
        child: const Icon(
          Icons.add,
          size: 36,
        ),
        backgroundColor: Colors.white,
        shape: const CircleBorder(
          side: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddBookView()));
        });
  }
}
