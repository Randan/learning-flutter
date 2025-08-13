import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_flutter/features/homeworks/lesson_20/bloc/constants.dart';
import 'package:learning_flutter/features/homeworks/lesson_20/bloc/rate_app_event.dart';
import 'package:learning_flutter/features/homeworks/lesson_20/bloc/rate_app_state.dart';
import 'package:learning_flutter/widgets/custom_snackbar.dart';

class RateAppBloc extends Bloc<RateAppEvent, RateAppState> {
  RateAppBloc()
    : super(RateAppState(rate: 0, status: RateAppStateStatus.initial)) {
    on<RateAppRateChanged>(_onRateChanged);
    on<RateAppReset>(_onReset);
    on<RateAppSubmit>(_onSubmit);
  }

  void _onRateChanged(RateAppRateChanged event, Emitter<RateAppState> emit) {
    emit(state.copyWith(rate: event.rate));
  }

  void _onReset(RateAppReset event, Emitter<RateAppState> emit) {
    emit(state.copyWith(rate: 0, status: RateAppStateStatus.initial));
  }

  Future<void> _onSubmit(
    RateAppSubmit event,
    Emitter<RateAppState> emit,
  ) async {
    emit(state.copyWith(status: RateAppStateStatus.loading));

    await Future.delayed(const Duration(milliseconds: 500), () {});

    if (event.context.mounted) {
      emit(state.copyWith(status: RateAppStateStatus.success).submitRating());

      CustomSnackBar.show(
        context: event.context,
        message: 'Дякуємо за оцінку! Ваша оцінка: ${state.rate}/$maxRate',
        type: SnackBarType.success,
      );

      event.context.pop();
    }
  }
}
