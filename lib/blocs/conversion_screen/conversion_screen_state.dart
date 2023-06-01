part of 'conversion_screen_bloc.dart';

abstract class ConversionScreenState extends Equatable {
  const ConversionScreenState();
  @override
  List<Object> get props => [];
}

class ConversionScreenInitial extends ConversionScreenState {}

class ConversionScreenLoading extends ConversionScreenState {}

class ConversionScreenLoaded extends ConversionScreenState {
  final List<ApiCryptoCoin> coinModel;
  const ConversionScreenLoaded(this.coinModel);
}

class ConversionScreenError extends ConversionScreenState {
  final String? message;
  const ConversionScreenError(this.message);
}
