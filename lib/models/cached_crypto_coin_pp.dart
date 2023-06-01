class CachedCryptoCoinPP {
  String? coinSymbol;
  String? name;
  int? typeIsCrypto;

  CachedCryptoCoinPP({
    this.coinSymbol,
    this.name,
    this.typeIsCrypto,
  });

  CachedCryptoCoinPP.fromJson(Map<String, dynamic> json) {
    coinSymbol = json['asset_id'];
    name = json['name'];
    typeIsCrypto = json['type_is_crypto'];
  }
}
