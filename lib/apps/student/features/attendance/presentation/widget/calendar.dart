import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:thapasya/apps/student/features/attendance/presentation/provider/attendance_provider.dart';

class AttendanceCalendar extends StatelessWidget {
  AttendanceCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 86, 86, 86).withOpacity(.25),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Consumer(
        builder: (context, ref, child) {
          final c = ref.watch(attendanceProvider);
          final today = ref.watch(focusedDayProvider);
          final month = DateFormat("MMMM yyyy").format(today);
          return Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      ref.read(focusedDayProvider.notifier).state = DateTime(
                        today.year,
                        today.month - 1,
                      );
                    },
                    icon: const Icon(Icons.chevron_left),
                  ),
                  const Spacer(),
                  Text(
                    month,
                    style: GoogleFonts.poppins(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      ref.read(focusedDayProvider.notifier).state = DateTime(
                        today.year,
                        today.month + 1,
                      );
                    },
                    icon: const Icon(Icons.chevron_right),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text("2 weeks"),
                ),
              ),
              const SizedBox(height: 20),
              TableCalendar(
                firstDay: DateTime.utc(2020),
                lastDay: DateTime.utc(2035),
                focusedDay: today,
                headerVisible: false,
                daysOfWeekHeight: 30,
                rowHeight: 42,
                calendarFormat: CalendarFormat.month,
                availableGestures: AvailableGestures.none,
                selectedDayPredicate: (_) => false,

                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) {
                    final status =
                        c.attendance[DateTime(day.year, day.month, day.day)];

                    Color? bg;
                    Color textColor = Colors.black87;

                    switch (status) {
                      case "present":
                        bg = const Color(0xffDDFBE6);
                        textColor = Colors.green;
                        break;

                      case "absent":
                        bg = const Color(0xffFDE2E2);
                        textColor = Colors.red;
                        break;

                      case "holiday":
                        bg = const Color(0xffFFF2D8);
                        textColor = Colors.orange;
                        break;
                      case "late":
                        bg = const Color.fromARGB(255, 255, 246, 216);
                        textColor = const Color.fromARGB(255, 255, 204, 0);
                        break;
                      default:
                        bg = Colors.transparent;
                    }

                    return Center(
                      child: Container(
                        width: 38.w,
                        height: 36.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: bg,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${day.day}',
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  },

                  outsideBuilder: (_, __, ___) => const SizedBox.shrink(),
                ),

                calendarStyle: const CalendarStyle(
                  outsideDaysVisible: false,
                  todayDecoration: BoxDecoration(color: Colors.transparent),
                  selectedDecoration: BoxDecoration(color: Colors.transparent),
                ),

                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekdayStyle: TextStyle(color: Colors.grey, fontSize: 13),
                  weekendStyle: TextStyle(color: Colors.grey, fontSize: 13),
                ),
              ),

              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _Legend(color: Colors.green, text: "Present"),

                  _Legend(color: Colors.orange, text: "Holiday"),
                ],
              ),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  _Legend(
                    color: const Color.fromARGB(255, 255, 204, 0),
                    text: "Late",
                  ),
                  _Legend(color: Colors.red, text: "Absent"),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Legend extends StatelessWidget {
  final Color color;
  final String text;

  const _Legend({required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(radius: 5.sp, backgroundColor: color),
        SizedBox(width: 6.w),
        Text(text, style: TextStyle(fontSize: 13.sp)),
      ],
    );
  }
}
