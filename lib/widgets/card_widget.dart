import 'package:flutter/material.dart';
import 'package:web_project/utilities/colors.dart';
import 'package:web_project/widgets/app_textfield.dart';

class CardWidget extends StatelessWidget {
  final bool isVisible;
  final String label;
  String? selectedCoin;
  CardWidget({
    required this.isVisible,
    required this.label,
    this.selectedCoin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
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
                    child: const Text('Max Amount'),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppTextField(
                  readOnly: false,
                  hint: 'Enter Text',
                  //errorText: 'something went wrong',
                  fillColor: AppColors.white,
                ),
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                            children: [
                              Text('Search Crypto'),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF2F2F4),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'From',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'To',
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.blueAccent,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        selectedCoin!,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
