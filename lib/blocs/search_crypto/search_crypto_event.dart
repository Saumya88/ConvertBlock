part of 'search_crypto_bloc.dart';

abstract class SearchCryptoEvent extends Equatable {
  const SearchCryptoEvent();
  List<Object> get props => [];
}

class GetCoinList extends SearchCryptoEvent {}
