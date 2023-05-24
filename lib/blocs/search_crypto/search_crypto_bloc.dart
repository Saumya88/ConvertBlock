import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_project/models/coin_model.dart';
import 'package:web_project/resources/crypto_repository.dart';

part 'search_crypto_event.dart';
part 'search_crypto_state.dart';

class SearchCryptoBloc extends Bloc<SearchCryptoEvent, SearchCryptoState> {
  SearchCryptoBloc() : super(SearchCryptoInitial()) {
    final CryptoRepository cryptoRepoistory = CryptoRepository();

    on<GetCoinList>((event, emit) async {
      try {
        emit(SearchCryptoLoading());
        final coinList = await cryptoRepoistory.getAllCoins();
        emit(SearchCryptoLoaded(coinList));
      } on NetworkError {
        emit(const SearchCryptoError("Failed to fetch data.."));
      }
    });
  }
}
