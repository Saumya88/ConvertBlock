import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_project/utilities/colors.dart';
import 'package:web_project/views/conversion_screen.dart';
import 'package:web_project/views/crypto_list_path_provider_screen.dart';
import 'package:web_project/views/crypto_list_shared_pref_screen.dart';
import 'package:web_project/views/profile_screen.dart';
import 'package:web_project/widgets/homescreen_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    int childAspectRatio = width > 499
        ? width > 900
            ? 5
            : 3
        : 2;
    return Scaffold(
      backgroundColor: AppColors.ltcColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                'Crypto Coin Data Screens  ${width.round()}x${height.round()}',
                style: TextStyle(
                    fontFamily: 'Poppins-Bold',
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1),
              ),
              const SizedBox(height: 40),
              Flexible(
                child: GridView.count(
                  // this decides height of tile
                  childAspectRatio: (childAspectRatio / 1),
                  clipBehavior: Clip.hardEdge,
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,

                  crossAxisCount: MediaQuery.of(context).orientation ==
                          Orientation.landscape
                      ? 2
                      : 1,
                  children: [
                    SquareAppButton(
                      label: 'Record Data',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ProfileScreen()));
                      },
                    ),
                    SquareAppButton(
                      label: 'Conversion Screen',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ConversionScreen()));
                      },
                    ),
                    SquareAppButton(
                      label: 'Path Provider Cache Data',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CryptoListScreen()));
                      },
                    ),
                    SquareAppButton(
                      label: 'Shared Preferences Cache Data ',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const CryptoListSharedPref()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
