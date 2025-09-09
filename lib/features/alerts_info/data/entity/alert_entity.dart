import 'package:flutter/foundation.dart';

@immutable
class AlertEntity {
  const AlertEntity({
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

  final int id;
  final String locationTitle;
  final String locationType;
  final String startedAt;
  final String? finishedAt;
  final String updatedAt;
  final String alertType;
  final String locationOblast;
  final String locationUid;
  final String? notes;
  final String? country;
  final String? deletedAt;
  final String? calculated;
  final int locationOblastUid;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is AlertEntity && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'AlertEntity(id: $id, locationTitle: $locationTitle, '
        'alertType: $alertType)';
  }
}
