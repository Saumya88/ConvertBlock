import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {
  final String iconPath;

  const AppIcon({
    required this.iconPath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 35,
      child: Image.asset(iconPath),
    );
  }
}
