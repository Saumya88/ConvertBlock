class CachedCryptoCoinSP {
  String? coinSymbol;
  String? name;

  CachedCryptoCoinSP({
    this.coinSymbol,
    this.name,
  });

  CachedCryptoCoinSP.fromJson(Map<String, dynamic> json) {
    coinSymbol = json['asset_id'];
    name = json['name'];
  }
}
