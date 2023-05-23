import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_project/models/coin_model.dart';

class CryptoService {
  //todo chnage base url
  final String baseUrl = 'rest.coinapi.io/v1/';
  Future<List> getAllCoins() async {
    final uri = Uri.https(baseUrl, 'assets');
    final response = await http.get(uri,
        headers: {'X-CoinAPI-Key': '1A086DEF-566A-4B24-A84C-34DB21BC84B3'});
    if (response.statusCode >= 200 && response.statusCode < 205) {
      List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(jsonDecode(response.body) as List);
      data = data
          .where((jsonData) => jsonData["type_is_crypto"] == 1)
          .toList(); //filtering crypto currency data
      List<CoinModel> coins =
          data.map((coinJson) => CoinModel.fromJson(coinJson)).toList();
      return coins;
    } else {
      return [];
    }
  }
}
