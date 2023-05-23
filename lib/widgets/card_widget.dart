import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_project/blocs/home_view_bloc/home_view_bloc.dart';
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
      height: 200,
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
              Expanded(child: Text(label)),
              Expanded(
                child: Visibility(
                  visible: isVisible,
                  child: const Align(
                    alignment: Alignment.topRight,
                    child: Text('Max Amount'),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
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
                          return ListView.builder(
                              itemCount: _cryptoCoins.length,
                              itemBuilder: _cryptoCoinBuilder);
                          // return Container(
                          //   margin: EdgeInsets.fromLTRB(5, 0, 5, 0),
                          //   height: MediaQuery.of(context).size.height,
                          //   width: MediaQuery.of(context).size.width,
                          //   child: Column(
                          //       children: [Text("Search Crypto")],
                          //       ListView.builder(
                          //           itemCount: _cryptoCoins.length,
                          //           itemBuilder: _cryptoCoinBuilder)),
                          // );
                        });
                  },
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.blueAccent,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        selectedCoin!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const Icon(Icons.keyboard_arrow_down_rounded),
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

  Future<dynamic> showBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return BlocConsumer<HomeViewBloc, HomeViewState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            if (state is HomeViewInitial) {
              return Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text('Search Crypto'),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F2F4),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Center(
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
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Center(
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
            } else {
              return Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    const Text('Search Crypto'),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F2F4),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Center(
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
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: const Center(
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
            }
          },
        );
      },
    );
  }

  Widget _cryptoCoinBuilder(BuildContext context, int index) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          CircleAvatar(
              radius: 30,
              backgroundColor: _cryptoCoins[index].circleAvatarColor,
              child: AppIcon(iconPath: _cryptoCoins[index].coinImageUrl)),
          SizedBox(
            width: 10,
          ),
          Column(
            children: [
              Text(
                _cryptoCoins[index].coinSymbol,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                _cryptoCoins[index].coinName,
                style: TextStyle(fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
