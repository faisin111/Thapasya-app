import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:thapasya/apps/student/features/alerts/presentation/view/alerts_view.dart';
import 'package:thapasya/apps/student/features/attendance/presentation/view/attendance_view.dart';
import 'package:thapasya/apps/student/features/fees/presentation/view/fees_view.dart';
import 'package:thapasya/apps/student/features/global/presentation/providers/global_providers.dart';
import 'package:thapasya/apps/student/features/home/presentation/view/home_view.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/theme/app_theme.dart';

import 'package:thapasya/core/constants/dashboard_constants.dart';

class BottomAppBarView extends StatefulWidget {
  const BottomAppBarView({super.key});

  @override
  State<BottomAppBarView> createState() => _BottomAppBarViewState();
}

class _BottomAppBarViewState extends State<BottomAppBarView> {
  List<Widget> pages = [HomeView(), AttendanceView(), AlertsView(), FeesView()];
  int index = 0;

  @override
  void initState() {
    super.initState();
    debugPrint("bottom is opened");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: SvgPicture.asset("assets/svg/app_icon.svg"),
        ),
        leadingWidth: 40,
        title: Text(
          DashboardConstants.appTitle,
          style: GoogleFonts.inter(
            fontSize: 22.sp,
            color: AppTheme.whiteColor,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.push(AppRoutes.profile);
            },
            icon: HugeIcon(icon: HugeIcons.strokeRoundedUser),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20.sp,
        backgroundColor: AppTheme.whiteColor,
        elevation: 0,
        selectedItemColor: AppTheme.primaryColor,
        unselectedItemColor: AppTheme.greyColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: HugeIcon(icon: HugeIcons.strokeRoundedHome09, strokeWidth: 2),
            label: DashboardConstants.navHome,
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedCalendar03,
              strokeWidth: 2,
            ),
            label: DashboardConstants.navAttend,
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedNotification01,
              strokeWidth: 2,
            ),
            label: DashboardConstants.navAlerts,
          ),
          BottomNavigationBarItem(
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedCreditCard,
              strokeWidth: 2,
            ),
            label: DashboardConstants.navFees,
          ),
        ],
      ),
      body: pages[index],
    );
  }
}
