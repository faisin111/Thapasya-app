import 'package:flutter/material.dart';
import 'package:thapasya/apps/widgets/app_shimmer.dart';

Widget shimmerBox({double? width, double? height, double radius = 12}) {
  return AppShimmer(
    child: Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    ),
  );
}
