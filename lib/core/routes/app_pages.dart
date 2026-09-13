import 'package:go_router/go_router.dart';
import 'package:thapasya/apps/features/auth/presentation/view/login_view.dart';
import 'package:thapasya/apps/features/landing/presentation/view/splash_view.dart';
import 'package:thapasya/apps/student/features/bottom/presentation/view/bottom_app_bar_view.dart';

import 'package:thapasya/apps/staff/features/bottom/presentation/view/bottom_app_bar_view.dart';
import 'package:thapasya/apps/student/features/profile/presentation/view/profile_view.dart';
import 'package:thapasya/core/routes/app_routes.dart';

final GoRouter router = GoRouter(
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(path: AppRoutes.splash, builder: (context, state) => SplashView()),
    GoRoute(path: AppRoutes.login, builder: (context, state) => LoginView()),
    GoRoute(
      path: AppRoutes.bottom,
      builder: (context, state) => BottomAppBarView(),
    ),
    GoRoute(
      path: AppRoutes.staffBottom,
      builder: (context, state) => BottomBarStaffView(),
    ),
    GoRoute(
      path: AppRoutes.profile,
      builder: (context, state) => ProfileView(),
    ),
  ],
);
