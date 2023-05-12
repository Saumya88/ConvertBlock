import 'package:flutter/material.dart';
import 'package:web_project/utilities/colors.dart';
import 'package:web_project/widgets/app_textfield.dart';

class CardWidget extends StatelessWidget {
  final bool isVisible;
  final String label;
  const CardWidget({
    required this.isVisible,
    required this.label,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 8,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueAccent),
        color: AppColors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(label),
              Visibility(
                visible: isVisible,
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Max Amount')),
              )
            ],
          ),
          const AppTextField(
              readOnly: false,
              hint: 'Enter Text',
              //errorText: 'something went wrong',
              fillColor: AppColors.white)
        ],
      ),
    );
  }
}
