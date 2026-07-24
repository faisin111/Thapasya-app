import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
            color: const Color.fromARGB(255, 86, 86, 86).withOpacity(.25),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
      ],
    ),
    child: child,
  );
}

Widget mainCard(Widget child) {
  return Container(
    padding: EdgeInsets.all(20.w),
    margin: EdgeInsets.symmetric(horizontal: 20.w),
    decoration: BoxDecoration(
      color: AppTheme.primaryColor,
      borderRadius: BorderRadius.circular(20),
    ),
    child: child,
  );
}
