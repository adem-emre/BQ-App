part of '../books_home_view.dart';

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
        onPressed: () async {
          bool? itemAdded = await Navigator.push<bool?>(context,
              MaterialPageRoute(builder: (context) => const AddBookView()));
          if (itemAdded == true) {
            context
                .read<BooksHomeCubit>()
                .fetchBooks(context.read<AuthCubit>().getUserId!);
          }
        });
  }
}
