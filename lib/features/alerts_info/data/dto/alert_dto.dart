import 'package:json_annotation/json_annotation.dart';
import 'package:learning_flutter/features/alerts_info/data/entity/alert_entity.dart';

part 'alert_dto.g.dart';

@JsonSerializable()
class AlertDto {
  const AlertDto({
    required this.id,
    required this.locationTitle,
    required this.locationType,
    required this.startedAt,
    required this.updatedAt,
    required this.alertType,
    required this.locationOblast,
    required this.locationUid,
    required this.locationOblastUid,
    this.finishedAt,
    this.notes,
    this.country,
    this.deletedAt,
    this.calculated,
  });

  factory AlertDto.fromJson(Map<String, dynamic> json) =>
      _$AlertDtoFromJson(json);

  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'location_title')
  final String locationTitle;

  @JsonKey(name: 'location_type')
  final String locationType;

  @JsonKey(name: 'started_at')
  final String startedAt;

  @JsonKey(name: 'finished_at')
  final String? finishedAt;

  @JsonKey(name: 'updated_at')
  final String updatedAt;

  @JsonKey(name: 'alert_type')
  final String alertType;

  @JsonKey(name: 'location_oblast')
  final String locationOblast;

  @JsonKey(name: 'location_uid')
  final String locationUid;

  @JsonKey(name: 'notes')
  final String? notes;

  @JsonKey(name: 'country')
  final String? country;

  @JsonKey(name: 'deleted_at')
  final String? deletedAt;

  @JsonKey(name: 'calculated')
  final String? calculated;

  @JsonKey(name: 'location_oblast_uid')
  final int locationOblastUid;

  AlertEntity toEntity() {
    return AlertEntity(
      id: id,
      locationTitle: locationTitle,
      locationType: locationType,
      startedAt: startedAt,
      updatedAt: updatedAt,
      alertType: alertType,
      locationOblast: locationOblast,
      locationUid: locationUid,
      locationOblastUid: locationOblastUid,
      finishedAt: finishedAt,
      notes: notes,
      country: country,
      deletedAt: deletedAt,
      calculated: calculated,
    );
  }

  Map<String, dynamic> toJson() => _$AlertDtoToJson(this);
}
