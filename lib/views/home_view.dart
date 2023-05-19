import 'package:flutter/material.dart';
import 'package:web_project/widgets/app_button.dart';
import 'package:web_project/widgets/app_icon.dart';
import 'package:web_project/widgets/bottom_navigation_bar.dart';
import 'package:web_project/widgets/card_widget.dart';
import 'package:web_project/widgets/navigation_bar.dart';

import '../utilities/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController con = ScrollController();

    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: Column(
        children: [
          Scrollbar(
            scrollbarOrientation: ScrollbarOrientation.top,
            controller: con,
            child: SingleChildScrollView(
              controller: con,
              scrollDirection: Axis.vertical,
              child: const Column(
                children: [
                  TopNavigationBar(),
                  CardWidget(isVisible: true, label: 'From'),
                  CircleAvatar(
                    child: AppIcon(iconPath: 'assets/convert.png'),
                    backgroundColor: AppColors.white,
                  ),
                  CardWidget(isVisible: false, label: 'To'),
                  SizedBox(height: 30),
                  AppButton(),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              alignment: Alignment.bottomCenter,
              child: const BottomBar(),
            ),
          ),
        ],
      ),
    );
  }
}
