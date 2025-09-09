import 'package:flutter/foundation.dart';

@immutable
abstract class AlertsEvent {
  const AlertsEvent();
}

class LoadLocationEvent extends AlertsEvent {
  const LoadLocationEvent();
}

class RefreshLocationEvent extends AlertsEvent {
  const RefreshLocationEvent();
}

class LoadLocationsEvent extends AlertsEvent {
  const LoadLocationsEvent();
}

class MatchLocationEvent extends AlertsEvent {
  const MatchLocationEvent();
}

class LoadAlertsEvent extends AlertsEvent {
  const LoadAlertsEvent();
}

class FindUserAlertEvent extends AlertsEvent {
  const FindUserAlertEvent();
}

class TestLuganskEvent extends AlertsEvent {
  const TestLuganskEvent();
}
