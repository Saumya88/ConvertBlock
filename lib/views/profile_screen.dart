// ignore_for_file: prefer_final_fields

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
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
  TextEditingController _textEditingController4 = TextEditingController();
  String _imagePath = '';

  void updateImagePath(String imagePath) {
    print('inside update path');
    setState(() => _imagePath = imagePath);
    print(_imagePath);
  }

  void moveToNextPage(Widget widget) async {
    print('inside move to Next Page');
    final imgPath = await Navigator.push(
      context,
      CupertinoPageRoute(fullscreenDialog: true, builder: (context) => widget),
    );
    updateImagePath(imgPath);
  }

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
                          await availableCameras().then((value) {
                            moveToNextPage(CameraWidget(cameras: value));
                          });
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
                        makeUneditableLabel(context, 'Location', '_imagePath'),
                        SizedBox(height: 10.h),
                        makeUneditableLabel(context, 'Image Path', _imagePath),
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

  Row makeUneditableLabel(BuildContext context, String label1, String label2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Text(
            label1,
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
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.only(left: 8),
              child: Text(
                label2,
                style: TextStyle(
                  overflow: TextOverflow.ellipsis,
                  fontFamily: 'Poppins-Light',
                  fontSize: 16.sp,
                  letterSpacing: -0.3,
                  fontWeight: FontWeight.w300,
                ),
              )),
        ),
      ],
    );
  }
}
