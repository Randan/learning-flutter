import 'package:flutter/material.dart';

abstract class RateAppEvent {}

class RateAppRateChanged extends RateAppEvent {
  RateAppRateChanged(this.rate);
  final int rate;
}

class RateAppReset extends RateAppEvent {}

class RateAppSubmit extends RateAppEvent {
  RateAppSubmit(this.context);
  final BuildContext context;
}
