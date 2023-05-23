class CoinModel {
  String? coinName;
  String? coinSymbolImage;

  CoinModel({this.coinName, this.coinSymbolImage});

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      coinName: json['coinName'],
      coinSymbolImage: json['coinSymbolImage'],
    );
  }
}
