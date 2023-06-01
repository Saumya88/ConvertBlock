part of 'crypto_list_shared_pref_bloc.dart';

abstract class CryptoListSPState extends Equatable {
  const CryptoListSPState();
  @override
  List<Object> get props => [];
}

class CryptoListSPInitial extends CryptoListSPState {}

class CryptoListSPLoading extends CryptoListSPState {}

class CryptoListSPLoaded extends CryptoListSPState {
  final List<CachedCryptoCoinSP> cachedCryptoCoinList;
  const CryptoListSPLoaded(this.cachedCryptoCoinList);
}

class CryptoListSPError extends CryptoListSPState {
  final String? message;
  const CryptoListSPError(this.message);
}
