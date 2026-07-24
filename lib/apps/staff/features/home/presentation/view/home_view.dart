import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thapasya/apps/widgets/cards.dart';
import 'package:thapasya/core/theme/app_theme.dart';

class HomeViewStaff extends ConsumerStatefulWidget {
  const HomeViewStaff({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewStaffState();
}

List<String> items = [
  "Bharathanatyam - level 3",
  "Bharathanatyam - level 1",
  "kurichupd - level 1",
];
int selectedIndex = 0;

class _HomeViewStaffState extends ConsumerState<HomeViewStaff> {
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
              Text(
                "Good Morning",
                style: GoogleFonts.inter(
                  fontSize: 13.sp,
                  color: AppTheme.whiteColor,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                "Midhlaj",
                style: GoogleFonts.inter(
                  fontSize: 27.sp,
                  color: AppTheme.whiteColor,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 2.h),
              Text(
                "Senior Faculty - Bharatanatyam",
                style: GoogleFonts.inter(
                  fontSize: 13.sp,
                  color: AppTheme.whiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 15.h),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(items.length, (v) {
                    bool isSelect = selectedIndex == v;
                    final item = items[v];

                    return GestureDetector(
                      onTap: () async {
                        setState(() {
                          selectedIndex = v;
                          isSelect = selectedIndex == v;
                        });
                        // // ref.read(globalCourceProvider.notifier).state =
                        // //     item.name;
                        // await ref
                        //     .read(homeProvider.notifier)
                        //     .getDash(id: item.id, name: item.name);
                        // await ref
                        //     .read(globalProvider.notifier)
                        //     .getAttendance(item.id);
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.h,
                          horizontal: 15.w,
                        ),
                        decoration: BoxDecoration(
                          color: isSelect
                              ? AppTheme.whiteColor
                              : AppTheme.primaryColor,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          item,
                          style: GoogleFonts.inter(
                            fontSize: 12.sp,
                            color: isSelect
                                ? AppTheme.primaryColor
                                : AppTheme.whiteColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              SizedBox(height: 15.h),
              Text(
                "Selected Cource",
                style: GoogleFonts.inter(
                  fontSize: 13.sp,
                  color: AppTheme.whiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                items[selectedIndex],
                style: GoogleFonts.inter(
                  fontSize: 13.sp,
                  color: AppTheme.whiteColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Afternoon Batch",
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
        // GridView(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10,childAspectRatio: 1.6)),
        detailsCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Class Shcedule",
                style: GoogleFonts.inter(
                  fontSize: 17.sp,
                  color: const Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(height: 20.h),
              // home.dshData!.shedules!.isEmpty
              //     ? Text(
              //         "No classes currently sheduled",
              //         style: GoogleFonts.inter(
              //           fontSize: 14.sp,
              //           color: const Color.fromARGB(255, 0, 0, 0),
              //           fontWeight: FontWeight.w600,
              //         ),
              //       )
              //     : Column(
              //         children: List.generate(
              //           home.dshData!.shedules!.length,
              //           (i) {
              //             final item = home.dshData!.shedules![i];
              //             return Column(
              //               children: [
              //                 classItem(
              //                   "Monday",
              //                   "Bharathanatyam",
              //                   "5:00 PM",
              //                 ),
              //                 SizedBox(height: 25.h),
              //               ],
              //             );
              //           },
              //         ),
              //       ),
              // classItem("Monday", "Bharathanatyam", "5:00 PM"),

              // classItem("Monday", "Bharathanatyam", "5:00 PM"),
              // SizedBox(height: 20.h),
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
                    Text(
                      "Recent Class Logs",
                      style: GoogleFonts.inter(
                        fontSize: 17.sp,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    Text(
                      "Updates from your instructor",
                      style: GoogleFonts.inter(
                        fontSize: 13.sp,
                        color: const Color.fromARGB(255, 135, 135, 135),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(color: const Color.fromARGB(255, 239, 239, 239)),
              // Column(
              //   children: List.generate(
              //     home.dshData!.recentLogs!.length,
              //     (i) {
              //       final data = home.dshData!.recentLogs![i];
              //       return Column(
              //         children: [
              //           logsItem(
              //             data.date,
              //             data.title,
              //             tapped,
              //             data.summary,
              //             ref,
              //           ),
              //           if (i != home.dshData!.recentLogs!.length - 1)
              //             Divider(
              //               color: const Color.fromARGB(
              //                 255,
              //                 237,
              //                 237,
              //                 237,
              //               ),
              //             ),
              //         ],
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
