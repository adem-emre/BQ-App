import 'package:bq_app/core/auth/cubit/auth_cubit.dart';
import 'package:bq_app/core/constant/app_colors.dart';
import 'package:bq_app/core/constant/app_dimensions.dart';
import 'package:bq_app/core/constant/app_strings.dart';
import 'package:bq_app/core/widgets/custom_button.dart';
import 'package:bq_app/core/widgets/custom_text_form.dart';
import 'package:bq_app/core/widgets/delete_dialog.dart';
import 'package:bq_app/features/auth/login/view/login_view.dart';
import 'package:bq_app/features/books/add_book/view/add_book_view.dart';
import 'package:bq_app/features/books/books_home/cubit/books_home_cubit.dart';
import 'package:bq_app/features/books/edit_book/view/edit_book_view.dart';
import 'package:bq_app/features/books/widgets/shimmer_book_card.dart';
import 'package:bq_app/features/quotes/quotes_list/cubit/quotes_list_cubit.dart';
import 'package:bq_app/features/quotes/quotes_list/view/quotes_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/book.dart';
import '../../widgets/book_card.dart';

part 'parts/page_number_dialog.dart';
part 'parts/shimmer_loading.dart';
part 'parts/add_book_button.dart';
part 'parts/delete_dialog.dart';
part 'parts/drawer.dart';

class BooksHomeView extends StatelessWidget {
  const BooksHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AuthCubit>().setUserInfo();

    return BlocProvider(
      create: (context) => BooksHomeCubit()
        ..fetchBooks(context.read<AuthCubit>().getUserId!,
            isFirstloading: true),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(),
          drawer: const _Drawer(),
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
                            BooksHomeCubit booksHomeCubit =
                                context.read<BooksHomeCubit>();
                            return BookCard(
                              book: state.books[index],
                              onTap: () async {
                                context
                                    .read<QuotesListCubit>()
                                    .setSelectedBook(state.books[index]);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const QuotesListView()));
                              },
                              onDelete: () {
                                _deleteDialog(
                                    context, booksHomeCubit, state, index);
                              },
                              onEdit: () async {
                                bool? itemEdited = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => EditBookView(
                                              selectedBook: state.books[index],
                                            )));

                                if (itemEdited == true) {
                                  context.read<BooksHomeCubit>().fetchBooks(
                                      context.read<AuthCubit>().getUserId!);
                                }
                              },
                              onForward: () {
                                _pageNumberDialog(context, state.books[index],
                                    booksHomeCubit);
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
}

