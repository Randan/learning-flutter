import 'package:flutter/foundation.dart';

@immutable
class ChequeEntity {
  const ChequeEntity({
    required this.chequeId,
    required this.totalAmount,
    required this.items,
    required this.prediction,
  });

  factory ChequeEntity.fromJson(Map<String, dynamic> json) {
    return ChequeEntity(
      chequeId: json['chequeId'] as int,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      items: List<String>.from(json['items'] as List),
      prediction: json['prediction'] as String,
    );
  }

  final int chequeId;
  final double totalAmount;
  final List<String> items;
  final String prediction;

  Map<String, dynamic> toJson() {
    return {
      'chequeId': chequeId,
      'totalAmount': totalAmount,
      'items': items,
      'prediction': prediction,
    };
  }

  @override
  String toString() {
    return 'ChequeEntity(chequeId: $chequeId, totalAmount: $totalAmount, '
        'items: $items, prediction: $prediction)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ChequeEntity &&
        other.chequeId == chequeId &&
        other.totalAmount == totalAmount &&
        other.items == items &&
        other.prediction == prediction;
  }

  @override
  int get hashCode {
    return chequeId.hashCode ^
        totalAmount.hashCode ^
        items.hashCode ^
        prediction.hashCode;
  }
}
