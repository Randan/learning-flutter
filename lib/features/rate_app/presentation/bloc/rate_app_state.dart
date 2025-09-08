import 'package:learning_flutter/features/rate_app/presentation/bloc/constants.dart';

class RateAppState {
  const RateAppState({required this.rate, required this.status});

  final int rate;
  final RateAppStateStatus status;

  bool get isDirtyState => rate > 0;

  RateAppState copyWith({int? rate, RateAppStateStatus? status}) {
    return RateAppState(rate: rate ?? this.rate, status: status ?? this.status);
  }

  RateAppState resetStatus() {
    return copyWith(status: RateAppStateStatus.initial);
  }
}
