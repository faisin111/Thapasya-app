import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thapasya/core/theme/app_theme.dart';

Widget detailsCard(Widget child) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 20.w),
    padding: EdgeInsets.all(20.w),
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
    child: child,
  );
}

Widget detailsItem(String title, String details) {
  return Column(
    children: [
      Row(
        children: [
          Text(
            title,
            style: GoogleFonts.inter(
              fontSize: 13.sp,
              color: const Color.fromARGB(255, 142, 142, 142),
            ),
          ),
          SizedBox(width: 15.w,),
          Expanded(
            child: Align(
              alignment: AlignmentGeometry.centerRight,
              child: Text(
                details,
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
      Divider(color: const Color.fromARGB(255, 234, 234, 234)),
      SizedBox(height: 15.h),
    ],
  );
}
