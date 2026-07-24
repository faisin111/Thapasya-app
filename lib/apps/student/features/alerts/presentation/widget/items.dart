import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thapasya/apps/student/features/alerts/presentation/provider/alerts_provider.dart';
import 'package:thapasya/core/theme/app_theme.dart';

class ItemBar extends StatefulWidget {
  const ItemBar({super.key});

  @override
  State<ItemBar> createState() => _ItemBarState();
}

class _ItemBarState extends State<ItemBar> {
  int indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final a = ref.watch(alertsProvider).types;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(a.length, (index) {
              bool isSeleted = indexSelected == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    indexSelected = index;
                  });
                  if (indexSelected != 0) {
                    ref
                        .read(alertsProvider.notifier)
                        .getFiltered(a[indexSelected]);
                  } else {
                    ref.read(alertsProvider.notifier).getALerts();
                  }
                },
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeInOutBack,
                  margin: EdgeInsets.only(right: 10.w),
                  padding: EdgeInsets.symmetric(
                    horizontal: 15.w,
                    vertical: 8.h,
                  ),
                  decoration: BoxDecoration(
                    color: isSeleted
                        ? AppTheme.primaryColor
                        : AppTheme.whiteColor,
                    borderRadius: BorderRadius.circular(50),
                    border: !isSeleted
                        ? Border.all(
                            width: 1,
                            color: const Color.fromARGB(255, 222, 222, 222),
                          )
                        : null,
                  ),
                  child: Text(
                    a[index],
                    style: GoogleFonts.inter(
                      fontSize: 13.sp,
                      fontWeight: FontWeight(550),
                      color: isSeleted ? AppTheme.whiteColor : Colors.black,
                    ),
                  ),
                ),
              );
            }),
          ),
        );
      },
    );
  }
}
