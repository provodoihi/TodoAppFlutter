part of 'api_bloc.dart';

@immutable
abstract class ApiState {
  const ApiState();

  List<Object> get props => [];
}

class ApiInitial extends ApiState {}

class ApiLoad extends ApiState {}

class ApiLoadSuccess extends ApiState {
  final Weather weather;

  const ApiLoadSuccess({required this.weather});

  @override
  List<Object> get props => [weather];
}

class ApiLoadFailed extends ApiState {}
