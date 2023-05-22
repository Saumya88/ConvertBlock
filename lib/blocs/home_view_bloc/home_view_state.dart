part of 'home_view_bloc.dart';

@immutable
abstract class HomeViewState {}

class HomeViewInitial extends HomeViewState {}

class SwitchCryptoSection extends HomeViewState {
  String? selectedSection = 'From';
}
