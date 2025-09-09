import 'package:flutter/foundation.dart';

@immutable
class LocationEntity {
  const LocationEntity({required this.uid, required this.locationName});

  final String uid;
  final String locationName;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LocationEntity &&
        other.uid == uid &&
        other.locationName == locationName;
  }

  @override
  int get hashCode => uid.hashCode ^ locationName.hashCode;

  @override
  String toString() {
    return 'LocationEntity(uid: $uid, locationName: $locationName)';
  }
}
