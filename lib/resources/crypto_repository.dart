import 'package:web_project/models/coin_model.dart';

import 'crypto_services.dart';

class CryptoRepository {
  final _provider = CryptoService();

  Future<List<CoinModel>> getAllCoins() {
    return _provider.getAllCoins();
  }
}

class NetworkError extends Error {}
