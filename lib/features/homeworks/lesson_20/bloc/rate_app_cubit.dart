import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_flutter/features/homeworks/lesson_20/bloc/constants.dart';
import 'package:learning_flutter/features/homeworks/lesson_20/bloc/rate_app_state.dart';
import 'package:learning_flutter/widgets/custom_snackbar.dart';

class RateAppCubit extends Cubit<RateAppState> {
  RateAppCubit()
    : super(RateAppState(rate: 0, status: RateAppStateStatus.initial));

  void rateApp(int rate) {
    emit(state.copyWith(rate: rate));
  }

  void reset() {
    emit(state.copyWith(rate: 0, status: RateAppStateStatus.initial));
  }

  void sendRate(BuildContext context) {
    emit(state.copyWith(status: RateAppStateStatus.loading));

    Future.delayed(const Duration(milliseconds: 500), () {
      emit(state.copyWith(status: RateAppStateStatus.success).submitRating());

      if (context.mounted) {
        CustomSnackBar.show(
          context: context,
          message: 'Дякуємо за оцінку! Ваша оцінка: ${state.rate}/$maxRate',
          type: SnackBarType.success,
        );

        context.pop();
      }
    });
  }
}
