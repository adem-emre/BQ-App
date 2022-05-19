import 'package:bq_app/core/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerBookCard extends StatelessWidget {
  const ShimmerBookCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerBaseColor,
      highlightColor: AppColors.shimmerHighlightColor,
      child: Container(
        padding: const EdgeInsets.all(9),
        height: 150,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Shimmer.fromColors(
                  baseColor: AppColors.shimmerBaseColor,
                  highlightColor: AppColors.shimmerHighlightColor,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 0.5),
                    decoration: BoxDecoration(
                      color: Colors.grey[400],
                      border: Border.all(color: Colors.black, width: 0.5),
                    ),
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
                          children: [
                            Container(
                              width: double.infinity,
                              height: 12.0,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Container(
                              width: double.infinity,
                              height: 8.0,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 20,
                        height: 15.0,
                        color: Colors.white,
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          width: 42,
                          height: 10,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        LinearPercentIndicator(
                          backgroundColor: Colors.transparent,
                          lineHeight: 7,
                          percent: 1,
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
    );
  }
}
