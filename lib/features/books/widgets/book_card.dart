import 'package:bq_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'book_slide_button.dart';

class BookCard extends StatelessWidget {
  final void Function() onDelete;
  final void Function() onEdit;
  final void Function() onForward;
  const BookCard({
    Key? key,
    required this.onDelete,
    required this.onEdit,
    required this.onForward,
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
          onTap: () {},
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
                      child: Image.network(
                          "https://i.dr.com.tr/cache/600x600-0/originals/0000000608697-1.jpg"),
                    )),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Martin Eden",
                              style: GoogleFonts.inter(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          InkWell(
                              onTap: onForward,
                              child: const Icon(Icons.fast_forward))
                        ],
                      ),
                      Text(
                        "Jack London",
                        style: GoogleFonts.inter(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: AppColors.authorTextColor),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 6),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "${240}/${300}",
                              style: GoogleFonts.inter(fontSize: 10),
                            ),
                            LinearPercentIndicator(
                              animation: true,
                              backgroundColor: Colors.transparent,
                              lineHeight: 7,
                              animationDuration: 1000,
                              progressColor: Colors.green,
                              percent: 0.8,
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
