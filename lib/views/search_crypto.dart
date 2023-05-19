import 'package:flutter/material.dart';

class SearchCrypto extends StatefulWidget {
  const SearchCrypto({super.key});

  @override
  State<SearchCrypto> createState() => _SearchCryptoState();
}

class _SearchCryptoState extends State<SearchCrypto> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Text("Search Crypto"),
          ],
        ),
      ),
    ));
  }
}
