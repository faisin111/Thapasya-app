import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:thapasya/apps/student/features/alerts/presentation/provider/alerts_provider.dart';
import 'package:thapasya/apps/student/features/alerts/presentation/widget/items.dart';
import 'package:thapasya/apps/student/features/alerts/presentation/widget/loading.dart';
import 'package:thapasya/apps/student/features/alerts/presentation/widget/notification_card.dart';
import 'package:thapasya/apps/widgets/cards.dart';
import 'package:thapasya/apps/widgets/shimmer_box.dart';
import 'package:thapasya/core/theme/app_theme.dart';

class AlertsView extends ConsumerStatefulWidget {
  const AlertsView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AlertsViewState();
}

class _AlertsViewState extends ConsumerState<AlertsView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(alertsProvider.notifier).getALerts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final alerts = ref.watch(alertsProvider);
    debugPrint("${alerts.error}");
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: 20.h),
        mainCard(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  HugeIcon(
                    icon: HugeIcons.strokeRoundedNotification01,
                    strokeWidth: 2,
                    size: 40.sp,
                    color: AppTheme.whiteColor,
                  ),
                  SizedBox(width: 10.w),
                  SizedBox(
                    width: 150.w,
                    child: Text(
                      "Alerts & Notification",
                      style: GoogleFonts.inter(
                        fontSize: 20.sp,
                        color: AppTheme.whiteColor,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10.h),
              Text(
                "Important updates from academy administration",
                style: GoogleFonts.inter(
                  fontSize: 13.sp,
                  color: AppTheme.whiteColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        // SizedBox(height: 20.h),
        Padding(
          padding: EdgeInsets.all(20.w),
          child: alerts.loading
              ? shimmerBox(height: 35.h, radius: 50)
              : ItemBar(),
        ),
        alerts.loading
            ? loadingAlerts()
            : detailsCard(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(alerts.filtered.length, (i) {
                    return Column(
                      children: [
                        notificationCard(alerts.filtered[i]),
                        if (alerts.filtered.length - 1 != i)
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 15.h),
                            child: Divider(
                              color: const Color.fromARGB(255, 223, 223, 223),
                            ),
                          ),
                      ],
                    );
                  }),
                ),
              ),
      ],
    );
  }
}
