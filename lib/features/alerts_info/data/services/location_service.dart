import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<String?> getCurrentCity() async {
    try {
      if (kIsWeb) {
        return _createErrorJson(
          'Location service not available on web platform',
        );
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return _createErrorJson('Location permission denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return _createErrorJson('Location permission permanently denied');
      }

      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks[0];
        return _createLocationJson(position, place);
      }

      return _createErrorJson('Failed to determine location');
    } catch (e) {
      return _createErrorJson('Error: $e');
    }
  }

  static String _createLocationJson(Position position, Placemark place) {
    final locationData = {
      'coordinates': {
        'latitude': position.latitude,
        'longitude': position.longitude,
        'accuracy': position.accuracy,
        'altitude': position.altitude,
        'heading': position.heading,
        'speed': position.speed,
        'timestamp': position.timestamp.millisecondsSinceEpoch,
      },
      'address': {
        'city': place.locality,
        'administrativeArea': place.administrativeArea,
        'country': place.country,
        'postalCode': place.postalCode,
        'street': place.street,
        'subLocality': place.subLocality,
        'subAdministrativeArea': place.subAdministrativeArea,
        'isoCountryCode': place.isoCountryCode,
      },
      'formatted_address': _formatAddress(place),
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };

    return const JsonEncoder.withIndent('  ').convert(locationData);
  }

  static String _createErrorJson(String error) {
    final errorData = {
      'error': error,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };

    return const JsonEncoder.withIndent('  ').convert(errorData);
  }

  static String _formatAddress(Placemark place) {
    final parts = <String>[];

    if (place.street != null && place.street!.isNotEmpty) {
      parts.add(place.street!);
    }
    if (place.locality != null && place.locality!.isNotEmpty) {
      parts.add(place.locality!);
    }
    if (place.administrativeArea != null &&
        place.administrativeArea!.isNotEmpty) {
      parts.add(place.administrativeArea!);
    }
    if (place.country != null && place.country!.isNotEmpty) {
      parts.add(place.country!);
    }

    return parts.join(', ');
  }

  static Future<Position?> getCurrentPosition() async {
    try {
      if (kIsWeb) {
        return null;
      }

      var permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return null;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return null;
      }

      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
    } catch (e) {
      return null;
    }
  }
}
