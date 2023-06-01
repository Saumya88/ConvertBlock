class ApiCryptoCoin {
  String? coinSymbol;
  String? coinImageUrl;

  ApiCryptoCoin({
    this.coinImageUrl,
    this.coinSymbol,
  });

  factory ApiCryptoCoin.fromJson(Map<String, dynamic> json) {
    return ApiCryptoCoin(
      coinSymbol: json['asset_id'],
      coinImageUrl: json['url'],
    );
  }
}
