import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:web_project/models/cached_data_model.dart';
import 'package:web_project/models/coin_model.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:path_provider_windows/path_provider_windows.dart';

class CryptoService {
  final String baseUrl = 'rest.coinapi.io';

  Future<List<CoinModel>> getAllCoins() async {
    print('Function called for conversion api');
    final uri = Uri.https(baseUrl, '/v1/assets/icons/32');
    final response = await http.get(uri,
        headers: {'X-CoinAPI-Key': '53D58867-46B7-43B1-95CB-3CD1F4C14B4A'});
    if (response.statusCode >= 200 && response.statusCode < 205) {
      List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(jsonDecode(response.body) as List);
      List<CoinModel> coins =
          data.map((coinJson) => CoinModel.fromJson(coinJson)).toList();

      return coins;
    } else {
      return [];
    }
  }

  Future<List<CachedCryptoCoin>> loadUsingSharedPreferences() async {
    List<CachedCryptoCoin> coins = [];
    return coins;
  }

  Future<List<CachedCryptoCoin>> loadCacheData() async {
    print('Function called for crypto list data api');
    File file;
    String fileName = "coindata.json";
    var dir = await getTemporaryDirectory(); // from path provider package
    file = File("${dir.path}/$fileName");
    print('file path: ${file.path}');
    // print('Value of kIsweb is: $kIsWeb');
    // if (kIsWeb) {
    //   print("inside web");
    //   String fileName = "webcoindata.json";
    //   final PathProviderWindows provider = PathProviderWindows();
    //   String? webDir;
    //   //var webDir = await provider.getTemporaryPath();
    //   try {
    //     webDir = await provider.getApplicationDocumentsPath();
    //   } catch (exception) {
    //     webDir = 'Failed to get temp directory: $exception';
    //   }
    //   print("object");
    //   print('directory path: $webDir');
    //   file = File("${webDir!}/$fileName");
    //   print('Web sile path: ${file.path}');
    // } else {
    //   print("inside android");
    //   String fileName = "coindata.json";
    //   var dir = await getTemporaryDirectory(); // from path provider package
    //   file = File("${dir.path}/$fileName");
    //   print('Web file path: ${file.path}');
    // }

    // if cache file doesn't exist
    if (!file.existsSync()) {
      print("loading crypto list from API");
      final cacheUri = Uri.https(baseUrl, '/v1/assets/');
      final cacheResponse = await http.get(cacheUri,
          headers: {'X-CoinAPI-Key': '53D58867-46B7-43B1-95CB-3CD1F4C14B4A'});
      if (cacheResponse.statusCode >= 200 && cacheResponse.statusCode < 205) {
        List<Map<String, dynamic>> data = List<Map<String, dynamic>>.from(
            jsonDecode(cacheResponse.body) as List);
        List<CachedCryptoCoin> coins = data
            .map((cacheJson) => CachedCryptoCoin.fromJson(cacheJson))
            .toList();
        file.writeAsStringSync(cacheResponse.body,
            flush: true, mode: FileMode.write);
        return coins;
      } else {
        return [];
      }
      // if cache file exists
    } else {
      print("loading crypto list from Cache");
      var cacheFileData = file.readAsStringSync();
      List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(jsonDecode(cacheFileData) as List);
      List<CachedCryptoCoin> cachedCoins = data
          .map((cacheJson) => CachedCryptoCoin.fromJson(cacheJson))
          .toList();

      return cachedCoins;
    }
  }
}
