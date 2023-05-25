import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_project/blocs/search_crypto/search_crypto_bloc.dart';
import 'package:web_project/models/coin_model.dart';
import 'package:web_project/utilities/colors.dart';
import 'package:web_project/widgets/app_icon.dart';
import 'package:web_project/widgets/crypto_card.dart';

TextEditingController _controller1 = TextEditingController();
TextEditingController _controller2 = TextEditingController();
TextEditingController _searchController = TextEditingController();

// ignore: must_be_immutable
class ConvertBlock extends StatefulWidget {
  double cardWidth;
  double cardHeight;
  ConvertBlock({super.key, required this.cardHeight, required this.cardWidth});

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
              print(state.coinModel[0].coinSymbol);
              return _buildConverterBlock(state.coinModel);
            } else {
              return const Center(child: Text("Doodle"));
            }
          },
        ),
      ),
    ));
  }

  Widget _buildLoading() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Column _buildConverterBlock(List<CoinModel> cryptoCoins) {
    return Column(
      children: [
        CryptoCard(
            cardHeight: widget.cardHeight,
            cardWidth: widget.cardWidth,
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
            cardHeight: widget.cardHeight,
            cardWidth: widget.cardWidth,
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
