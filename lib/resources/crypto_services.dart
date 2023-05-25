import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_project/models/cached_data_model.dart';
import 'package:web_project/models/coin_model.dart';

class CryptoService {
  final String baseUrl = 'rest.coinapi.io';
  List<CachedCryptoData> cachedCoins = [];

  Future<List<CoinModel>> getAllCoins() async {
    final uri = Uri.https(baseUrl, '/v1/assets/icons/32');
    final response = await http.get(uri,
        headers: {'X-CoinAPI-Key': '53D58867-46B7-43B1-95CB-3CD1F4C14B4A'});
    if (response.statusCode >= 200 && response.statusCode < 205) {
      List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(jsonDecode(response.body) as List);
      List<CoinModel> coins =
          data.map((coinJson) => CoinModel.fromJson(coinJson)).toList();

      cachedCoins = await loadCacheData(); // calling loadCacheData for testing
      print(coins.length);
      print(cachedCoins.length);

      return coins;
    } else {
      return [];
    }
  }

  Future<List<CachedCryptoData>> loadCacheData() async {
    final cacheUri = Uri.https(baseUrl, '/v1/assets/');
    final cacheResponse = await http.get(cacheUri,
        headers: {'X-CoinAPI-Key': '53D58867-46B7-43B1-95CB-3CD1F4C14B4A'});
    if (cacheResponse.statusCode >= 200 && cacheResponse.statusCode < 205) {
      List<Map<String, dynamic>> cacheData = List<Map<String, dynamic>>.from(
          jsonDecode(cacheResponse.body) as List);
      List<CachedCryptoData> cachedCoins = cacheData
          .map((cacheJson) => CachedCryptoData.fromJson(cacheJson))
          .toList();

      return cachedCoins;
    } else {
      return [];
    }
  }
}
