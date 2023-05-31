import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_project/utilities/colors.dart';

const contentPadding = EdgeInsets.fromLTRB(24, 12, 24, 12);
const borderRadius = BorderRadius.all(Radius.circular(16.0));

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;

  final String hint;
  final String? errorText;

  const AppTextField({
    this.controller,
    required this.hint,
    this.errorText,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200.w,
      child: TextField(
        style: TextStyle(
          fontFamily: 'Poppins-Medium',
          fontSize: 25.sp,
          letterSpacing: -0.3,
          fontWeight: FontWeight.w400,
        ),
        keyboardType: TextInputType.number,
        textAlignVertical: TextAlignVertical.center,
        controller: controller,
        decoration: InputDecoration(
          isDense: true,
          hintText: hint,
          errorText: errorText,
          hintStyle: TextStyle(
            fontFamily: 'Poppins-Regular',
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: AppColors.white,
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
        ),
        obscuringCharacter: '*',
      ),
    );
  }
}
