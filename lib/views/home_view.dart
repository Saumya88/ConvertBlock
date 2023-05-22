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

    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        body: Container(
          margin: EdgeInsets.fromLTRB(5, 10, 5, 5),
          child: Column(
            children: [
              Scrollbar(
                scrollbarOrientation: ScrollbarOrientation.top,
                controller: con,
                child: SingleChildScrollView(
                  controller: con,
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      const TopNavigationBar(),
                      CardWidget(
                        isVisible: true,
                        label: 'From',
                        selectedCoin: 'ETH',
                      ),
                      const CircleAvatar(
                        backgroundColor: AppColors.white,
                        child: AppIcon(iconPath: 'assets/convert.png'),
                      ),
                      CardWidget(
                        isVisible: false,
                        label: 'To',
                        selectedCoin: 'BTC',
                      ),
                      const SizedBox(height: 30),
                      const AppButton(),
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
        ),
      ),
    );
  }
}
