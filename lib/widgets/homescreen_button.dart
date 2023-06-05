import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_project/utilities/colors.dart';

class SquareAppButton extends StatelessWidget {
  final String label;
  final void Function() onTap;

  const SquareAppButton({
    required this.onTap,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
