import 'package:learning_flutter/features/alerts_info/data/data_source/locations_remote_data_source.dart';
import 'package:learning_flutter/features/alerts_info/data/entity/alert_entity.dart';
import 'package:learning_flutter/features/alerts_info/data/entity/location_entity.dart';

class LocationsRepository {
  const LocationsRepository(this._remoteDataSource);

  final LocationsRemoteDataSource _remoteDataSource;

  Future<List<LocationEntity>> getLocations() async {
    final locationDtos = await _remoteDataSource.getLocations();
    return locationDtos.map((dto) => dto.toEntity()).toList();
  }

  Future<List<AlertEntity>> getActiveAlerts() async {
    final alertsResponse = await _remoteDataSource.getActiveAlerts();
    return alertsResponse.alerts.map((dto) => dto.toEntity()).toList();
  }
}
