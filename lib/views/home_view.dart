import 'package:flutter/material.dart';
import 'package:web_project/views/convert_block.dart';
import 'package:web_project/widgets/app_button.dart';
import 'package:web_project/widgets/bottom_navigation_bar.dart';
import 'package:web_project/widgets/navigation_bar.dart';
import '../utilities/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return MobileBody();
        } else {
          return DesktopBody();
        }
      },
    );
  }
}

class MobileBody extends StatelessWidget {
  const MobileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        body: Container(
          margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TopNavigationBar(),
                const SizedBox(height: 20),
                ConvertBlock(
                  cardHeight: 180,
                  cardWidth: MediaQuery.of(context).size.width,
                ),
                const SizedBox(height: 40),
                AppButton(appButtonWidth: MediaQuery.of(context).size.width),
                const SizedBox(height: 150),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: const BottomBar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DesktopBody extends StatelessWidget {
  const DesktopBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.offWhite,
        body: Container(
          margin: const EdgeInsets.fromLTRB(5, 10, 5, 5),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TopNavigationBar(),
                ConvertBlock(
                  cardHeight: 150,
                  cardWidth: MediaQuery.of(context).size.width / 2,
                ),
                const SizedBox(height: 40),
                AppButton(
                    appButtonWidth: MediaQuery.of(context).size.width / 2),
                const SizedBox(height: 30),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: const BottomBar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
