import 'package:flutter/material.dart';
import 'package:web_project/utilities/colors.dart';
import 'package:web_project/widgets/app_textfield.dart';

class CardWidget extends StatelessWidget {
  final bool isVisible;
  final String label;
  String? selectedCoin;
  const CardWidget({
    required this.isVisible,
    required this.label,
    this.selectedCoin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 8,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      decoration: const BoxDecoration(
        // border: Border.all(color: Colors.blueAccent),
        color: AppColors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(label)),
              Expanded(
                child: Visibility(
                  visible: isVisible,
                  child: Align(
                      alignment: Alignment.topRight,
                      child: const Text('Max Amount')),
                ),
              )
            ],
          ),
          Row(
            children: [
              const AppTextField(
                  readOnly: false,
                  hint: 'Enter Text',
                  //errorText: 'something went wrong',
                  fillColor: AppColors.white),
              DropdownButtonFormField(
                items: [
                  DropdownMenuItem(
                    child: Text('ETH'),
                    value: 'ETH',
                  ),
                  DropdownMenuItem(
                    child: Text('BTC'),
                    value: 'BTC',
                  ),
                ],
                onChanged: (value) {},
              ),
            ],
          )
        ],
      ),
    );
  }
}
