import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web_project/models/coin_model.dart';

class CryptoService {
  final String baseUrl = 'appapi.staging.m2exchange.com/';
  Future<List> getAllCoins() async {
    final uri = Uri.https(baseUrl, 'app-api/convert/coins');
    final response = await http.get(uri);
    if (response.statusCode >= 200 && response.statusCode < 205) {
      final json = Map<String, dynamic>.from(jsonDecode(response.body) as Map);
      final data = List<Map<String, dynamic>>.from(
          json['data']['coinSymbolBalances'] as List);
      List<CoinModel> coins =
          data.map((coinJson) => CoinModel.fromJson(coinJson)).toList();
      return coins;
    } else {
      return [];
    }
  }
}
