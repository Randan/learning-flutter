import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:learning_flutter/features/alerts_info/data/data_source/alerts_api_service.dart';
import 'package:learning_flutter/features/alerts_info/data/dto/alerts_response_dto.dart';
import 'package:learning_flutter/features/alerts_info/data/dto/location_dto.dart';

class LocationsRemoteDataSource {
  const LocationsRemoteDataSource(this._apiService);

  final AlertsApiService _apiService;

  Future<List<LocationDto>> getLocations() async {
    try {
      final token = dotenv.env['ALERTS_API_TOKEN'];
      if (token == null) {
        throw Exception('API token not found');
      }

      final alertsResponse = await _apiService.getAlertsForLocations(token);

      // Extract unique locations from alerts
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
      final token = dotenv.env['ALERTS_API_TOKEN'];
      if (token == null) {
        throw Exception('API token not found');
      }
      return await _apiService.getActiveAlerts(token);
    } catch (e) {
      throw Exception('Error fetching alerts: $e');
    }
  }
}
