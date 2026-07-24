import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thapasya/apps/student/features/attendance/data/models/break_down_model.dart';

Widget monthlyItem(BreakDownModel monthly) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            monthly.month,
            style: GoogleFonts.inter(fontSize: 13.sp, color: Colors.black),
          ),
          Text(
            "${monthly.presentDays}/${monthly.totalDays}",
            style: GoogleFonts.inter(
              fontSize: 13.sp,
              color: const Color.fromARGB(255, 87, 218, 0),
            ),
          ),
        ],
      ),
      SizedBox(height: 5.h),
      LayoutBuilder(
        builder: (context, constraints) {
          final value = monthly.totalDays == 0
              ? 0.0
              : monthly.totalDays / monthly.presentDays;
          return Stack(
            children: [
              Container(
                height: 10.h,
                width: constraints.maxWidth,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 229, 229, 229),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Container(
                height: 10.h,
                width: constraints.maxWidth * value,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 194, 6),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ],
          );
        },
      ),
    ],
  );
}
