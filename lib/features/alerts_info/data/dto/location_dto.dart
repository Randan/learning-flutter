import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:learning_flutter/features/alerts_info/data/entity/location_entity.dart';

part 'location_dto.g.dart';

@JsonSerializable()
@immutable
class LocationDto {
  const LocationDto({required this.uid, required this.locationName});

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);

  @JsonKey(name: 'uid')
  final String uid;

  @JsonKey(name: 'location_name')
  final String locationName;

  Map<String, dynamic> toJson() => _$LocationDtoToJson(this);

  LocationEntity toEntity() {
    return LocationEntity(uid: uid, locationName: locationName);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LocationDto &&
        other.uid == uid &&
        other.locationName == locationName;
  }

  @override
  int get hashCode => uid.hashCode ^ locationName.hashCode;

  @override
  String toString() {
    return 'LocationDto(uid: $uid, locationName: $locationName)';
  }
}
