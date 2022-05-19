import 'package:bq_app/core/constant/app_assets.dart';
import 'package:bq_app/core/constant/app_colors.dart';
import 'package:bq_app/core/style/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../models/book.dart';
import 'book_slide_button.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final void Function() onDelete;
  final void Function() onEdit;
  final void Function() onForward;
  final Function() onTap;
  const BookCard({
    Key? key,
    required this.onDelete,
    required this.onEdit,
    required this.onForward,
    required this.onTap,
    required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(motion: const ScrollMotion(), children: [
        Expanded(
          child: BookSlideButton(
            buttonColor: AppColors.editButtonColor,
            onPressed: () {
              onEdit();
            },
            icon: const Icon(Icons.edit),
          ),
        )
      ]),
      endActionPane: ActionPane(motion: const ScrollMotion(), children: [
        Expanded(
          child: BookSlideButton(
            buttonColor: AppColors.deleteButtonColor,
            onPressed: () {
              onDelete();
            },
            icon: const Icon(Icons.delete),
          ),
        )
      ]),
      child: Card(
        elevation: 6,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: InkWell(
          splashColor: AppColors.bookSplashColor,
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          onTap: () {
            onTap();
          },
          child: Container(
            padding: const EdgeInsets.all(9),
            height: 150,
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 0.5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 0.5),
                      ),
                      child: book.imageUrl == null
                          ? Image.asset(AppAssets.defaultCoverImg,
                              fit: BoxFit.cover)
                          : Image.network(
                              book.imageUrl!,
                              fit: BoxFit.cover,
                            ),
                    )),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  book.title,
                                  style: AppTextStyle.bookNameStyle,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  book.author,
                                  maxLines: 1,
                                  style: AppTextStyle.authorStyle,
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                              onTap: onForward,
                              child: const Icon(Icons.fast_forward))
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${book.readPages}/${book.pages}",
                              style: GoogleFonts.inter(fontSize: 10),
                            ),
                            LinearPercentIndicator(
                              animation: true,
                              backgroundColor: Colors.transparent,
                              lineHeight: 7,
                              animationDuration: 1000,
                              progressColor: Colors.green,
                              percent: (book.readPages / book.pages),
                              barRadius: const Radius.circular(10),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
