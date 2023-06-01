import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:web_project/blocs/crypto_list_path_provider/crypto_list_bloc.dart';
import 'package:web_project/models/cached_crypto_coin_pp.dart';
import 'package:web_project/utilities/colors.dart';

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
            backgroundColor: AppColors.green,
            title: Center(
                child: Text(
              'Crypto List From Cache',
              style: TextStyle(fontSize: 20.sp, fontFamily: 'Poppins-Medium'),
            )),
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
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            " Loading from api          ",
            style: TextStyle(fontSize: 30.sp, fontFamily: 'Poppins-Regular'),
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget _buildCryptoList(List<CachedCryptoCoinPP> cachedList) {
    double width = MediaQuery.of(context).size.width;
    int childAspectRatio = width > 499
        ? width > 900
            ? 3
            : 2
        : 1;
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
                childAspectRatio: (childAspectRatio / 1),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        cachedList[index].coinSymbol!,
                        style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: 'Poppins-Bold',
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        cachedList[index].name!,
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontFamily: 'Poppins-Medium',
                            fontWeight: FontWeight.w500),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Crypto Coin',
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: 'Poppins-Medium',
                                fontWeight: FontWeight.w500),
                          ),
                          cachedList[index].typeIsCrypto == 1
                              ? Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 16.sp,
                                )
                              : Icon(
                                  Icons.cancel,
                                  color: Colors.red,
                                  size: 16.sp,
                                )
                        ],
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
