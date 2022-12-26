import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'weatherData.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {
  ApiBloc() : super(ApiInitial()) {
    on<ApiCall>((event, emit) async {
      try {
        emit(ApiLoad());
        final response = await Dio().get('https://goweather.herokuapp.com/weather/singapore');
        emit(ApiLoadSuccess(weather: Weather.fromJson(jsonDecode(response.toString()))));
      } catch (e) {
        emit(ApiLoadFailed());
      }
    });
  }
}
