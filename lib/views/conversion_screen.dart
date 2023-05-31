import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_project/widgets/converter_widget.dart';
import 'package:web_project/widgets/app_button.dart';
import 'package:web_project/widgets/bottom_navigation_bar.dart';
import 'package:web_project/widgets/navigation_bar.dart';
import '../utilities/colors.dart';

class ConversionScreen extends StatelessWidget {
  const ConversionScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (!kIsWeb) {
          return const MobileBody();
        } else {
          return const DesktopBody();
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
                SizedBox(height: 20.h),
                ConverterWidget(
                  cardHeight: 180.h,
                  cardWidth: MediaQuery.of(context).size.width,
                ),
                SizedBox(height: 40.h),
                AppButton(appButtonWidth: MediaQuery.of(context).size.width),
                SizedBox(height: 150.h),
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
                ConverterWidget(
                  cardHeight: 150.h,
                  cardWidth: MediaQuery.of(context).size.width / 2,
                ),
                SizedBox(height: 40.h),
                AppButton(
                    appButtonWidth: MediaQuery.of(context).size.width / 2),
                SizedBox(height: 70.h),
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
