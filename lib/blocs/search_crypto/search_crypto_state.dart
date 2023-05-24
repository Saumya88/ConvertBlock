part of 'search_crypto_bloc.dart';

abstract class SearchCryptoState extends Equatable {
  const SearchCryptoState();
  List<Object> get props => [];
}

class SearchCryptoInitial extends SearchCryptoState {}

class SearchCryptoLoading extends SearchCryptoState {}

class SearchCryptoLoaded extends SearchCryptoState {
  final List<CoinModel> coinModel;
  const SearchCryptoLoaded(this.coinModel);
}

class SearchCryptoError extends SearchCryptoState {
  final String? message;
  const SearchCryptoError(this.message);
}
