import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter/material.dart';

import '../../utils/utils/colors/app_colors.dart';

class GlobalButton extends StatefulWidget {
  GlobalButton(
      {super.key,
      required this.onTap,
      required this.subtitle,
      this.backgroundColor,
      this.borderColor,
      required this.horizontalPadding,
      required this.verticalPadding});

  final VoidCallback onTap;
  final int horizontalPadding;
  final int verticalPadding;
  final Widget subtitle;
  Color? backgroundColor = AppColors.c_273032;
  Color? borderColor = AppColors.c_273032;

  @override
  State<GlobalButton> createState() => _GlobalButtonState();
}

class _GlobalButtonState extends State<GlobalButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Ink(
        decoration: BoxDecoration(
            border: widget.borderColor != null
                ? Border.all(width: 1, color: widget.borderColor!)
                : null,
            borderRadius: BorderRadius.circular(16.r),
            color: widget.backgroundColor),
        child: InkWell(
          borderRadius: BorderRadius.circular(16.r),
          onTap: widget.onTap,
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: widget.horizontalPadding.w,
                  vertical: widget.verticalPadding.h),
              child: widget.subtitle),
        ),
      ),
    );
  }
}
