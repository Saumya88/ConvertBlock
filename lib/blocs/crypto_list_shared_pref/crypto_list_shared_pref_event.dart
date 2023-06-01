part of 'crypto_list_shared_pref_bloc.dart';

abstract class CryptoListSPEvent extends Equatable {
  const CryptoListSPEvent();
  @override
  List<Object> get props => [];
}

class GetCacheData extends CryptoListSPEvent {}
