import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_project/views/profile_screen.dart';
import 'package:web_project/widgets/app_icon.dart';

import '../utilities/colors.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  double appButtonWidth;
  AppButton({super.key, required this.appButtonWidth});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: appButtonWidth,
        height: 55.h,
        margin: const EdgeInsets.fromLTRB(22, 0, 22, 10),
        decoration: const BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Preview Conversion',
              style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1),
            ),
            AppIcon(iconPath: 'assets/arrow.png')
          ],
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const ProfileScreen()));
      },
    );
  }
}
