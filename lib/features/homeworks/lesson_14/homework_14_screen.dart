import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learning_flutter/features/homeworks/lesson_14/icons.dart';
import 'package:learning_flutter/features/homeworks/lesson_14/models.dart';
import 'package:learning_flutter/features/homeworks/lesson_14/rating_card.dart';

class Lesson14 extends StatefulWidget {
  const Lesson14({super.key});

  @override
  State<Lesson14> createState() => _Lesson14State();
}

class _Lesson14State extends State<Lesson14> {
  late RatingState _ratingState;

  @override
  void initState() {
    super.initState();
    _ratingState = RatingState(
      departments: [
        Department(name: 'Овочі, фрукти'),
        Department(name: 'Випічка'),
        Department(name: 'Лавка традицій'),
      ],
    );
  }

  void _updateDepartmentService(int index, LikeRate? service) {
    setState(() {
      final updatedDepartments = List<Department>.from(
        _ratingState.departments,
      );
      updatedDepartments[index] = updatedDepartments[index].copyWith(
        service: service,
      );
      _ratingState = _ratingState.copyWith(departments: updatedDepartments);
    });
  }

  void _updateDepartmentAssortment(int index, LikeRate? assortment) {
    setState(() {
      final updatedDepartments = List<Department>.from(
        _ratingState.departments,
      );
      updatedDepartments[index] = updatedDepartments[index].copyWith(
        assortment: assortment,
      );
      _ratingState = _ratingState.copyWith(departments: updatedDepartments);
    });
  }

  void _updateDepartmentFeedback(int index, String feedback) {
    setState(() {
      final updatedDepartments = List<Department>.from(
        _ratingState.departments,
      );
      updatedDepartments[index] = updatedDepartments[index].copyWith(
        feedback: feedback,
      );
      _ratingState = _ratingState.copyWith(departments: updatedDepartments);
    });
  }

  void _updateGlobalFeedback(String feedback) {
    setState(() {
      _ratingState = _ratingState.copyWith(globalFeedback: feedback);
    });
  }

  void _updateRating(int rating) {
    setState(() {
      _ratingState = _ratingState.copyWith(rating: rating);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Оцінка візиту до магазину',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Color.fromARGB(50, 255, 255, 255),
        elevation: 0,
        shadowColor: Colors.transparent,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(color: const Color(0xFFEEF2FC)),
              child: SingleChildScrollView(
                child: Column(
                  spacing: 8,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(24),
                          bottomRight: Radius.circular(24),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(100, 0, 0, 0),
                            blurRadius: 3,
                            offset: Offset(0, 3),
                            spreadRadius: -2,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 8,
                        children: List.generate(
                          5,
                          (index) => GestureDetector(
                            onTap: () => _updateRating(index + 1),
                            child: RatingStarIcon(
                              isSelected: index < _ratingState.rating,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                        bottom: 12,
                      ),
                      child: Text(
                        'Яку оціночку поставите відділам?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ...List.generate(
                      _ratingState.departments.length,
                      (index) => Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: RatingCard(
                          title: _ratingState.departments[index].name,
                          department: _ratingState.departments[index],
                          onServiceChanged: (service) =>
                              _updateDepartmentService(index, service),
                          onAssortmentChanged: (assortment) =>
                              _updateDepartmentAssortment(index, assortment),
                          onFeedbackChanged: (feedback) =>
                              _updateDepartmentFeedback(index, feedback),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                        bottom: 12,
                      ),
                      child: Text(
                        'Є що додати?',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 12, right: 12, bottom: 16),
                      child: TextField(
                        onChanged: _updateGlobalFeedback,
                        decoration: InputDecoration(
                          hintText: 'Розкажіть докладніше',
                          hintStyle: TextStyle(
                            fontSize: 16,
                            color: Color(0x8A202124),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                            borderSide: BorderSide(
                              color: Color(0x3D202124),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: 36,
          ),
          child: ElevatedButton(
            onPressed: () {
              debugPrint('Rating State: ${_ratingState.toJson()}');

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Дані успішно відправлено!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF1135BA),
              foregroundColor: Colors.white,
              minimumSize: const Size(double.infinity, 48),
              shadowColor: Colors.transparent,
            ),
            child: const Text(
              'Надіслати',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
