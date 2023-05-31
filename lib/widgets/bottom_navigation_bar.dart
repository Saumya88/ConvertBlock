import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_project/utilities/colors.dart';
import 'package:web_project/widgets/app_icon.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      height: 50.h,
      child: const Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          AppIcon(iconPath: 'assets/wallet.png'),
          AppIcon(iconPath: 'assets/earn.png'),
          AppIcon(iconPath: 'assets/convert2.png'),
          AppIcon(iconPath: 'assets/stats.png')
        ],
      ),
    );
  }
}
