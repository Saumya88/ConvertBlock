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
      height: 45,
      width: 45,
      child: Image.asset(iconPath),
    );
  }
}
