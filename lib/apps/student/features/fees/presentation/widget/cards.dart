import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thapasya/apps/student/features/profile/presentation/widget/details_card.dart';

Widget historyCard() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "February 2026",
            style: GoogleFonts.inter(
              fontSize: 14.sp,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "₹2,500",
            style: GoogleFonts.inter(
              fontSize: 15.sp,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Paid on Feb 3, 2026",
            style: GoogleFonts.inter(
              fontSize: 12.sp,
              color: const Color.fromARGB(255, 118, 118, 118),
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
            decoration: BoxDecoration(
              color: const Color.fromARGB(55, 149, 255, 0),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Text(
              "Paid",
              style: GoogleFonts.inter(
                fontSize: 10.sp,
                fontWeight: FontWeight(550),
                color: const Color.fromARGB(255, 120, 205, 0),
              ),
            ),
          ),
        ],
      ),
      Text(
        "RCP-011",
        style: GoogleFonts.inter(
          fontSize: 12.sp,
          color: const Color.fromARGB(255, 161, 161, 161),
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}

Widget paymentCards() {
  return detailsCard(
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Accepted Payment Methods",
          style: GoogleFonts.inter(
            fontSize: 13.sp,
            color: const Color.fromARGB(255, 0, 0, 0),
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5.h),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 237, 237),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                "Paid",
                style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  fontWeight: FontWeight(550),
                  color: const Color.fromARGB(255, 100, 100, 100),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 237, 237),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                "Paid",
                style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  fontWeight: FontWeight(550),
                  color: const Color.fromARGB(255, 100, 100, 100),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 237, 237),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                "Paid",
                style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  fontWeight: FontWeight(550),
                  color: const Color.fromARGB(255, 100, 100, 100),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 10.w),
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 237, 237),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Text(
                "Paid",
                style: GoogleFonts.inter(
                  fontSize: 10.sp,
                  fontWeight: FontWeight(550),
                  color: const Color.fromARGB(255, 100, 100, 100),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
