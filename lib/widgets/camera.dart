import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_project/widgets/green_square_button.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({required this.cameras, super.key});

  final List<CameraDescription> cameras;

  @override
  State<CameraWidget> createState() => _CameraWidgetState();
}

class _CameraWidgetState extends State<CameraWidget> {
  late CameraController controller;
  XFile? pictureFile;
  @override
  void initState() {
    super.initState();
    controller = CameraController(
      widget.cameras[0],
      ResolutionPreset.max,
    );
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const SizedBox(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,

            children: [
              Container(
                margin: EdgeInsets.all(5.sp),
                height: 300.h,
                width: 300.h,
                child: CameraPreview(controller),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 4,
                child: GreenSquareButton(
                    onTap: () async {
                      pictureFile = await controller.takePicture();
                      setState(() {});
                    },
                    label: 'Capture'),
              ),
              if (pictureFile != null)
                Column(
                  children: [
                    Container(
                      height: 200.h,
                      width: 300.h,
                      margin: EdgeInsets.all(5.sp),
                      child: kIsWeb
                          ? Image.network(
                              pictureFile!.path,
                            )
                          : Image.file(File(pictureFile!.path)),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 5,
                        child: GreenSquareButton(
                            onTap: () {
                              Navigator.pop(context, pictureFile!.path);
                            },
                            label: 'Back'))
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
