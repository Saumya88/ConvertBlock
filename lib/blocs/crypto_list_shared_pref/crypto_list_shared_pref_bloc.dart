import 'package:web_project/models/cached_crypto_coin_sp.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_project/resources/crypto_repository.dart';

part 'crypto_list_shared_pref_event.dart';
part 'crypto_list_shared_pref_state.dart';

class CryptoListSPBloc extends Bloc<CryptoListSPEvent, CryptoListSPState> {
  CryptoListSPBloc() : super(CryptoListSPInitial()) {
    final CryptoRepository cryptoRepoistory = CryptoRepository();
    on<GetCacheData>((event, emit) async {
      try {
        emit(CryptoListSPLoading());
        final cachedCoinList = await cryptoRepoistory.loadCachedDataSP();
        emit(CryptoListSPLoaded(cachedCoinList));
      } on NetworkError {
        emit(const CryptoListSPError("Failed to fetch data.."));
      }
    });
  }
}
