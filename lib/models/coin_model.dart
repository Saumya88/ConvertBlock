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
}
