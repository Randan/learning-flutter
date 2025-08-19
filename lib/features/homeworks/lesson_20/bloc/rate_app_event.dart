abstract class RateAppEvent {}

class RateAppRateChanged extends RateAppEvent {
  RateAppRateChanged(this.rate);
  final int rate;
}

class RateAppReset extends RateAppEvent {}

class RateAppSubmitted extends RateAppEvent {}

class RateAppStatusReset extends RateAppEvent {}
