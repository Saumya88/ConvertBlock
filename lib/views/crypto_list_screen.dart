import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_project/blocs/crypto_list/crypto_list_bloc.dart';
import 'package:web_project/models/cached_data_model.dart';
import 'package:web_project/utilities/colors.dart';
import 'package:web_project/views/conversion_screen.dart';
import 'package:web_project/widgets/app_icon.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class CryptoListScreen extends StatefulWidget {
  const CryptoListScreen({super.key});

  @override
  State<CryptoListScreen> createState() => _CryptoListScreenState();
}

class _CryptoListScreenState extends State<CryptoListScreen> {
  final CryptoListBloc _cryptoListBloc = CryptoListBloc();
  @override
  void initState() {
    _cryptoListBloc.add(GetCacheData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.enjColor,
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ConversionScreen()));
                  },
                  icon: const Icon(Icons.arrow_right_alt)),
            ],
            backgroundColor: AppColors.green,
            title: Center(
                child: Text(MediaQuery.of(context).size.width.toString())),
          ),
          body: BlocProvider(
            create: (context) => _cryptoListBloc,
            child: BlocListener<CryptoListBloc, CryptoListState>(
              listener: (context, state) {
                if (state is CryptoListError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message!),
                    ),
                  );
                }
              },
              child: BlocBuilder<CryptoListBloc, CryptoListState>(
                builder: (context, state) {
                  if (state is CryptoListLoading) {
                    return _buildLoading();
                  } else if (state is CryptoListLoaded) {
                    return _buildCryptoList(state.cachedCryptoCoinList);
                  } else {
                    return const Center(child: Text("Doodle"));
                  }
                },
              ),
            ),
          )),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: Row(
        children: [
          Text(" Loading from api          "),
          CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget _buildCryptoList(List<CachedCryptoCoin> cachedList) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Flexible(
            child: GridView.builder(
              itemCount: cachedList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 3
                        : 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: (2 / 1),
              ),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.fromLTRB(2, 5, 2, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                    ),
                    border: Border.all(
                      width: 3,
                      color: AppColors.green,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        cachedList[index].coinSymbol!,
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Poppins-Bold',
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        cachedList[index].name!,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Crypto Coin',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'Poppins-Medium',
                                fontWeight: FontWeight.w500),
                          ),
                          cachedList[index].typeIsCrypto == 1
                              ? Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                )
                              : Icon(Icons.cancel, color: Colors.red)
                        ],
                      ),
                      Text(
                        cachedList[index].dataQuoteStart!,
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
