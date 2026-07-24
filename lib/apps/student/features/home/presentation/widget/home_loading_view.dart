import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thapasya/apps/student/features/profile/presentation/widget/details_card.dart';
import 'package:thapasya/apps/widgets/shimmer_box.dart';
import 'package:thapasya/core/theme/app_theme.dart';

class HomeLoadingView extends StatelessWidget {
  const HomeLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: 20.h),
        Container(
          padding: EdgeInsets.all(20.w),
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmerBox(height: 13.h, width: 120.w),
              SizedBox(height: 15.h),
              shimmerBox(height: 20.h, width: 100.w),

              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  shimmerBox(height: 15,width: 120),
                
                  shimmerBox(height: 15,width: 120),
                ],
              ),

              SizedBox(height: 15.h),
              shimmerBox(height: 10.h, width: 140.w),
              // SizedBox(height: 10.h),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     shimmerBox(width: 90.w, height: 100.h),
              //     shimmerBox(width: 90.w, height: 100.h),
              //     shimmerBox(width: 90.w, height: 100.h),
              //   ],
              // ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        detailsCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmerBox(height: 15.h, width: 140),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      shimmerBox(height: 15.h, width: 70.w),
                      SizedBox(height: 10.h),
                      shimmerBox(height: 10.h, width: 100.w),
                    ],
                  ),
                  shimmerBox(height: 17.h, width: 70.w),
                ],
              ),
              SizedBox(height: 25.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      shimmerBox(height: 15.h, width: 70.w),
                      SizedBox(height: 10.h),
                      shimmerBox(height: 10.h, width: 100.w),
                    ],
                  ),
                  shimmerBox(height: 17.h, width: 70.w),
                ],
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        AnimatedContainer(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          margin: EdgeInsets.symmetric(horizontal: 20.w),

          decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.25),
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    shimmerBox(height: 15.h, width: 150.w),
                    SizedBox(height: 10.h),
                    shimmerBox(height: 10.h, width: 180.w),
                  ],
                ),
              ),
              Divider(color: const Color.fromARGB(255, 239, 239, 239)),
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    shimmerBox(height: 10.h, width: 100.w),
                    SizedBox(height: 10.h),
                    shimmerBox(height: 10.h),
                  ],
                ),
              ),

              Divider(color: const Color.fromARGB(255, 237, 237, 237)),
              Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    shimmerBox(height: 10.h, width: 100.w),
                    SizedBox(height: 10.h),
                    shimmerBox(height: 10.h),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
