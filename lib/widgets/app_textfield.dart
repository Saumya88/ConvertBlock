import 'package:flutter/material.dart';

const contentPadding = EdgeInsets.fromLTRB(24, 12, 24, 12);
const borderRadius = BorderRadius.all(Radius.circular(16.0));

class AppTextField extends StatelessWidget {
  final TextEditingController? controller;
  final bool readOnly;
  final String hint;
  final String? errorText;
  final Color? fillColor;
  const AppTextField({
    this.controller,
    required this.readOnly,
    required this.hint,
    this.errorText,
    required this.fillColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 4,
      child: TextField(
        style: const TextStyle(
          letterSpacing: -0.3,
          fontWeight: FontWeight.w400,
        ),
        textAlignVertical: TextAlignVertical.center,
        textDirection: TextDirection.ltr,
        readOnly: readOnly,
        controller: controller,
        enabled: !readOnly,
        decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding,
          hintText: hint,
          errorText: errorText,
          hintStyle: const TextStyle(
            letterSpacing: -0.3,
            fontWeight: FontWeight.w400,
          ),
          filled: true,
          fillColor: fillColor,
          border: InputBorder.none,
        ),
        obscuringCharacter: '*',
      ),
    );
  }
}
