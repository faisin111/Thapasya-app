import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:thapasya/apps/features/auth/presentation/view/login_view.dart';
import 'package:thapasya/apps/features/landing/presentation/provider/landing_provider.dart';
import 'package:thapasya/apps/staff/features/bottom/presentation/view/bottom_app_bar_view.dart';

import 'package:thapasya/apps/student/features/bottom/presentation/view/bottom_app_bar_view.dart';

class AuthBridg extends StatelessWidget {
  const AuthBridg({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final check = ref.watch(checkAuthProvider);
        return check.when(
          data: (data) {
            if (data["role"] == "student" && data["logging"]) {
              return BottomAppBarView();
            } else if (data["role"] == "staff" && data["logging"]) {
              return BottomBarStaffView();
            }
            return BottomBarStaffView();
          },
          error: (error, _) {
            return LoginView();
          },
          loading: () {
            return SizedBox();
          },
        );
      },
    );
  }
}
