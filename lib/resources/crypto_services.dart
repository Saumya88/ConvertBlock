import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web_project/models/cached_crypto_coin_pp.dart';
import 'package:web_project/models/api_crypto_coin.dart';
import 'package:web_project/models/cached_crypto_coin_sp.dart';

class CryptoService {
  final String baseUrl = 'rest.coinapi.io';

  Future<List<ApiCryptoCoin>> getAllCoins() async {
    final uri = Uri.https(baseUrl, '/v1/assets/icons/32');
    final response = await http.get(uri,
        headers: {'X-CoinAPI-Key': '53D58867-46B7-43B1-95CB-3CD1F4C14B4A'});
    if (response.statusCode >= 200 && response.statusCode < 205) {
      List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(jsonDecode(response.body) as List);
      List<ApiCryptoCoin> coins =
          data.map((coinJson) => ApiCryptoCoin.fromJson(coinJson)).toList();
      loadUsingSharedPreferences();

      return coins;
    } else {
      return [];
    }
  }

  Future<List<CachedCryptoCoinSP>> loadUsingSharedPreferences() async {
    print("inside loadUsingSharedPreferences() ");

    // API url
    final cacheUri = Uri.https(baseUrl, '/v1/assets/');
    final cacheResponse = await http.get(cacheUri,
        headers: {'X-CoinAPI-Key': '53D58867-46B7-43B1-95CB-3CD1F4C14B4A'});
    //if request has succeded
    if (cacheResponse.statusCode >= 200 && cacheResponse.statusCode < 205) {
      //instance of share preferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final str = prefs.getStringList('coins');

      if (str == null) {
        print('shared preferences from API');
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
            jsonDecode(cacheResponse.body) as List);
        data = data.where((apiData) => apiData['type_is_crypto'] == 1).toList();
        prefs.setStringList(
            'coins',
            data.map((jsonData) {
              return jsonEncode(
                  {'asset_id': jsonData['asset_id'], 'name': jsonData['name']});
            }).toList());
        List<CachedCryptoCoinSP> cachedCoins = data
            .map((cacheJson) => CachedCryptoCoinSP.fromJson(cacheJson))
            .toList();
        return cachedCoins;
      } else {
        print('shared preferences from cache');
        final coinData = str
            .map((cacheJson) =>
                Map<String, dynamic>.from(jsonDecode(cacheJson) as Map))
            .toList();
        List<CachedCryptoCoinSP> cachedCoins = coinData
            .map((cacheJson) => CachedCryptoCoinSP.fromJson(cacheJson))
            .toList();
        print(cachedCoins.length);
        for (int i = 0; i < 10; i++) {
          print(cachedCoins[i].name);
        }
        return cachedCoins;
      }
    } else {
      return [];
    }
  }

  Future<List<CachedCryptoCoinPP>> loadCacheUsingPathProvider() async {
    File file;
    String fileName = "coindata.json";
    var dir = await getTemporaryDirectory(); // from path provider package
    file = File("${dir.path}/$fileName");
    print('file path: ${file.path}');
    if (!file.existsSync()) {
      // if cache file doesn't exist
      print("loading crypto list from API");
      final cacheUri = Uri.https(baseUrl, '/v1/assets/');
      final cacheResponse = await http.get(cacheUri,
          headers: {'X-CoinAPI-Key': '53D58867-46B7-43B1-95CB-3CD1F4C14B4A'});
      if (cacheResponse.statusCode >= 200 && cacheResponse.statusCode < 205) {
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
            jsonDecode(cacheResponse.body) as List);
        List<CachedCryptoCoinPP> coins = data
            .map((cacheJson) => CachedCryptoCoinPP.fromJson(cacheJson))
            .toList();
        file.writeAsStringSync(cacheResponse.body,
            flush: true, mode: FileMode.write);
        return coins;
      } else {
        return [];
      }
    } else {
      // if cache file exists
      print("loading crypto list from Cache");
      var cacheFileData = file.readAsStringSync();
      List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(jsonDecode(cacheFileData) as List);
      List<CachedCryptoCoinPP> cachedCoins = data
          .map((cacheJson) => CachedCryptoCoinPP.fromJson(cacheJson))
          .toList();

      return cachedCoins;
    }
  }
}
