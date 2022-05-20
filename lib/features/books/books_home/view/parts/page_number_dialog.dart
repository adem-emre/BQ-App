
part of '../books_home_view.dart';

Future<dynamic> _pageNumberDialog(
      BuildContext context, Book book, BooksHomeCubit booksHomeCubit) {
    return showDialog(
        context: context,
        builder: (_) {
          int readPages = 0;
          final _formKey = GlobalKey<FormState>();
          return AlertDialog(
            title: const Text(AppStrings.pageNumberQuestStr),
            content: BlocProvider.value(
              value: booksHomeCubit,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Form(
                    key: _formKey,
                    child: CustomTextForm(
                      initialValue: book.readPages.toString(),
                      padding: EdgeInsets.zero,
                      hintText: AppStrings.pageNumberStr,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value != null) {
                          return (int.parse(value) > book.pages)
                              ? AppStrings.invalidReadPageCount
                              : null;
                        }
                        return null;
                      },
                      onSaved: (value) {
                        if (value != null) {
                          readPages = int.parse(value);
                        }
                      },
                    ),
                  ),
                  CustomButton(
                    label: AppStrings.saveStr,
                    onFuture: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        await context.read<BooksHomeCubit>().updateReadPages(
                            context.read<AuthCubit>().getUserId!,
                            book,
                            readPages);
                        Navigator.pop(context);
                      }
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }