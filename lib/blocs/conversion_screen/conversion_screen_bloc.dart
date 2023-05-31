import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_project/models/coin_model.dart';
import 'package:web_project/resources/crypto_repository.dart';

part 'conversion_screen_event.dart';
part 'conversion_screen_state.dart';

class ConversionScreenBloc
    extends Bloc<ConversionScreenEvent, ConversionScreenState> {
  ConversionScreenBloc() : super(ConversionScreenInitial()) {
    final CryptoRepository cryptoRepoistory = CryptoRepository();

    on<GetCoinList>((event, emit) async {
      try {
        emit(ConversionScreenLoading());
        final coinList = await cryptoRepoistory.getAllCoins();
        emit(ConversionScreenLoaded(coinList));
      } on NetworkError {
        emit(const ConversionScreenError("Failed to fetch data.."));
      }
    });
  }
}
