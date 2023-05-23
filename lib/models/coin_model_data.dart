import 'package:flutter/material.dart';

class CryptoCoin {
  const CryptoCoin(
      {required this.coinSymbol,
      required this.coinName,
      required this.coinImageUrl,
      required this.circleAvatarColor});

  final String coinSymbol;
  final String coinName;
  final String coinImageUrl;
  final Color circleAvatarColor;
}
