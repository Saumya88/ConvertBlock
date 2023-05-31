part of 'crypto_list_bloc.dart';

abstract class CryptoListEvent extends Equatable {
  const CryptoListEvent();
  @override
  List<Object> get props => [];
}

class GetCacheData extends CryptoListEvent {}
