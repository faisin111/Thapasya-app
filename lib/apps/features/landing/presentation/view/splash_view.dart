import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thapasya/apps/student/features/global/presentation/providers/global_providers.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/theme/app_theme.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await Future.wait([
        ref.read(globalProvider.notifier).getCources(),
        Future.delayed(const Duration(seconds: 3)),
      ]);

      if (!mounted) return;

      context.go(AppRoutes.authbridge);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/svg/app_icon.svg", height: 100),

            Text(
              "Thapasya",
              style: GoogleFonts.inter(
                fontSize: 26.sp,
                color: AppTheme.whiteColor,
                fontWeight: FontWeight(800),
              ),
            ),
            SizedBox(height: 10.h),
            Text(
              "Dance Academy",
              style: GoogleFonts.inter(
                fontSize: 12.sp,
                color: AppTheme.whiteColor,
                fontWeight: FontWeight(300),
              ),
            ),
            SizedBox(height: 50.h),
            SizedBox(
              width: 30.w,
              height: 30.h,
              child: CircularProgressIndicator(
                color: AppTheme.whiteColor,
                strokeWidth: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
