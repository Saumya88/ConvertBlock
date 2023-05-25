import 'package:flutter/material.dart';
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
        height: 50,
        margin: const EdgeInsets.fromLTRB(22, 0, 22, 10),
        decoration: const BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Preview Conversion',
              style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1),
            ),
            AppIcon(iconPath: 'assets/arrow.png')
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
