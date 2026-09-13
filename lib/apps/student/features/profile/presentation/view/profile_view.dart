import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thapasya/apps/student/features/profile/presentation/provider/profile_provider.dart';
import 'package:thapasya/apps/student/features/profile/presentation/widget/details_card.dart';
import 'package:thapasya/apps/student/features/profile/presentation/widget/error_view.dart';
import 'package:thapasya/apps/student/features/profile/presentation/widget/loading_view.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/theme/app_theme.dart';
import 'package:thapasya/core/utils/app_snacbar.dart';

import 'package:thapasya/core/constants/profile_constants.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final p = ref.watch(profileProvider);
    ref.listen(profileProvider, (prev, next) async {
      if (next.loading) return;
      if (next.error != null) {
        AppFlushbar.error(context, title: ProfileConstants.logoutFailedTitle, message: "${next.error}");
      }
      if (next.success) {
        AppFlushbar.success(
          context,
          title: ProfileConstants.logoutSuccessTitle,
          message: ProfileConstants.logoutSuccessMessage,
        );
        await Future.delayed(Duration(seconds: 2));
        if (!context.mounted) return;
        context.go(AppRoutes.login);
      }
    });
    final profile = ref.watch(getProfileProvider);
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await ref.read(profileProvider.notifier).logoutAcc();
            },
            icon: Icon(Icons.settings_outlined),
          ),
        ],
        centerTitle: true,
        title: Text(
          ProfileConstants.profileTitle,
          style: GoogleFonts.inter(
            fontSize: 22.sp,
            color: AppTheme.whiteColor,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: profile.when(
        data: (data) => ListView(
          physics: BouncingScrollPhysics(),
          children: [
            SizedBox(height: 20.h),
            Container(
              // height: 240,
              margin: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  SizedBox(height: 30.h),
                  CircleAvatar(
                    radius: 39.r,
                    backgroundColor: const Color.fromARGB(90, 255, 255, 255),
                    child: Center(
                      child: Text(
                        data.name[0].toUpperCase(),
                        style: GoogleFonts.inter(
                          fontSize: 30.sp,
                          color: AppTheme.whiteColor,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    data.name,
                    style: GoogleFonts.inter(
                      fontSize: 27.sp,
                      color: AppTheme.whiteColor,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Text(
                    ProfileConstants.portalSubtitle,
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      color: AppTheme.whiteColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(height: 30.h),
                ],
              ),
            ),
            SizedBox(height: 20.h),
            detailsCard(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ProfileConstants.personalInfoTitle,
                    style: GoogleFonts.inter(
                      fontSize: 17.sp,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  detailsItem(ProfileConstants.nameLabel, data.name),
                  detailsItem(ProfileConstants.dobLabel, ProfileConstants.dobUnknown),
                  detailsItem(ProfileConstants.phoneLabel, data.phone),
                  detailsItem(ProfileConstants.emailLabel, data.email),
                  Row(
                    children: [
                      Text(
                        ProfileConstants.addressLabel,
                        style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          color: const Color.fromARGB(255, 142, 142, 142),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: Align(
                          alignment: AlignmentGeometry.centerRight,
                          child: Text(
                            data.address,
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
                ],
              ),
            ),
            SizedBox(height: 20.h),
            detailsCard(
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ProfileConstants.parentDetailsTitle,
                    style: GoogleFonts.inter(
                      fontSize: 17.sp,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  detailsItem(ProfileConstants.nameLabel, data.parent.name),

                  detailsItem(ProfileConstants.emailLabel, data.parent.email),
                  Row(
                    children: [
                      Text(
                        ProfileConstants.phoneLabel,
                        style: GoogleFonts.inter(
                          fontSize: 13.sp,
                          color: const Color.fromARGB(255, 142, 142, 142),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: Align(
                          alignment: AlignmentGeometry.centerRight,
                          child: Text(
                            data.parent.phone,
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
                ],
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: AnimatedOpacity(
                duration: Duration(milliseconds: 200),
                opacity: p.loading ? .5 : 1,
                curve: Curves.easeInOut,
                child: IgnorePointer(
                  ignoring: p.loading,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      await ref.read(profileProvider.notifier).logoutAcc();
                    },
                    icon: Icon(Icons.logout_outlined),
                    label: Text(
                      p.loading ? ProfileConstants.logoutProcessing : ProfileConstants.logoutButton,
                      style: GoogleFonts.poppins(
                        color: AppTheme.whiteColor,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
        error: (error, _) => Center(child: ErrorView(error: error.toString())),
        loading: () => LoadingViewProfile(),
      ),
    );
  }
}
