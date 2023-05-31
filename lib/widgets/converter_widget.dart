import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_project/blocs/conversion_screen/conversion_screen_bloc.dart';
import 'package:web_project/models/coin_model.dart';
import 'package:web_project/utilities/colors.dart';
import 'package:web_project/widgets/app_icon.dart';
import 'package:web_project/widgets/crypto_card.dart';

TextEditingController _controller1 = TextEditingController();
TextEditingController _controller2 = TextEditingController();
TextEditingController _searchController = TextEditingController();

// ignore: must_be_immutable
class ConverterWidget extends StatefulWidget {
  double cardWidth;
  double cardHeight;
  ConverterWidget(
      {super.key, required this.cardHeight, required this.cardWidth});

  @override
  State<ConverterWidget> createState() => _ConverterWidgetState();
}

class _ConverterWidgetState extends State<ConverterWidget> {
  final ConversionScreenBloc _convertViewBloc = ConversionScreenBloc();
  @override
  void initState() {
    _convertViewBloc.add(GetCoinList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: BlocProvider(
      create: (context) => _convertViewBloc,
      child: BlocListener<ConversionScreenBloc, ConversionScreenState>(
        listener: (context, state) {
          if (state is ConversionScreenError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
        child: BlocBuilder<ConversionScreenBloc, ConversionScreenState>(
          builder: (context, state) {
            if (state is ConversionScreenLoading) {
              return _buildLoading();
            } else if (state is ConversionScreenLoaded) {
              return _buildConvertView(state.coinModel);
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

  Column _buildConvertView(List<CoinModel> cryptoCoins) {
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
