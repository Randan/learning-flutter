import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learning_flutter/features/rate_app/presentation/bloc/constants.dart';
import 'package:learning_flutter/features/rate_app/presentation/bloc/rate_app_event.dart';
import 'package:learning_flutter/features/rate_app/presentation/bloc/rate_app_state.dart';

class RateAppBloc extends Bloc<RateAppEvent, RateAppState> {
  RateAppBloc()
    : super(RateAppState(rate: 0, status: RateAppStateStatus.initial)) {
    on<RateAppRateChanged>(_onRateChanged);
    on<RateAppReset>(_onReset);
    on<RateAppSubmitted>(_onSubmit);
    on<RateAppStatusReset>(_onStatusReset);
  }

  void _onRateChanged(RateAppRateChanged event, Emitter<RateAppState> emit) {
    emit(state.copyWith(rate: event.rate));
  }

  void _onReset(RateAppReset event, Emitter<RateAppState> emit) {
    emit(state.copyWith(rate: 0, status: RateAppStateStatus.initial));
  }

  void _onStatusReset(RateAppStatusReset event, Emitter<RateAppState> emit) {
    emit(state.resetStatus());
  }

  Future<void> _onSubmit(
    RateAppSubmitted event,
    Emitter<RateAppState> emit,
  ) async {
    emit(state.copyWith(status: RateAppStateStatus.loading));

    await Future.delayed(const Duration(milliseconds: 500), () {});

    emit(state.copyWith(status: RateAppStateStatus.success));
  }
}
