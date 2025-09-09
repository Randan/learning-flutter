// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlertDto _$AlertDtoFromJson(Map<String, dynamic> json) => AlertDto(
      id: (json['id'] as num).toInt(),
      locationTitle: json['location_title'] as String,
      locationType: json['location_type'] as String,
      startedAt: json['started_at'] as String,
      updatedAt: json['updated_at'] as String,
      alertType: json['alert_type'] as String,
      locationOblast: json['location_oblast'] as String,
      locationUid: json['location_uid'] as String,
      locationOblastUid: (json['location_oblast_uid'] as num).toInt(),
      finishedAt: json['finished_at'] as String?,
      notes: json['notes'] as String?,
      country: json['country'] as String?,
      deletedAt: json['deleted_at'] as String?,
      calculated: json['calculated'] as String?,
    );

Map<String, dynamic> _$AlertDtoToJson(AlertDto instance) => <String, dynamic>{
      'id': instance.id,
      'location_title': instance.locationTitle,
      'location_type': instance.locationType,
      'started_at': instance.startedAt,
      'finished_at': instance.finishedAt,
      'updated_at': instance.updatedAt,
      'alert_type': instance.alertType,
      'location_oblast': instance.locationOblast,
      'location_uid': instance.locationUid,
      'notes': instance.notes,
      'country': instance.country,
      'deleted_at': instance.deletedAt,
      'calculated': instance.calculated,
      'location_oblast_uid': instance.locationOblastUid,
    };
