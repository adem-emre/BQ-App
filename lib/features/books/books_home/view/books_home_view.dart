import 'package:bq_app/core/constant/app_colors.dart';
import 'package:bq_app/core/constant/app_dimensions.dart';
import 'package:bq_app/core/constant/app_strings.dart';
import 'package:bq_app/core/widgets/custom_button.dart';
import 'package:bq_app/core/widgets/custom_text_form.dart';
import 'package:bq_app/core/widgets/delete_dialog.dart';
import 'package:bq_app/features/books/add_book/view/add_book_view.dart';
import 'package:bq_app/features/books/edit_book/edit_book_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/book_card.dart';

class BooksHomeView extends StatelessWidget {
  const BooksHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return BookCard(
                    onDelete: () {
                      showDialog(
                          context: context,
                          builder: (context) => DeleteDialog(message: AppStrings.deleteBookQuest, onDelete: (){
                            Navigator.pop(context);
                          }));
                    },
                    onEdit: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EditBookView()));
                    },
                    onForward: () {
                      _pageNumberDialog(context);
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
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
