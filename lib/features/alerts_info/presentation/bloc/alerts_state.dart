import 'package:flutter/foundation.dart';

import 'package:learning_flutter/features/alerts_info/data/entity/alert_entity.dart';
import 'package:learning_flutter/features/alerts_info/data/entity/location_entity.dart';

@immutable
class AlertsState {
  const AlertsState({
    this.locationJson = '',
    this.locations = const [],
    this.matchedLocation,
    this.alerts = const [],
    this.userAlert,
    this.isLoading = false,
    this.error,
    this.isTestMode = false,
  });

  final String locationJson;
  final List<LocationEntity> locations;
  final LocationEntity? matchedLocation;
  final List<AlertEntity> alerts;
  final AlertEntity? userAlert;
  final bool isLoading;
  final String? error;
  final bool isTestMode;

  AlertsState copyWith({
    String? locationJson,
    List<LocationEntity>? locations,
    LocationEntity? matchedLocation,
    List<AlertEntity>? alerts,
    AlertEntity? userAlert,
    bool? isLoading,
    String? error,
    bool? isTestMode,
    bool clearMatchedLocation = false,
    bool clearUserAlert = false,
  }) {
    return AlertsState(
      locationJson: locationJson ?? this.locationJson,
      locations: locations ?? this.locations,
      matchedLocation: clearMatchedLocation
          ? null
          : (matchedLocation ?? this.matchedLocation),
      alerts: alerts ?? this.alerts,
      userAlert: clearUserAlert ? null : (userAlert ?? this.userAlert),
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
      isTestMode: isTestMode ?? this.isTestMode,
    );
  }

  @override
  String toString() {
    return 'AlertsState(locationJson: $locationJson, locations: $locations, '
        'matchedLocation: $matchedLocation, alerts: $alerts, '
        'userAlert: $userAlert, isLoading: $isLoading, error: $error, '
        'isTestMode: $isTestMode)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AlertsState &&
        other.locationJson == locationJson &&
        other.locations == locations &&
        other.matchedLocation == matchedLocation &&
        other.alerts == alerts &&
        other.userAlert == userAlert &&
        other.isLoading == isLoading &&
        other.error == error &&
        other.isTestMode == isTestMode;
  }

  @override
  int get hashCode {
    return locationJson.hashCode ^
        locations.hashCode ^
        matchedLocation.hashCode ^
        alerts.hashCode ^
        userAlert.hashCode ^
        isLoading.hashCode ^
        error.hashCode ^
        isTestMode.hashCode;
  }
}
