import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_project/models/coin_model.dart';
import 'package:web_project/resources/crypto_repository.dart';

part 'convert_view_event.dart';
part 'convert_view_state.dart';

class ConvertViewBloc extends Bloc<ConvertViewEvent, ConvertViewState> {
  ConvertViewBloc() : super(ConvertViewInitial()) {
    final CryptoRepository cryptoRepoistory = CryptoRepository();

    on<GetCoinList>((event, emit) async {
      try {
        emit(ConvertViewLoading());
        final coinList = await cryptoRepoistory.getAllCoins();
        emit(ConvertViewLoaded(coinList));
      } on NetworkError {
        emit(const ConvertViewError("Failed to fetch data.."));
      }
    });
  }
}
