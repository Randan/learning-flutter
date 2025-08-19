import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/features/homeworks/lesson_20/bloc/constants.dart';
import 'package:learning_flutter/features/homeworks/lesson_20/bloc/rate_app_state.dart';

class RateAppCubit extends Cubit<RateAppState> {
  RateAppCubit()
    : super(RateAppState(rate: 0, status: RateAppStateStatus.initial));

  void rateApp(int rate) {
    emit(state.copyWith(rate: rate));
  }

  void reset() {
    emit(state.copyWith(rate: 0, status: RateAppStateStatus.initial));
  }

  void resetStatus() {
    emit(state.resetStatus());
  }

  Future<void> sendRate() async {
    emit(state.copyWith(status: RateAppStateStatus.loading));

    await Future.delayed(const Duration(milliseconds: 500), () {});

    emit(state.copyWith(status: RateAppStateStatus.success));
  }
}
