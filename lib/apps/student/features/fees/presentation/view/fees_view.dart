import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thapasya/apps/student/features/fees/presentation/widget/cards.dart';
import 'package:thapasya/apps/student/features/fees/presentation/widget/items.dart';
import 'package:thapasya/apps/widgets/cards.dart';
import 'package:thapasya/core/theme/app_theme.dart';

class FeesView extends ConsumerStatefulWidget {
  const FeesView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FeesViewState();
}

class _FeesViewState extends ConsumerState<FeesView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        Padding(
          padding: EdgeInsets.all(20.w),
          child: Text(
            "Fess & Payments",
            style: GoogleFonts.inter(
              fontSize: 20.sp,
              color: const Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: const Color.fromARGB(20, 255, 0, 0),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1,
              color: const Color.fromARGB(255, 255, 157, 157),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                child: Icon(
                  Icons.info_outline_rounded,
                  size: 22.sp,
                  color: AppTheme.primaryColor,
                ),
                radius: 23.r,
                backgroundColor: const Color.fromARGB(255, 239, 160, 160),
              ),
              SizedBox(width: 13.w),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fee Due Reminder",
                      style: GoogleFonts.inter(
                        fontSize: 15.sp,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    SizedBox(height: 3.h),

                    Text(
                      "March 2026 fee of ₹2,000 is due by march",
                      style: GoogleFonts.inter(
                        fontSize: 13.sp,
                        color: const Color.fromARGB(255, 255, 0, 0),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        pendingPaidcard(),
      
        Padding(
             padding: EdgeInsets.all(20.w),
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "₹ Pay March Fee - ₹2,500",
              style: GoogleFonts.poppins(
                color: AppTheme.whiteColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
     
        detailsCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Payment History",
                style: GoogleFonts.inter(
                  fontSize: 17.sp,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w800,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Divider(color: const Color.fromARGB(255, 223, 223, 223)),
              ),
              historyCard(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Divider(color: const Color.fromARGB(255, 223, 223, 223)),
              ),
              historyCard(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 15.h),
                child: Divider(color: const Color.fromARGB(255, 223, 223, 223)),
              ),
              historyCard(),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        detailsCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Fee Structure",
                style: GoogleFonts.inter(
                  fontSize: 14.sp,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mothly Tution",
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: const Color.fromARGB(255, 132, 132, 132),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "2,500",
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Payment Due",
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: const Color.fromARGB(255, 132, 132, 132),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "25th of each month",
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Late Fee",
                    style: GoogleFonts.inter(
                      fontSize: 12.sp,
                      color: const Color.fromARGB(255, 132, 132, 132),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    "100 after due date",
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        paymentCards(),
        SizedBox(height: 20.h),
      ],
    );
  }
}
