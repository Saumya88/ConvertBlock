import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_project/utilities/colors.dart';
import 'package:web_project/views/conversion_screen.dart';
import 'package:web_project/views/crypto_list_screen.dart';

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
            ? 4
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
                      ? 3
                      : 1,
                  children: [
                    SizedBox(
                      height: 50,
                      child: SquareAppButton(
                        buttonWidth: MediaQuery.of(context).size.width,
                        label: 'Conversion Screen',
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const ConversionScreen()));
                        },
                      ),
                    ),
                    SquareAppButton(
                      buttonWidth: MediaQuery.of(context).size.width,
                      label: 'Path Provider Cache Data',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const CryptoListScreen()));
                      },
                    ),
                    SquareAppButton(
                      buttonWidth: MediaQuery.of(context).size.width,
                      label: 'Shared Preferences Cache Data ',
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ConversionScreen()));
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

class SquareAppButton extends StatelessWidget {
  final String label;
  final void Function() onTap;
  final double buttonWidth;
  const SquareAppButton({
    required this.buttonWidth,
    required this.onTap,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // return Text(label);
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent, width: 3),
            color: AppColors.green,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: SizedBox(
          height: 50,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                  fontFamily: 'Poppins-Light',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1),
            ),
          ),
        ),
      ),
    );
  }
}
