import 'package:flutter/material.dart';
import 'package:web_project/widgets/app_icon.dart';

import '../utilities/colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        width: 280,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        decoration: const BoxDecoration(
            color: AppColors.green,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Preview Conversion',
              style: TextStyle(
                  fontSize: 14, fontWeight: FontWeight.w700, letterSpacing: 1),
            ),
            AppIcon(iconPath: 'assets/arrow.png')
          ],
        ),
      ),
      onTap: () {},
    );
  }
}
