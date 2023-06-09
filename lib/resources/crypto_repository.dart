import 'package:web_project/models/cached_crypto_coin_pp.dart';
import 'package:web_project/models/api_crypto_coin.dart';
import 'package:web_project/models/cached_crypto_coin_sp.dart';

import 'crypto_services.dart';

class CryptoRepository {
  final _provider = CryptoService();

  Future<List<ApiCryptoCoin>> getAllCoins() {
    return _provider.getAllCoins();
  }

  Future<List<CachedCryptoCoinPP>> loadCachedData() {
    return _provider.loadCacheUsingPathProvider();
  }

  Future<List<CachedCryptoCoinSP>> loadCachedDataSP() {
    return _provider.loadUsingSharedPreferences();
  }
}

class NetworkError extends Error {}
