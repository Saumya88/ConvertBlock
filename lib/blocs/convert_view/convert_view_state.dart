part of 'convert_view_bloc.dart';

abstract class ConvertViewState extends Equatable {
  const ConvertViewState();
  @override
  List<Object> get props => [];
}

class ConvertViewInitial extends ConvertViewState {}

class ConvertViewLoading extends ConvertViewState {}

class ConvertViewLoaded extends ConvertViewState {
  final List<CoinModel> coinModel;
  const ConvertViewLoaded(this.coinModel);
}

class ConvertViewError extends ConvertViewState {
  final String? message;
  const ConvertViewError(this.message);
}
