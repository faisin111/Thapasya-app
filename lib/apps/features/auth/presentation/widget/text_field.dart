import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thapasya/apps/features/auth/presentation/provider/auth_providers.dart';

import 'package:thapasya/core/theme/app_theme.dart';

class TextFieldAuth extends ConsumerWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData suffix;
  final bool isPassword;
  const TextFieldAuth({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.suffix,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final visi = ref.watch(visibiltyProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.inter(fontSize: 13.sp, color: Colors.black),
        ),
        SizedBox(height: 5.h),
        TextFormField(
          controller: controller,
          obscureText: isPassword ? visi : false,
          validator: (value) {
            if(value!.trim().isEmpty) return "Fill this field";
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: AppTheme.whiteColor,
            prefixIcon: Icon(suffix, color: AppTheme.greyColor, size: 23.sp),
            hintText: hint,

            suffixIcon: isPassword
                ? IconButton(
                    onPressed: () {
                      ref.read(visibiltyProvider.notifier).state = !visi;
                    },
                    icon: Icon(
                      visi ? Icons.visibility_off : Icons.visibility,
                      color: AppTheme.primaryColor,
                      size: 25.sp,
                    ),
                  )
                : null,
            hintStyle: GoogleFonts.poppins(
              color: AppTheme.greyColor,
              fontSize: 13.sp,
            ),
          ),
        ),
      ],
    );
  }
}
