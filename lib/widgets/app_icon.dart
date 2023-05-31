import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppIcon extends StatelessWidget {
  final String iconPath;

  const AppIcon({
    required this.iconPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: 45.w,
      child: Image.asset(iconPath),
    );
  }
}
