import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_project/utilities/colors.dart';

class GreenSquareButton extends StatelessWidget {
  const GreenSquareButton({
    required this.onTap,
    required this.label,
    super.key,
  });
  final void Function()? onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width / 2,
        margin: EdgeInsets.all(5.sp),
        decoration: BoxDecoration(
          color: AppColors.green,
          borderRadius: const BorderRadius.all(
            Radius.circular(5),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
                // color: Colors.white,
                fontFamily: 'Poppins-Bold',
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                letterSpacing: 1),
          ),
        ),
      ),
    );
  }
}
