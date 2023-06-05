import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_project/utilities/colors.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType keyboardType;

  const LabeledTextField({
    required this.label,
    required this.controller,
    required this.keyboardType,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            label,
            //textAlign: TextAlign.right,
            style: TextStyle(
              fontFamily: 'Poppins-Medium',
              fontSize: 22.sp,
              letterSpacing: -0.3,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            width: MediaQuery.of(context).size.width / 4,
            margin: const EdgeInsets.only(left: 8),
            child: TextFormField(
              style: TextStyle(
                fontFamily: 'Poppins-Light',
                fontSize: 22.sp,
                letterSpacing: -0.3,
                fontWeight: FontWeight.w300,
              ),
              keyboardType: keyboardType,
              textAlignVertical: TextAlignVertical.center,
              controller: controller,
              decoration: const InputDecoration(
                isDense: true,
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
          ),
        ),
      ],
    );
  }
}
