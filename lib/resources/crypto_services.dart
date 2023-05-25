import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:web_project/models/cached_data_model.dart';
import 'package:web_project/models/coin_model.dart';

class CryptoService {
  final String baseUrl = 'rest.coinapi.io';

  Future<List<CoinModel>> getAllCoins() async {
    List<CachedCryptoData> temp = [];

    final uri = Uri.https(baseUrl, '/v1/assets/icons/32');
    final response = await http.get(uri,
        headers: {'X-CoinAPI-Key': '53D58867-46B7-43B1-95CB-3CD1F4C14B4A'});
    if (response.statusCode >= 200 && response.statusCode < 205) {
      List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(jsonDecode(response.body) as List);
      List<CoinModel> coins =
          data.map((coinJson) => CoinModel.fromJson(coinJson)).toList();

      temp = await loadCacheData(); // calling loadCacheData for testing
      print(coins.length);
      print(temp.length);

      return coins;
    } else {
      return [];
    }
  }

  Future<List<CachedCryptoData>> loadCacheData() async {
    String fileName = "coindata.json";
    var dir = await getTemporaryDirectory(); // from path provider package
    File file = File("${dir.path}/$fileName");
    print(file.path);

    // if cache file doesn't exist
    if (!file.existsSync()) {
      print("From API");
      final cacheUri = Uri.https(baseUrl, '/v1/assets/');
      final cacheResponse = await http.get(cacheUri,
          headers: {'X-CoinAPI-Key': '53D58867-46B7-43B1-95CB-3CD1F4C14B4A'});
      if (cacheResponse.statusCode >= 200 && cacheResponse.statusCode < 205) {
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
            jsonDecode(cacheResponse.body) as List);
        List<CachedCryptoData> coins = data
            .map((cacheJson) => CachedCryptoData.fromJson(cacheJson))
            .toList();
        file.writeAsStringSync(cacheResponse.body,
            flush: true, mode: FileMode.write);
        return coins;
      } else {
        return [];
      }
      // if cache file exists
    } else {
      print("From Cache");
      var cacheFileData = file.readAsStringSync();
      List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(jsonDecode(cacheFileData) as List);
      List<CachedCryptoData> cachedCoins = data
          .map((cacheJson) => CachedCryptoData.fromJson(cacheJson))
          .toList();
      print(cacheFileData.toString());
      return cachedCoins;
    }
  }
}
