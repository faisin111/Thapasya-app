import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thapasya/apps/student/features/alerts/data/models/notification_model.dart';
import 'package:thapasya/core/theme/app_theme.dart';

Widget notificationCard(NotificationModel model) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      getAvatar(model.type),
      SizedBox(width: 13.w),
      Flexible(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(
                    model.title,
                    style: GoogleFonts.inter(
                      fontSize: 15.sp,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                CircleAvatar(
                  backgroundColor: AppTheme.primaryColor,
                  radius: 5.r,
                ),
              ],
            ),
            SizedBox(height: 3.h),
            getPriority(model.title),
            SizedBox(height: 3.h),
            Text(
              model.content,
              style: GoogleFonts.inter(
                fontSize: 13.sp,
                color: const Color.fromARGB(255, 0, 0, 0),
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 6.h),
            Text(
              model.timeAgo,
              style: GoogleFonts.inter(
                fontSize: 13.sp,
                color: const Color.fromARGB(255, 179, 179, 179),
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

Widget getAvatar(String type) {
  switch (type) {
    case "all":
      return CircleAvatar(
        backgroundColor: Color.fromARGB(255, 214, 237, 255),
        radius: 23.r,
        child: Icon(
          Icons.campaign_rounded,
          size: 22.sp,
          color: Color(0xff2196F3),
        ),
      );
    case "students":
      return CircleAvatar(
        backgroundColor: Color.fromARGB(255, 211, 255, 213),
        radius: 23.r,
        child: Icon(
          Icons.school_rounded,
          size: 22.sp,
          color: Color(0xff4CAF50),
        ),
      );
    case "course":
      return CircleAvatar(
        backgroundColor: Color.fromARGB(255, 249, 214, 255),
        radius: 23.r,
        child: Icon(
          Icons.menu_book_rounded,
          size: 22.sp,
          color: Color(0xff9C27B0),
        ),
      );
  }

  return CircleAvatar(
    backgroundColor: Colors.grey,
    radius: 23.r,
    child: Icon(Icons.notifications_rounded, size: 22.sp, color: Colors.grey),
  );
}

Widget getPriority(String content) {
  String i = content.toLowerCase();
  if (i.contains("holiday"))
    return infoBox(
      "Warning",
      const Color.fromARGB(255, 255, 242, 224),
      Colors.orange,
    );
  if (i.contains("maintenance"))
    return infoBox(
      "Urgent",
      const Color.fromARGB(255, 255, 225, 222),
      Colors.red,
    );
  if (i.contains("assessment"))
    return infoBox(
      "Important",
      const Color.fromARGB(255, 255, 247, 222),
      Colors.amber,
    );
  if (i.contains("festival"))
    return infoBox(
      "Event",
      const Color.fromARGB(255, 250, 224, 255),
      Colors.purple,
    );

  return infoBox("Info", const Color.fromARGB(255, 220, 240, 255), Colors.blue);
}

Widget infoBox(String title, Color bg, Color text) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
    decoration: BoxDecoration(
      color: bg,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Text(
      title,
      style: GoogleFonts.inter(
        fontSize: 13.sp,
        fontWeight: FontWeight(550),
        color: text,
      ),
    ),
  );
}
