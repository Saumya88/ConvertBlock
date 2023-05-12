import 'package:flutter/material.dart';
import 'package:web_project/widgets/app_button.dart';
import 'package:web_project/widgets/bottom_navigation_bar.dart';
import 'package:web_project/widgets/card_widget.dart';
import 'package:web_project/widgets/navigation_bar.dart';

import '../utilities/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.offWhite,
      body: Column(
        children: [
          const Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TopNavigationBar(),
                  CardWidget(isVisible: false, label: 'From'),
                  SizedBox(height: 10),
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
