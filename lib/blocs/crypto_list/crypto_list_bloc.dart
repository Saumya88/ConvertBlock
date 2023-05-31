import 'package:web_project/models/cached_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_project/resources/crypto_repository.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc() : super(CryptoListInitial()) {
    final CryptoRepository cryptoRepoistory = CryptoRepository();
    on<GetCacheData>((event, emit) async {
      try {
        emit(CryptoListLoading());
        final cachedCoinList = await cryptoRepoistory.loadCachedData();
        emit(CryptoListLoaded(cachedCoinList));
      } on NetworkError {
        emit(const CryptoListError("Failed to fetch data.."));
      }
    });
  }
}
