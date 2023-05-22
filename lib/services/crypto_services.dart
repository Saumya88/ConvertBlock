import 'package:http/http.dart' as http;

class CryptoService {
  Future<List> getAllCoins() async {
    http.Response response = await http.get(Uri.parse(
        'https://appapi.staging.m2exchange.com/app-api/convert/coins'));
  }
}
