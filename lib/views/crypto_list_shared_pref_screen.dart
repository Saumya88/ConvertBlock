import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:web_project/blocs/crypto_list_shared_pref/crypto_list_shared_pref_bloc.dart';
import 'package:web_project/models/cached_crypto_coin_sp.dart';

import 'package:web_project/utilities/colors.dart';

class CryptoListSharedPref extends StatefulWidget {
  const CryptoListSharedPref({super.key});

  @override
  State<CryptoListSharedPref> createState() => _CryptoListSharedPrefState();
}

class _CryptoListSharedPrefState extends State<CryptoListSharedPref> {
  final CryptoListSPBloc _cryptoListBloc = CryptoListSPBloc();
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
              'Crypto list using shared pref',
              style: TextStyle(fontSize: 20.sp, fontFamily: 'Poppins-Medium'),
            )),
          ),
          body: BlocProvider(
            create: (context) => _cryptoListBloc,
            child: BlocListener<CryptoListSPBloc, CryptoListSPState>(
              listener: (context, state) {
                if (state is CryptoListSPError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message!),
                    ),
                  );
                }
              },
              child: BlocBuilder<CryptoListSPBloc, CryptoListSPState>(
                builder: (context, state) {
                  if (state is CryptoListSPLoading) {
                    return _buildLoading();
                  } else if (state is CryptoListSPLoaded) {
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
            " Loading     ",
            style: TextStyle(fontSize: 30.sp, fontFamily: 'Poppins-Regular'),
          ),
          const CircularProgressIndicator(),
        ],
      ),
    );
  }

  Widget _buildCryptoList(List<CachedCryptoCoinSP> cachedList) {
    double width = MediaQuery.of(context).size.width;
    int childAspectRatio = width > 499
        ? width > 900
            ? 4
            : 3
        : 2;
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          Flexible(
            child: GridView.builder(
              itemCount: cachedList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: childAspectRatio,
                // MediaQuery.of(context).orientation == Orientation.landscape
                //     ? 3
                //     : 2,
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
                            fontSize: 18.sp,
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
