// ignore_for_file: prefer_final_fields

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_project/database/database_sql.dart';
import 'package:web_project/utilities/colors.dart';
import 'package:web_project/widgets/camera.dart';
import 'package:web_project/widgets/green_square_button.dart';
import 'package:web_project/widgets/labeled_textfield.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () async {
                          await availableCameras().then(
                            (value) => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    CameraWidget(cameras: value),
                              ),
                            ),
                          );
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
                        GreenSquareButton(
                          label: 'Save Data',
                          onTap: () async {
                            await DataBaseHelper.instance.insertRecord({
                              DataBaseHelper.userName:
                                  _textEditingController1.text,
                              DataBaseHelper.userPhoneNumber:
                                  _textEditingController2.text,
                              DataBaseHelper.userLocation:
                                  _textEditingController3.text,
                              DataBaseHelper.userPhoto: 'assets/image/dog.png'
                            });
                          },
                        ),
                        GreenSquareButton(
                          label: 'Display Data',
                          onTap: () async {
                            var dbQuery =
                                await DataBaseHelper.instance.queryDatabase();
                            print(dbQuery);
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
