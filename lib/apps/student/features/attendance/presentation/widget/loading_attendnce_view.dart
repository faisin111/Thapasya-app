import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thapasya/apps/student/features/attendance/presentation/widget/calendar.dart';
import 'package:thapasya/apps/widgets/cards.dart';
import 'package:thapasya/apps/widgets/shimmer_box.dart';

class LoadingAttendnceView extends ConsumerWidget {
  const LoadingAttendnceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: 20.h),
        mainCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmerBox(height: 13.h, width: 120.w),
              SizedBox(height: 10.h),
              shimmerBox(height: 13.h, width: 120.w),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        mainCard(
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              shimmerBox(height: 13.h, width: 120.w),
              SizedBox(width: 20.w),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    shimmerBox(height: 13.h, width: 120.w),

                    shimmerBox(height: 13.h, width: 120.w),

                    shimmerBox(height: 13.h, width: 120.w),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),

        AttendanceCalendar(),
        SizedBox(height: 20.h),
        detailsCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              shimmerBox(height: 13.h, width: 120.w),
              SizedBox(height: 5.h),
              shimmerBox(height: 13.h, width: 120.w),
              SizedBox(height: 5.h),
              shimmerBox(height: 13.h, width: 120.w),
              SizedBox(height: 5.h),
            ],
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
