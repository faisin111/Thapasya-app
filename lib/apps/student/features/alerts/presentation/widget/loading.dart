import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thapasya/apps/widgets/cards.dart';
import 'package:thapasya/apps/widgets/shimmer_box.dart';

Widget loadingAlerts() {
  return detailsCard(
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(4, (i) {
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                shimmerBox(width: 30.w, height: 30.h, radius: 50),
                SizedBox(width: 13.w),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      shimmerBox(height: 20.h, width: 120.w),

                      SizedBox(height: 3.h),
                      shimmerBox(width: 70.w, height: 10.h, radius: 50),
                      SizedBox(height: 3.h),
                      shimmerBox(height: 7),
                       SizedBox(height: 3.h),
                      shimmerBox(height: 7),
                       SizedBox(height: 3.h),
                      shimmerBox(height: 7),
                      SizedBox(height: 6.h),
                      shimmerBox(height: 5, width: 40),
                    ],
                  ),
                ),
              ],
            ),
            if (4 - 1 != i)
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Divider(color: const Color.fromARGB(255, 223, 223, 223)),
              ),
          ],
        );
      }),
    ),
  );
}
