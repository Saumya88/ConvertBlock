import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:web_project/widgets/green_square_button.dart';

class LocationWidget extends StatefulWidget {
  const LocationWidget({super.key});

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  void initState() {
    print('inside init state');
    getPermission();
    super.initState();
  }

  String location = '';

  var latitude;
  var longitude;
  Future<Position> getCurrentLocation() async {
    print('inside getCurrentLocation()');
    Position x = await Geolocator.getCurrentPosition();
    print('position is');
    print(x.latitude);
    print(x.longitude);
    return x;
  }

  void getPermission() async {
    print('inside getPermission()');
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print('Location services are disabled');
      return Future.error('Location services are disabled');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied. We cannot request location');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              location,
              style: TextStyle(
                  fontFamily: 'Poppins-Bold',
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: GreenSquareButton(
                  onTap: () async {
                    await getCurrentLocation().then((value) {
                      print('onTap of Get Location');
                      latitude = '${value.latitude}';
                      longitude = '${value.longitude}';
                    });
                    setState(() {
                      print('inside set state');
                      print(latitude);
                      print(longitude);
                      location = '$latitude $longitude';
                    });
                  },
                  label: 'Get Location'),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: GreenSquareButton(
                  onTap: () {
                    Navigator.pop(context, location);
                  },
                  label: 'Back'),
            )
          ],
        ),
      ),
    ));
  }
}
