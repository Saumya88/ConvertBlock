// ignore_for_file: prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_project/utilities/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _textEditingController1 = TextEditingController();
  TextEditingController _textEditingController2 = TextEditingController();
  TextEditingController _textEditingController3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double sizedBoxWidth = width > 900 ? 3 : 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.green,
        title: Center(
            child: Text(
          'User Data $width',
          style: TextStyle(fontSize: 20.sp, fontFamily: 'Poppins-Medium'),
        )),
      ),
      backgroundColor: AppColors.enjColor,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          margin: const EdgeInsets.all(10),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        _textEditingController3.text = 'saumya';
                      },
                      child: CircleAvatar(
                        radius: 50.r,
                        backgroundColor: Colors.blueGrey,
                        child: Icon(
                          size: 35.sp,
                          Icons.add_a_photo,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    InkWell(
                      onTap: () {
                        _textEditingController3.text = 'saumya';
                      },
                      child: CircleAvatar(
                        radius: 50.r,
                        backgroundColor: Colors.blueGrey,
                        child: Icon(
                          size: 35.sp,
                          Icons.location_on,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / sizedBoxWidth,
                  child: Column(
                    children: [
                      SizedBox(height: 40.h),
                      LabeledTextField(
                        label: 'Full Name',
                        controller: _textEditingController1,
                        keyboardType: TextInputType.name,
                      ),
                      SizedBox(height: 10.h),
                      LabeledTextField(
                        label: 'Mobile No',
                        controller: _textEditingController2,
                        keyboardType: TextInputType.phone,
                      ),
                      SizedBox(height: 10.h),
                      LabeledTextField(
                        label: 'Location',
                        controller: _textEditingController3,
                        keyboardType: TextInputType.text,
                      ),
                      SizedBox(height: 40.h),
                      InkWell(
                        onTap: () {
                          _textEditingController1.text = 'Hello';
                        },
                        child: Container(
                          height: 45.h,
                          width: width / 2,
                          // margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
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
                                offset: const Offset(
                                    0, 3), // changes position of shadow
                              ),
                            ],
                          ),

                          child: Center(
                            child: Text(
                              'Save Data',
                              style: TextStyle(
                                  // color: Colors.white,
                                  fontFamily: 'Poppins-Bold',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  letterSpacing: 1),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
