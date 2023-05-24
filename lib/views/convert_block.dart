import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_project/blocs/search_crypto/search_crypto_bloc.dart';
import 'package:web_project/models/coin_model.dart';
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
  final SearchCryptoBloc _searchCryptoBloc = SearchCryptoBloc();
  @override
  void initState() {
    _searchCryptoBloc.add(GetCoinList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: BlocProvider(
        create: (context) => _searchCryptoBloc,
        child: BlocListener<SearchCryptoBloc, SearchCryptoState>(
          listener: (context, state) {
            if (state is SearchCryptoError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(state.message!),
                ),
              );
            }
          },
          child: BlocBuilder<SearchCryptoBloc, SearchCryptoState>(
            builder: (context, state) {
              if (state is SearchCryptoLoading) {
                return _buildLoading();
              } else if (state is SearchCryptoLoaded) {
                print(state.coinModel[0].coinFullName);
                return _buildConverterBlock(state.coinModel);
              } else {
                return const Center(child: Text("Doodle"));
              }
            },
          ),
        ),
      ),
    ));
  }

  Widget _buildLoading() => const Center(child: CircularProgressIndicator());
  Column _buildConverterBlock(List<CoinModel> cryptoCoins) {
    return Column(
      children: [
        CryptoCard(
            textFieldController: _controller1,
            searchBarController: _searchController,
            isVisible: true,
            label: "From",
            selectedCoin: cryptoCoins[0],
            allCoins: cryptoCoins,
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
            selectedCoin: cryptoCoins[1],
            allCoins: cryptoCoins,
            onTapDropDown: () {
              setState(() {});
            }),
      ],
    );
  }
}
