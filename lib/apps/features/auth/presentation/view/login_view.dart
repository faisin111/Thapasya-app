import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thapasya/apps/features/auth/presentation/provider/auth_providers.dart';
import 'package:thapasya/apps/features/auth/presentation/state/auth_state.dart';
import 'package:thapasya/apps/features/auth/presentation/widget/text_field.dart';

import 'package:thapasya/apps/student/features/global/presentation/providers/global_providers.dart';
import 'package:thapasya/core/routes/app_routes.dart';
import 'package:thapasya/core/theme/app_theme.dart';
import 'package:thapasya/core/utils/app_snacbar.dart';
import 'package:thapasya/core/constants/auth_constants.dart';

class LoginView extends ConsumerWidget {
  LoginView({super.key});

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AuthState>(authProvider, (pre, next) async {
      if (next.loading) return;
      if (next.error != null) {
        AppFlushbar.error(context, title: AuthConstants.loginFailedTitle, message: "${next.error}");
      }
      if (next.success) {
        AppFlushbar.success(
          context,
          title: AuthConstants.loginSuccessTitle,
          message: AuthConstants.loginSuccessMessage,
        );
        await ref.read(globalProvider.notifier).getCources();
        await Future.delayed(Duration(seconds: 2));
        if (!context.mounted) return;
        if (next.role == Role.teacher) {
          context.go(AppRoutes.staffBottom);
        } else {
          context.go(AppRoutes.bottom);
        }
      }
    });
    final state = ref.watch(authProvider);
    return Scaffold(
      backgroundColor: AppTheme.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 70.h,
                  child: Row(
                    children: [
                      SizedBox(width: 20.w),
                      Icon(
                        Icons.arrow_back,
                        color: AppTheme.whiteColor,
                        size: 20.sp,
                      ),
                      Text(
                        AuthConstants.backToHome,
                        style: GoogleFonts.inter(
                          fontSize: 15.sp,
                          color: AppTheme.whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // height: 650.h,
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  decoration: BoxDecoration(
                    color: AppTheme.primaryColor,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: .25),
                        blurRadius: 20,
                        offset: Offset(0, 8),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Column(
                          children: [
                            SizedBox(height: 37.h),
                            CircleAvatar(
                              radius: 35,
                              backgroundColor: const Color.fromARGB(
                                255,
                                255,
                                67,
                                67,
                              ),
                              child: Center(
                                child: SvgPicture.asset(
                                  "assets/svg/app_icon.svg",
                                  width: 45.sp,
                                ),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              AuthConstants.appName,
                              style: GoogleFonts.inter(
                                fontSize: 27.sp,
                                color: AppTheme.whiteColor,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 5.h),
                            Text(
                              AuthConstants.appSubtitle,
                              style: GoogleFonts.inter(
                                fontSize: 13.sp,
                                color: AppTheme.whiteColor,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: 37.h),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        decoration: BoxDecoration(
                          color: AppTheme.whiteColor,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            Text(
                              AuthConstants.welcomeBack,
                              style: GoogleFonts.inter(
                                fontSize: 25.sp,
                                color: const Color.fromARGB(255, 0, 0, 0),
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(height: 15),
                            TextFieldAuth(
                              controller: username,
                              label: AuthConstants.userNameLabel,
                              hint: AuthConstants.userNameHint,
                              suffix: Icons.person_outlined,
                            ),
                            SizedBox(height: 10),
                            TextFieldAuth(
                              controller: password,
                              label: AuthConstants.passwordLabel,
                              hint: AuthConstants.passwordHint,
                              suffix: Icons.lock_outlined,
                              isPassword: true,
                            ),
                            SizedBox(height: 15),
                            AnimatedOpacity(
                              opacity: state.loading ? .5 : 1,
                              duration: Duration(milliseconds: 200),
                              child: IgnorePointer(
                                ignoring: state.loading,
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_key.currentState!.validate()) {
                                      await ref
                                          .read(authProvider.notifier)
                                          .login(username.text, password.text);
                                    }
                                  },
                                  child: Text(
                                    state.loading ? AuthConstants.signingButton : AuthConstants.loginButton,
                                    style: GoogleFonts.poppins(
                                      color: AppTheme.whiteColor,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              AuthConstants.credentialDisclaimer,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 13.sp,

                                color: const Color.fromARGB(255, 146, 146, 146),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  AuthConstants.needHelpContact,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.inter(
                    fontSize: 13.sp,

                    color: AppTheme.whiteColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
