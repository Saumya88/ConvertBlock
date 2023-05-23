class CryptoCoin {
  const CryptoCoin(
      {required this.coinSymbol,
      required this.coinName,
      required this.coinImageUrl});

  final String coinSymbol;
  final String coinName;
  final String coinImageUrl;
}

final List<CryptoCoin> _cryptoCoins = <CryptoCoin>[
  const CryptoCoin(
      coinSymbol: 'BTC',
      coinName: 'Bitcoin',
      coinImageUrl: 'assets/coins/BTC.png'),
  const CryptoCoin(
      coinSymbol: 'LTC',
      coinName: 'Litecoin',
      coinImageUrl: 'assets/coins/LTC.png'),
  const CryptoCoin(
      coinSymbol: 'ADA',
      coinName: 'Cardano',
      coinImageUrl: 'assets/coins/ADA.png'),
  const CryptoCoin(
      coinSymbol: 'ENJ',
      coinName: 'Enjin',
      coinImageUrl: 'assets/coins/ENJ.png'),
  const CryptoCoin(
      coinSymbol: 'SOL',
      coinName: 'Solano',
      coinImageUrl: 'assets/coins/SOL.png'),
];
