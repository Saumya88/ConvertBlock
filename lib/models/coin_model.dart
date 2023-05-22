class CoinModel {
  String? coinSymbol;
  int? sort;
  double? totalBalance;
  double? normalBalance;
  double? lockBalance;
  double? withdrawBalance;
  bool? from = true;
  bool? to = true;

  CoinModel({
    this.coinSymbol,
    this.lockBalance,
    this.normalBalance,
    this.sort,
    this.totalBalance,
    this.withdrawBalance,
    this.from,
    this.to,
  });

  factory CoinModel.fromJson(Map<String, dynamic> json) {
    return CoinModel(
      coinSymbol: json['coinSymbol'],
      sort: int.parse(json['sort']),
      lockBalance: double.parse(json['lockBalance']),
      normalBalance: double.parse(json['normalBalance']),
      totalBalance: double.parse(json['totalBalance']),
      withdrawBalance: double.parse(json['withdrawBalance']),
      from: json['from'],
      to: json['to'],
    );
  }
}
