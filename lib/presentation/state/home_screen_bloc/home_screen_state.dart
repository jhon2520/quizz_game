part of 'home_screen_bloc.dart';

sealed class HomeScreenState extends Equatable {
  const HomeScreenState();
  
  @override
  List<Object> get props => [];
}

class HomeScreenInitialState extends HomeScreenState {}


class HomeScreenInitLoadingState extends HomeScreenState{}

class HomeScreenErrorState extends HomeScreenState{
  final String? errorMessage;
  const HomeScreenErrorState({this.errorMessage});
}
