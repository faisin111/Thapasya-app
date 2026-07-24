import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:thapasya/apps/student/features/attendance/presentation/provider/attendance_provider.dart';
import 'package:thapasya/apps/student/features/attendance/presentation/widget/calendar.dart';
import 'package:thapasya/apps/student/features/attendance/presentation/widget/items.dart';
import 'package:thapasya/apps/student/features/global/presentation/providers/global_providers.dart';
import 'package:thapasya/apps/student/features/home/presentation/providers/home_provider.dart';
import 'package:thapasya/apps/widgets/cards.dart';
import 'package:thapasya/core/theme/app_theme.dart';

class AttendanceView extends ConsumerStatefulWidget {
  const AttendanceView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AttendanceViewState();
}

class _AttendanceViewState extends ConsumerState<AttendanceView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(attendanceProvider.notifier).getMonthlyDetails();
      ref.read(attendanceProvider.notifier).getMonthlyAtt();
    });
  }

  @override
  Widget build(BuildContext context) {
    final cource = ref.watch(globalCourceProvider);
    final attendance = ref.watch(globalProvider);
    final att = ref.watch(attendanceProvider);
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: 20.h),
        mainCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Attendance",
                style: GoogleFonts.inter(
                  fontSize: 20.sp,
                  color: AppTheme.whiteColor,
                  fontWeight: FontWeight.w800,
                ),
              ),

              SizedBox(height: 10.h),
              Text(
                cource,
                style: GoogleFonts.inter(
                  fontSize: 13.sp,
                  color: AppTheme.whiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        mainCard(
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircularPercentIndicator(
                center: Text(
                  "${attendance.percentage.toStringAsFixed(0)}%",
                  style: GoogleFonts.inter(
                    fontSize: 20.sp,
                    color: AppTheme.whiteColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                radius: 50,
                lineWidth: 8,
                percent: attendance.percentage / 100,
                progressColor: AppTheme.whiteColor,
                backgroundColor: const Color.fromARGB(91, 255, 255, 255),
                circularStrokeCap: CircularStrokeCap.round,
              ),
              SizedBox(width: 20.w),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Overall Attendance",
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        color: AppTheme.whiteColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),

                    Text(
                      "${attendance.presentDays} present out of ${attendance.attendance?.history.length} classes",
                      style: GoogleFonts.inter(
                        fontSize: 13.sp,
                        color: AppTheme.whiteColor,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    Row(
                      children: [
                        Icon(
                          Icons.check_circle_outline,
                          color: AppTheme.whiteColor,
                          size: 15.sp,
                        ),
                        SizedBox(width: 2.w),
                        Text(
                          "Good Standing",
                          style: GoogleFonts.inter(
                            fontSize: 10.sp,
                            color: AppTheme.whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),

        AttendanceCalendar(),
        SizedBox(height: 20.h),
        att.loading
            ? detailsCard(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Monthly Breakdown",
                      style: GoogleFonts.inter(
                        fontSize: 17.sp,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ],
                ),
              )
            : detailsCard(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Monthly Breakdown",
                      style: GoogleFonts.inter(
                        fontSize: 17.sp,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 10.h,),
                    Column(
                      children: List.generate(att.monthly.length, (i) {
                        return Column(
                          children: [
                            monthlyItem(att.monthly[i]),
                            if (att.monthly.length - 1 != i)
                              SizedBox(height: 5.h),
                          ],
                        );
                      }),
                    ),

                    // monthlyItem(),
                    // SizedBox(height: 5.h),
                    // monthlyItem(),
                    // SizedBox(height: 5.h),
                    // monthlyItem(),
                    // SizedBox(height: 5.h),
                    // monthlyItem(),
                    // SizedBox(height: 5.h),
                    // monthlyItem(),
                  ],
                ),
              ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
