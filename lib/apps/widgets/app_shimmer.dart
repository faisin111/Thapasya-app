import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class AppShimmer extends StatelessWidget {
  const AppShimmer({super.key,required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
     return Shimmer.fromColors(
      baseColor: const Color(0xffE8E8E8),
      highlightColor: const Color(0xffF7F7F7),
      period: const Duration(milliseconds: 1200),
      child: child,
    );
  }
}