part of 'crypto_list_bloc.dart';

abstract class CryptoListState extends Equatable {
  const CryptoListState();
  @override
  List<Object> get props => [];
}

class CryptoListInitial extends CryptoListState {}

class CryptoListLoading extends CryptoListState {}

class CryptoListLoaded extends CryptoListState {
  final List<CachedCryptoCoinPP> cachedCryptoCoinList;
  const CryptoListLoaded(this.cachedCryptoCoinList);
}

class CryptoListError extends CryptoListState {
  final String? message;
  const CryptoListError(this.message);
}
