import 'package:learning_flutter/features/homeworks/lesson_20/bloc/constants.dart';

class RateAppState {
  RateAppState({required this.rate, required this.status})
    : _rateCached = rate,
      _isDirty = false;

  RateAppState._internal({
    required this.rate,
    required this.status,
    required int rateCached,
  }) : _rateCached = rateCached,
       _isDirty = rate != rateCached;

  final int rate;
  final RateAppStateStatus status;
  final int _rateCached;
  final bool _isDirty;

  bool get isDirtyState => _isDirty;

  RateAppState _updateCachedRating() {
    return RateAppState._internal(rate: rate, status: status, rateCached: rate);
  }

  RateAppState copyWith({int? rate, RateAppStateStatus? status}) {
    final newRate = rate ?? this.rate;
    return RateAppState._internal(
      rate: newRate,
      status: status ?? this.status,
      rateCached: _rateCached,
    );
  }

  RateAppState submitRating() {
    return _updateCachedRating();
  }
}
