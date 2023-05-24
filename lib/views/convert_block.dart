import 'package:flutter/material.dart';
import 'package:web_project/models/coin_model_data.dart';
import 'package:web_project/utilities/colors.dart';
import 'package:web_project/widgets/app_icon.dart';
import 'package:web_project/widgets/crypto_card.dart';

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

class ConvertBlock extends StatefulWidget {
  const ConvertBlock({super.key});

  @override
  State<ConvertBlock> createState() => _ConvertBlockState();
}

class _ConvertBlockState extends State<ConvertBlock> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        CryptoCard(
            textFieldController: _controller1,
            searchBarController: _searchController,
            isVisible: true,
            label: "From",
            selectedCoin: _selectedCoin1,
            allCoins: _cryptoCoins,
            onTapDropDown: () {
              setState(() {});
            }),
        InkWell(
          onTap: () {
            String temp = _controller1.text;
            _controller1.text = _controller2.text;
            _controller2.text = temp;
          },
          child: const CircleAvatar(
            backgroundColor: AppColors.white,
            child: AppIcon(iconPath: 'assets/convert.png'),
          ),
        ),
        CryptoCard(
            searchBarController: _searchController,
            textFieldController: _controller2,
            isVisible: false,
            label: "To",
            selectedCoin: _selectedCoin2,
            allCoins: _cryptoCoins,
            onTapDropDown: () {
              setState(() {});
            }),
      ],
    ));
  }
}
