import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_project/models/api_crypto_coin.dart';
import 'package:web_project/utilities/colors.dart';
import 'package:web_project/widgets/app_icon.dart';
import 'package:web_project/widgets/app_textfield.dart';

List<ApiCryptoCoin> _availableCryptoCoins = [];

// ignore: must_be_immutable
class CryptoCard extends StatefulWidget {
  CryptoCard(
      {required this.textFieldController,
      required this.searchBarController,
      required this.isVisible,
      required this.label,
      required this.selectedCoin,
      required this.onTapDropDown,
      required this.allCoins,
      required this.cardWidth,
      required this.cardHeight,
      super.key});
  ApiCryptoCoin selectedCoin;
  String label;
  TextEditingController textFieldController;
  TextEditingController searchBarController;
  bool isVisible;
  void Function() onTapDropDown;
  List<ApiCryptoCoin> allCoins;
  double cardHeight;
  double cardWidth;

  @override
  State<CryptoCard> createState() => _CryptoCardState();
}

class _CryptoCardState extends State<CryptoCard> {
  @override
  void initState() {
    _availableCryptoCoins = widget.allCoins;
    super.initState();
  }

  void _runFilter(String enteredKeyboard) {
    List<ApiCryptoCoin> cryptoResults = [];
    if (enteredKeyboard.isEmpty) {
      cryptoResults = widget.allCoins;
    } else {
      cryptoResults = widget.allCoins
          .where((coin) => coin.coinSymbol!
              .toLowerCase()
              .contains(enteredKeyboard.toLowerCase()))
          .toList();
    }
    setState(() {
      _availableCryptoCoins = cryptoResults;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.cardWidth,
      height: widget.cardHeight,
      margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
      decoration: const BoxDecoration(
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
              Expanded(
                  child: Text(
                widget.label,
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins-Regular'),
              )),
              Expanded(
                  child: Visibility(
                      visible: widget.isVisible,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(20),
                            ),
                            border: Border.all(color: Colors.blue, width: 2),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              'Max Amount',
                              style: TextStyle(
                                  fontFamily: 'Poppins-Regular',
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )))
            ],
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppTextField(
                  controller: widget.textFieldController,
                  hint: 'Enter amount',
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    createSearchScreen(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        child: kIsWeb
                            ? const CircleAvatar(
                                backgroundColor: Colors.white,
                                child:
                                    AppIcon(iconPath: 'assets/coins/BTC.png'),
                              )
                            : Image.network(widget.selectedCoin.coinImageUrl!),
                      ),
                      Text(widget.selectedCoin.coinSymbol!,
                          style: TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          )),
                      const Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<dynamic> createSearchScreen(BuildContext context) {
    bool showSearchIcon = true;
    _runFilter("");
    return showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return Container(
            margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height * 0.8,
            child: Column(
              children: [
                InkWell(
                    onTap: () {
                      widget.searchBarController.text = "";
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 19),
                      width: MediaQuery.of(context).size.height * 0.5,
                      child:
                          Center(child: Image.asset('assets/coins/rect.png')),
                    )),
                Text('Search Crypto',
                    style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: widget.label == "From"
                                ? Colors.black
                                : Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              'From',
                              style: TextStyle(
                                color: widget.label == "From"
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: 'Poppins-Regular',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          height: 50.h,
                          decoration: BoxDecoration(
                            color: widget.label == "To"
                                ? Colors.black
                                : Colors.white,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              'To',
                              style: TextStyle(
                                color: widget.label == "To"
                                    ? Colors.white
                                    : Colors.black,
                                fontFamily: 'Poppins-Regular',
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: TextFormField(
                    style: TextStyle(
                        fontSize: 16.sp, fontFamily: 'Poppins-Regular'),
                    controller: widget.searchBarController,
                    keyboardType: TextInputType.name,
                    onChanged: (value) => _runFilter(value),
                    onTap: () {
                      showSearchIcon = !showSearchIcon;
                    },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15),
                        hintText: "Search crypto assets",
                        suffixIcon: Visibility(
                            visible: showSearchIcon,
                            child: Icon(
                              Icons.search,
                              size: 16.sp,
                            )),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide())),
                  ),
                ),
                SizedBox(height: 30.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Crypto you own',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1)),
                ),
                SizedBox(height: 10.h),
                Flexible(
                  child: _availableCryptoCoins.isNotEmpty
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: _availableCryptoCoins.length,
                          itemBuilder: _cryptoCoinBuilder)
                      : const Text("No crypto coin found"),
                ),
              ],
            ),
          );
        });
  }

  Widget _cryptoCoinBuilder(BuildContext context, int index) {
    bool coinIsSelected = false;
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                setState(() {
                  coinIsSelected = !coinIsSelected;
                  widget.selectedCoin = _availableCryptoCoins[index];
                  widget.searchBarController.text = "";
                  Navigator.pop(context);
                });
              },
              child: Row(
                children: [
                  Container(
                    child: kIsWeb
                        ? const CircleAvatar(
                            // radius: 2.r,
                            backgroundColor: Colors.white,
                            child: AppIcon(iconPath: 'assets/coins/BTC.png'),
                          )
                        : Image.network(
                            //scale: 1,
                            // width: 30.w,
                            // height: 30.w,
                            _availableCryptoCoins[index].coinImageUrl!),
                  ),
                  SizedBox(width: 16.w),
                  Text(_availableCryptoCoins[index].coinSymbol!,
                      style: TextStyle(
                          fontFamily: 'Poppins-Bold',
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w700)),
                ],
              ),
            ),
          ),
          Visibility(
            visible: widget.selectedCoin.coinSymbol ==
                _availableCryptoCoins[index].coinSymbol,
            child: const Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: AppIcon(iconPath: 'assets/coins/tick.png')),
            ),
          )
        ],
      ),
    );
  }
}
