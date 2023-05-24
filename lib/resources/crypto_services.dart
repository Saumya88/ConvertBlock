import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_project/models/coin_model.dart';

class CryptoService {
  final String baseUrl = 'rest.coinapi.io';

  Future<List<CoinModel>> getAllCoins() async {
    final uri = Uri.https(baseUrl, '/v1/assets/icons/32');
    final response = await http.get(uri,
        headers: {'X-CoinAPI-Key': '53D58867-46B7-43B1-95CB-3CD1F4C14B4A'});
    if (response.statusCode >= 200 && response.statusCode < 205) {
      List<Map<String, dynamic>> data =
          List<Map<String, dynamic>>.from(jsonDecode(response.body) as List);
      print("hello I am here");
      print(data);
      List<CoinModel> coins =
          data.map((coinJson) => CoinModel.fromJson(coinJson)).toList();
      return coins;
    } else {
      return [];
    }
  }
}
