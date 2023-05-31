class CoinModel {
  String? coinSymbol;
  String? coinImageUrl;

  CoinModel({
    this.coinImageUrl,
    this.coinSymbol,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      coinSymbol: json['asset_id'],
      coinImageUrl: json['url'],
    );
  }
}
