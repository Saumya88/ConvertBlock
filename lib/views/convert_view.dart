import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_project/blocs/convert_view/convert_view_bloc.dart';
import 'package:web_project/models/coin_model.dart';
import 'package:web_project/utilities/colors.dart';
import 'package:web_project/widgets/app_icon.dart';
import 'package:web_project/widgets/crypto_card.dart';

TextEditingController _controller1 = TextEditingController();
TextEditingController _controller2 = TextEditingController();
TextEditingController _searchController = TextEditingController();

// ignore: must_be_immutable
class ConvertView extends StatefulWidget {
  double cardWidth;
  double cardHeight;
  ConvertView({super.key, required this.cardHeight, required this.cardWidth});

  @override
  State<ConvertView> createState() => _ConvertViewState();
}

class _ConvertViewState extends State<ConvertView> {
  final ConvertViewBloc _convertViewBloc = ConvertViewBloc();
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
      child: BlocListener<ConvertViewBloc, ConvertViewState>(
        listener: (context, state) {
          if (state is ConvertViewError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message!),
              ),
            );
          }
        },
        child: BlocBuilder<ConvertViewBloc, ConvertViewState>(
          builder: (context, state) {
            if (state is ConvertViewLoading) {
              return _buildLoading();
            } else if (state is ConvertViewLoaded) {
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
