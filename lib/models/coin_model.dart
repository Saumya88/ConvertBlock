class CoinModel {
  String? coinSymbol;
  String? coinFullName;
  String? coinImageUrl;
  double? priceInUSD;
  int? isCryptoCurrency;

  CoinModel(
      {this.coinImageUrl,
      this.coinSymbol,
      this.coinFullName,
      this.priceInUSD,
      this.isCryptoCurrency});

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
        coinSymbol: json['asset_id'],
        coinImageUrl: json['coinSymbolImage'],
        coinFullName: json['name'],
        priceInUSD: json['price_usd'],
        isCryptoCurrency: json['type_is_crypto']);
  }
}
