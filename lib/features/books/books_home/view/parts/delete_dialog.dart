part of '../books_home_view.dart';

  Future<dynamic> _deleteDialog(BuildContext context, BooksHomeCubit booksHomeCubit, BooksHomeLoaded state, int index) {
    return showDialog(
                                  context: context,
                                  builder: (context) => BlocProvider.value(
                                        value: booksHomeCubit,
                                        child: Builder(builder: (context) {
                                          return DeleteDialog(
                                              message:
                                                  AppStrings.deleteBookQuest,
                                              onDelete: () async {
                                                await context
                                                    .read<BooksHomeCubit>()
                                                    .deleteBook(
                                                        context
                                                            .read<AuthCubit>()
                                                            .getUserId!,
                                                        state.books[index]);
                                                Navigator.pop(context);
                                              });
                                        }),
                                      ));
  }