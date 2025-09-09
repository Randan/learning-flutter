import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:learning_flutter/features/alerts_info/data/entity/alert_entity.dart';
import 'package:learning_flutter/features/alerts_info/data/entity/location_entity.dart';
import 'package:learning_flutter/features/alerts_info/data/repositories/locations_repository.dart';
import 'package:learning_flutter/features/alerts_info/data/services/location_service.dart';
import 'package:learning_flutter/features/alerts_info/presentation/bloc/alerts_event.dart';
import 'package:learning_flutter/features/alerts_info/presentation/bloc/alerts_state.dart';
import 'package:learning_flutter/features/alerts_info/presentation/constants/error_messages.dart';
import 'package:learning_flutter/features/alerts_info/presentation/constants/test_constants.dart';

class AlertsBloc extends Bloc<AlertsEvent, AlertsState> {
  AlertsBloc(this._locationsRepository) : super(const AlertsState()) {
    on<LoadLocationEvent>(_onLoadLocation);
    on<RefreshLocationEvent>(_onRefreshLocation);
    on<LoadLocationsEvent>(_onLoadLocations);
    on<MatchLocationEvent>(_onMatchLocation);
    on<LoadAlertsEvent>(_onLoadAlerts);
    on<FindUserAlertEvent>(_onFindUserAlert);
    on<TestLuganskEvent>(_onTestLugansk);
  }

  final LocationsRepository _locationsRepository;

  Future<void> _onLoadLocation(
    LoadLocationEvent event,
    Emitter<AlertsState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoading: true,
        error: null,
        clearUserAlert: true,
        clearMatchedLocation: true,
      ),
    );

    try {
      final locationJson = await LocationService.getCurrentCity();

      emit(
        state.copyWith(
          locationJson:
              locationJson ??
              '{"error": "${ErrorMessages.failedToGetLocation}"}',
          isLoading: false,
          error: null,
        ),
      );

      add(const LoadLocationsEvent());
      add(const LoadAlertsEvent());
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }

  Future<void> _onRefreshLocation(
    RefreshLocationEvent event,
    Emitter<AlertsState> emit,
  ) async {
    emit(
      state.copyWith(
        isTestMode: false,
        clearMatchedLocation: true,
        clearUserAlert: true,
        error: null,
      ),
    );

    add(const LoadLocationEvent());
  }

  Future<void> _onLoadLocations(
    LoadLocationsEvent event,
    Emitter<AlertsState> emit,
  ) async {
    try {
      final locations = await _locationsRepository.getLocations();
      emit(state.copyWith(locations: locations));

      add(const MatchLocationEvent());
      add(const FindUserAlertEvent());
    } catch (e) {
      emit(state.copyWith(error: '${ErrorMessages.failedToLoadLocations}: $e'));
    }
  }

  Future<void> _onMatchLocation(
    MatchLocationEvent event,
    Emitter<AlertsState> emit,
  ) async {
    if (state.locationJson.isEmpty || state.locations.isEmpty) return;

    try {
      final data = jsonDecode(state.locationJson) as Map<String, dynamic>;

      if (data.containsKey('error')) return;

      final address = data['address'] as Map<String, dynamic>?;
      if (address == null) return;

      final cityName = address['city'] as String?;
      if (cityName != null && cityName.isNotEmpty) {
        final cityWithPrefix = 'м. $cityName';

        final exactCityMatch = state.locations
            .where(
              (location) =>
                  location.locationName.toLowerCase() ==
                  cityWithPrefix.toLowerCase(),
            )
            .toList();

        if (exactCityMatch.isNotEmpty) {
          emit(state.copyWith(matchedLocation: exactCityMatch.first));
          return;
        }

        final firstMatch = state.locations.firstWhere(
          (location) => location.locationName.toLowerCase().contains(
            cityName.toLowerCase(),
          ),
          orElse: () => const LocationEntity(uid: '', locationName: ''),
        );

        if (firstMatch.uid.isNotEmpty) {
          emit(state.copyWith(matchedLocation: firstMatch));
          return;
        }
      }

      final adminArea = address['administrativeArea'] as String?;
      if (adminArea != null && adminArea.isNotEmpty) {
        final matchedArea = state.locations.firstWhere(
          (location) =>
              location.locationName.toLowerCase().contains(
                adminArea.toLowerCase(),
              ) ||
              adminArea.toLowerCase().contains(
                location.locationName.toLowerCase(),
              ),
          orElse: () => const LocationEntity(uid: '', locationName: ''),
        );

        if (matchedArea.uid.isNotEmpty) {
          emit(state.copyWith(matchedLocation: matchedArea));
          return;
        }
      }

      emit(state.copyWith(matchedLocation: null));
    } catch (e) {
      emit(state.copyWith(error: '${ErrorMessages.failedToMatchLocation}: $e'));
    }
  }

  Future<void> _onLoadAlerts(
    LoadAlertsEvent event,
    Emitter<AlertsState> emit,
  ) async {
    try {
      final alerts = await _locationsRepository.getActiveAlerts();
      emit(state.copyWith(alerts: alerts));
    } catch (e) {
      emit(state.copyWith(error: '${ErrorMessages.failedToLoadAlerts}: $e'));
    }
  }

  Future<void> _onFindUserAlert(
    FindUserAlertEvent event,
    Emitter<AlertsState> emit,
  ) async {
    if (state.matchedLocation?.uid == null || state.alerts.isEmpty) return;

    try {
      final userUid = state.matchedLocation!.uid;
      final userAlert = state.alerts.firstWhere(
        (alert) => alert.locationUid == userUid,
        orElse: () => const AlertEntity(
          id: 0,
          locationTitle: '',
          locationType: '',
          startedAt: '',
          updatedAt: '',
          alertType: '',
          locationOblast: '',
          locationUid: '',
          locationOblastUid: 0,
        ),
      );

      if (userAlert.id != 0) {
        emit(state.copyWith(userAlert: userAlert));
      } else {
        emit(state.copyWith(userAlert: null));
      }
    } catch (e) {
      emit(state.copyWith(userAlert: null));
    }
  }

  /// Enables test mode with hardcoded Lugansk region for testing purposes
  Future<void> _onTestLugansk(
    TestLuganskEvent event,
    Emitter<AlertsState> emit,
  ) async {
    emit(
      state.copyWith(
        isTestMode: true,
        matchedLocation: const LocationEntity(
          uid: TestConstants.testLocationUid,
          locationName: TestConstants.testLocationName,
        ),
      ),
    );

    add(const LoadAlertsEvent());
    add(const FindUserAlertEvent());
  }
}
