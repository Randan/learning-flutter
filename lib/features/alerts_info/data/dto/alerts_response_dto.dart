import 'package:json_annotation/json_annotation.dart';
import 'package:learning_flutter/features/alerts_info/data/dto/alert_dto.dart';

part 'alerts_response_dto.g.dart';

@JsonSerializable()
class AlertsResponseDto {
  const AlertsResponseDto({
    required this.alerts,
    required this.meta,
    required this.disclaimer,
  });

  factory AlertsResponseDto.fromJson(Map<String, dynamic> json) =>
      _$AlertsResponseDtoFromJson(json);

  @JsonKey(name: 'alerts')
  final List<AlertDto> alerts;

  @JsonKey(name: 'meta')
  final Map<String, dynamic> meta;

  @JsonKey(name: 'disclaimer')
  final String disclaimer;

  Map<String, dynamic> toJson() => _$AlertsResponseDtoToJson(this);
}
