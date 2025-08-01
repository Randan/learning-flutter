import 'package:learning_flutter/features/homeworks/lesson_14/rating_card.dart';

class Department {
  Department({
    required this.name,
    this.service,
    this.assortment,
    this.feedback = '',
  });

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      name: json['name'] as String,
      service: json['service'] != null
          ? LikeRate.values.firstWhere((e) => e.name == json['service'])
          : null,
      assortment: json['assortment'] != null
          ? LikeRate.values.firstWhere((e) => e.name == json['assortment'])
          : null,
      feedback: json['feedback'] as String? ?? '',
    );
  }
  final String name;
  LikeRate? service;
  LikeRate? assortment;
  String feedback;

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'service': service?.name,
      'assortment': assortment?.name,
      'feedback': feedback,
    };
  }
}

class RatingState {
  RatingState({
    required this.departments,
    this.rating = 0,
    this.globalFeedback = '',
  });

  factory RatingState.fromJson(Map<String, dynamic> json) {
    return RatingState(
      rating: json['rating'] as int? ?? 0,
      globalFeedback: json['globalFeedback'] as String? ?? '',
      departments: (json['departments'] as List<dynamic>)
          .map((dept) => Department.fromJson(dept as Map<String, dynamic>))
          .toList(),
    );
  }
  int rating;
  String globalFeedback;
  List<Department> departments;

  Map<String, dynamic> toJson() {
    return {
      'rating': rating,
      'globalFeedback': globalFeedback,
      'departments': departments.map((dept) => dept.toJson()).toList(),
    };
  }

  RatingState copyWith({
    int? rating,
    String? globalFeedback,
    List<Department>? departments,
  }) {
    return RatingState(
      rating: rating ?? this.rating,
      globalFeedback: globalFeedback ?? this.globalFeedback,
      departments: departments ?? this.departments,
    );
  }
}
