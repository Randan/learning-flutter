import 'package:learning_flutter/features/alerts_info/data/data_source/alerts_api_service.dart';
import 'package:learning_flutter/features/alerts_info/data/dto/alerts_response_dto.dart';
import 'package:learning_flutter/features/alerts_info/data/dto/location_dto.dart';

class LocationsRemoteDataSource {
  const LocationsRemoteDataSource(this._apiService);

  final AlertsApiService _apiService;

  Future<List<LocationDto>> getLocations() async {
    try {
      final alertsResponse = await _apiService.getAlertsForLocations();

      final uniqueLocationNames = <String>{};
      final locations = <LocationDto>[];

      for (final alert in alertsResponse.alerts) {
        if (!uniqueLocationNames.contains(alert.locationTitle)) {
          uniqueLocationNames.add(alert.locationTitle);
          locations.add(
            LocationDto(
              uid: alert.locationUid,
              locationName: alert.locationTitle,
            ),
          );
        }
      }

      return locations;
    } catch (e) {
      throw Exception('Error fetching locations: $e');
    }
  }

  Future<AlertsResponseDto> getActiveAlerts() async {
    try {
      return await _apiService.getAlertsForLocations();
    } catch (e) {
      throw Exception('Error fetching alerts: $e');
    }
  }
}
