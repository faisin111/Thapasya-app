import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:riverpod/riverpod.dart';
import 'package:thapasya/apps/student/features/home/presentation/providers/home_provider.dart';
import 'package:thapasya/core/theme/app_theme.dart';

Widget statusItem(IconData i, String g, String j) {
  return Expanded(
    flex: 1,
    child: Column(
      children: [
        Icon(i, color: AppTheme.whiteColor, size: 27.sp),
        Text(
          g,
          style: GoogleFonts.inter(
            fontSize: 20.sp,
            color: AppTheme.whiteColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        SizedBox(
          width: 80,
          child: Text(
            textAlign: TextAlign.center,
            j,
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              color: AppTheme.whiteColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget classItem(String title, String sub, String time) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Monday",
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "Bharathanatyam",
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              color: const Color.fromARGB(255, 135, 135, 135),
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      Text(
        "5:00 PM",
        style: GoogleFonts.inter(
          fontSize: 14.sp,
          color: AppTheme.primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    ],
  );
}

Widget logsItem(
  String date,
  String subject,
  bool tapped,
  String content,
  WidgetRef ref,
) {
  final log = ref.watch(logsTappProvider);
  return Padding(
    padding: EdgeInsets.all(20.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              date,
              style: GoogleFonts.inter(
                fontSize: 13.sp,
                color: const Color.fromARGB(255, 135, 135, 135),
                fontWeight: FontWeight.w500,
              ),
            ),
            Expanded(child: SizedBox()),

            GestureDetector(
              onTap: () {
                ref.read(logsTappProvider.notifier).state = !log;
                ref.refresh(logsTappProvider);
              },
              child: Icon(
                log ? CupertinoIcons.chevron_down : CupertinoIcons.chevron_down,
                color: const Color.fromARGB(255, 151, 151, 151),
                size: 20.sp,
              ),
            ),
          ],
        ),
        Text(
          subject,
          style: GoogleFonts.inter(
            fontSize: 14.sp,
            color: const Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w600,
          ),
        ),
        log
            ? Padding(
                padding: EdgeInsets.symmetric(vertical: 5.w),
                child: Divider(color: const Color.fromARGB(255, 235, 235, 235)),
              )
            : SizedBox(),
        log
            ? Text(style: GoogleFonts.inter(fontSize: 13.sp), content)
            : SizedBox(),
        // SizedBox(height: 20.h),
      ],
    ),
  );
}
