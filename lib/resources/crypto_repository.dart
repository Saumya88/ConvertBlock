import 'package:web_project/models/cached_data_model.dart';
import 'package:web_project/models/coin_model.dart';

import 'crypto_services.dart';

class CryptoRepository {
  final _provider = CryptoService();

  Future<List<CoinModel>> getAllCoins() {
    return _provider.getAllCoins();
  }

  Future<List<CachedCryptoData>> loadCachedData() {
    return _provider.loadCacheData();
  }
}

class NetworkError extends Error {}
