import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thapasya/apps/student/features/profile/presentation/widget/details_card.dart';
import 'package:thapasya/apps/widgets/shimmer_box.dart';
import 'package:thapasya/core/theme/app_theme.dart';

class LoadingViewProfile extends StatelessWidget {
  const LoadingViewProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),

      children: [
        SizedBox(height: 20.h),

        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          padding: EdgeInsets.symmetric(vertical: 30.h),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              shimmerBox(width: 78, height: 78, radius: 39),

              SizedBox(height: 20.h),

              shimmerBox(width: 170, height: 22),

              SizedBox(height: 10.h),

              shimmerBox(width: 120, height: 14),
            ],
          ),
        ),

        SizedBox(height: 20.h),
        detailsCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmerBox(width: 170, height: 20),

              SizedBox(height: 25.h),

              ...List.generate(
                5,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: 18.h),
                  child: Row(
                    children: [
                      shimmerBox(width: 90, height: 14),

                      const Spacer(),

                      shimmerBox(width: 120, height: 14),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        detailsCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmerBox(width: 170, height: 20),

              SizedBox(height: 25.h),

              ...List.generate(
                5,
                (index) => Padding(
                  padding: EdgeInsets.only(bottom: 18.h),
                  child: Row(
                    children: [
                      shimmerBox(width: 90, height: 14),

                      const Spacer(),

                      shimmerBox(width: 120, height: 14),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: shimmerBox(height: 55, radius: 14),
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
