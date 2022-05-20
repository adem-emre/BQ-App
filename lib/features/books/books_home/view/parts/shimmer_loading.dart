part of '../books_home_view.dart';

class _ShimmerLoading extends StatelessWidget {
  const _ShimmerLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return const ShimmerBookCard();
        });
  }
}
