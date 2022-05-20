import 'package:bq_app/core/constant/app_assets.dart';
import 'package:bq_app/core/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/style/app_text_style.dart';
import '../../books/models/book.dart';
import '../quotes_list/cubit/quotes_list_cubit.dart';

class QuoteListHeader extends StatelessWidget {
  const QuoteListHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Book selectedBook = context.read<QuotesListCubit>().selectedBook;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: context.setScaledHeight(0.36),
            width: context.width,
            child: selectedBook.imageUrl != null
                ? Image.network(
                    selectedBook.imageUrl!,
                  )
                : Image.asset(AppAssets.defaultCoverImg)),
        Text(
          selectedBook.title,
          style: AppTextStyle.bookNameStyle,
        ),
        Text(
          selectedBook.author,
          style: AppTextStyle.authorStyle,
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}
