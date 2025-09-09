// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alerts_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlertsResponseDto _$AlertsResponseDtoFromJson(Map<String, dynamic> json) =>
    AlertsResponseDto(
      alerts: (json['alerts'] as List<dynamic>)
          .map((e) => AlertDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: json['meta'] as Map<String, dynamic>,
      disclaimer: json['disclaimer'] as String,
    );

Map<String, dynamic> _$AlertsResponseDtoToJson(AlertsResponseDto instance) =>
    <String, dynamic>{
      'alerts': instance.alerts,
      'meta': instance.meta,
      'disclaimer': instance.disclaimer,
    };
