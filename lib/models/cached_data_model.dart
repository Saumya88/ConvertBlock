class CachedCryptoCoin {
  String? coinSymbol;
  String? name;
  int? typeIsCrypto;
  String? dataQuoteStart;
  String? dataQuoteEnd;
  String? dataOrderbookStart;
  String? dataOrderbookEnd;
  String? dataTradeStart;
  String? dataTradeEnd;
  String? idIcon;
  String? dataStart;
  String? dataEnd;

  CachedCryptoCoin(
      {this.coinSymbol,
      this.name,
      this.typeIsCrypto,
      this.dataQuoteStart,
      this.dataQuoteEnd,
      this.dataOrderbookStart,
      this.dataOrderbookEnd,
      this.dataTradeStart,
      this.dataTradeEnd,
      this.idIcon,
      this.dataStart,
      this.dataEnd});

  CachedCryptoCoin.fromJson(Map<String, dynamic> json) {
    coinSymbol = json['asset_id'];
    name = json['name'];
    typeIsCrypto = json['type_is_crypto'];
    dataQuoteStart = json['data_quote_start'];
    dataQuoteEnd = json['data_quote_end'];
    dataOrderbookStart = json['data_orderbook_start'];
    dataOrderbookEnd = json['data_orderbook_end'];
    dataTradeStart = json['data_trade_start'];
    dataTradeEnd = json['data_trade_end'];
    idIcon = json['id_icon'];
    dataStart = json['data_start'];
    dataEnd = json['data_end'];
  }
  // syncCache() async {
  //   final prefs = await SharedPreferences.getInstance();
  // }
}
