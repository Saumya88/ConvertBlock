import 'package:flutter/material.dart';

import 'package:web_project/models/coin_model_data.dart';
import 'package:web_project/utilities/colors.dart';
import 'package:web_project/widgets/app_icon.dart';
import 'package:web_project/widgets/app_textfield.dart';

final List<CryptoCoin> _cryptoCoins = <CryptoCoin>[
  const CryptoCoin(
      coinSymbol: 'BTC',
      coinName: 'Bitcoin',
      coinImageUrl: 'assets/coins/BTC.png',
      circleAvatarColor: AppColors.btcColor),
  const CryptoCoin(
      coinSymbol: 'LTC',
      coinName: 'Litecoin',
      coinImageUrl: 'assets/coins/LTC.png',
      circleAvatarColor: AppColors.ltcColor),
  const CryptoCoin(
      coinSymbol: 'ADA',
      coinName: 'Cardano',
      coinImageUrl: 'assets/coins/ADA.png',
      circleAvatarColor: AppColors.adaColor),
  const CryptoCoin(
      coinSymbol: 'ENJ',
      coinName: 'Enjin',
      coinImageUrl: 'assets/coins/ENJ.png',
      circleAvatarColor: AppColors.enjColor),
  const CryptoCoin(
      coinSymbol: 'SOL',
      coinName: 'Solano',
      coinImageUrl: 'assets/coins/SOL.png',
      circleAvatarColor: AppColors.solColor),
];
TextEditingController _controller1 = TextEditingController();
TextEditingController _controller2 = TextEditingController();
TextEditingController _searchController = TextEditingController();

CryptoCoin _selectedCoin1 = _cryptoCoins[0];
CryptoCoin _selectedCoin2 = _cryptoCoins[2];

List<CryptoCoin> _availableCryptoCoins = [];

class CardWidget extends StatefulWidget {
  const CardWidget({
    super.key,
  });

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  @override
  void initState() {
    _availableCryptoCoins = _cryptoCoins;
    super.initState();
  }

  void _runFilter(String enteredKeyboard) {
    List<CryptoCoin> cryptoResults = [];
    if (enteredKeyboard.isEmpty) {
      cryptoResults = _cryptoCoins;
    } else {
      cryptoResults = _cryptoCoins
          .where((coin) => coin.coinSymbol
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
    return Column(
      children: [
        createCardWidget(context, _selectedCoin1, "From", _controller1, true),
        InkWell(
          onTap: () {
            setState(() {
              String temp = _controller1.text;
              _controller1.text = _controller2.text;
              _controller2.text = temp;
              CryptoCoin tempCoin = _selectedCoin1;
              _selectedCoin1 = _selectedCoin2;
              _selectedCoin2 = tempCoin;
            });
          },
          child: const CircleAvatar(
            backgroundColor: AppColors.white,
            child: AppIcon(iconPath: 'assets/convert.png'),
          ),
        ),
        createCardWidget(context, _selectedCoin2, "To", _controller2, false),
      ],
    );
  }

  Container createCardWidget(
    BuildContext context,
    CryptoCoin selectedCoin,
    String label,
    TextEditingController ctrl,
    bool isVisible,
  ) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 180,
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
                label,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins-Regular'),
              )),
              Expanded(
                  child: Visibility(
                      visible: isVisible,
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
                          child: const Padding(
                            padding: EdgeInsets.all(2.0),
                            child: Text(
                              'Max Amount',
                              style: TextStyle(
                                  fontFamily: 'Poppins-Regular',
                                  //letterSpacing: 0.3,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppTextField(
                  controller: ctrl,
                  hint: 'Enter amount',
                ),
                InkWell(
                  onTap: () {
                    createSearchScreen(context);
                  },
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: selectedCoin.circleAvatarColor,
                        child: AppIcon(iconPath: selectedCoin.coinImageUrl),
                      ),
                      const SizedBox(width: 10),
                      Text(selectedCoin.coinSymbol,
                          style: const TextStyle(
                            fontFamily: 'Poppins-Regular',
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                          )),
                      const Icon(Icons.keyboard_arrow_down_rounded),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<dynamic> createSearchScreen(BuildContext context) {
    _runFilter("");
    List<bool> _selections = [true, false];
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
                      _searchController.text = "";
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 19),
                      width: MediaQuery.of(context).size.height * 0.5,
                      child:
                          Center(child: Image.asset('assets/coins/rect.png')),
                    )),
                const Text('Search Crypto',
                    style: TextStyle(
                        fontFamily: 'Poppins-Regular',
                        fontSize: 20,
                        fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: 20,
                ),
                ToggleButtons(
                    isSelected: _selections,
                    selectedColor: Colors.white,
                    color: Colors.black,
                    fillColor: Colors.black,
                    renderBorder: true,
                    textStyle: const TextStyle(
                        letterSpacing: 1,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                    borderRadius: BorderRadius.circular(20),
                    onPressed: (int index) {
                      setState(() {
                        _selections[index] = !_selections[index];
                      });
                    },
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.height * 0.22,
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'From',
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.height * 0.22,
                        child: const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'To',
                            ),
                          ),
                        ),
                      ),
                    ]),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: TextFormField(
                    controller: _searchController,
                    keyboardType: TextInputType.name,
                    onChanged: (value) => _runFilter(value),
                    // onTapOutside: (event) => _runFilter(""),
                    // onTap: () {
                    //   _runFilter(_searchController.text);
                    // },
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 15),
                        hintText: "Search crypto assets",
                        suffixIcon: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.search)),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: const BorderSide())),
                  ),
                ),
                const SizedBox(height: 30),
                const Align(
                  alignment: Alignment.topLeft,
                  child: Text('Crypto you own',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1)),
                ),
                const SizedBox(height: 10),
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
                  _selectedCoin1 = _availableCryptoCoins[index];
                  print(_selectedCoin1.coinSymbol);
                  print(coinIsSelected);
                  Navigator.pop(context);
                });
              },
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor:
                        _availableCryptoCoins[index].circleAvatarColor,
                    child: AppIcon(
                        iconPath: _availableCryptoCoins[index].coinImageUrl),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      Text(_availableCryptoCoins[index].coinSymbol,
                          style: const TextStyle(
                              fontFamily: 'Poppins-Bold',
                              fontSize: 16,
                              fontWeight: FontWeight.w700)),
                      Text(_availableCryptoCoins[index].coinName,
                          style: const TextStyle(
                              fontFamily: 'Poppins-Regular',
                              fontSize: 12,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Visibility(
            visible: coinIsSelected,
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
