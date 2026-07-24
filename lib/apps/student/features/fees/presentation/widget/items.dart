import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thapasya/core/theme/app_theme.dart';

Widget pendingPaidcard() {
  return Row(
    children: [
      Expanded(
        flex: 1,
        child: Container(
          margin: EdgeInsets.only(left: 20.w),
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppTheme.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pending Amount",
                style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  color: AppTheme.whiteColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                "₹2,500",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  color: AppTheme.whiteColor,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 5.h),
              Text(
                "Due Mar 25, 2026",
                style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  color: AppTheme.whiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(width: 20.w),
      Expanded(
        flex: 1,
        child: Container(
          margin: EdgeInsets.only(right: 20.w),
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1,
              color: const Color.fromARGB(255, 157, 255, 0),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Paid (2026)",
                style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  color: const Color.fromARGB(255, 98, 211, 0),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                "₹5,000",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  color: const Color.fromARGB(255, 98, 211, 0),
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 5.h),
              Text(
                "2 months setteled",
                style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  color: const Color.fromARGB(255, 98, 211, 0),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
