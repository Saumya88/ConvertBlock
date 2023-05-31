part of 'conversion_screen_bloc.dart';

abstract class ConversionScreenEvent extends Equatable {
  const ConversionScreenEvent();
  @override
  List<Object> get props => [];
}

class GetCoinList extends ConversionScreenEvent {}
