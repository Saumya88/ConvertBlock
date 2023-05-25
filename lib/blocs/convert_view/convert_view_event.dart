part of 'convert_view_bloc.dart';

abstract class ConvertViewEvent extends Equatable {
  const ConvertViewEvent();
  @override
  List<Object> get props => [];
}

class GetCoinList extends ConvertViewEvent {}
