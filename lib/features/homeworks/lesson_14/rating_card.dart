// ignore_for_file: inference_failure_on_function_return_type

import 'package:flutter/material.dart';
import 'package:learning_flutter/features/homeworks/lesson_14/icons.dart';
import 'package:learning_flutter/features/homeworks/lesson_14/models.dart';

enum LikeRate { like, dislike }

class RatingCard extends StatelessWidget {
  const RatingCard({
    required this.title,
    required this.department,
    required this.onServiceChanged,
    required this.onAssortmentChanged,
    required this.onFeedbackChanged,
    super.key,
  });

  final String title;
  final Department department;
  final Function(LikeRate?) onServiceChanged;
  final Function(LikeRate?) onAssortmentChanged;
  final Function(String) onFeedbackChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 32, bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(100, 0, 0, 0),
            blurRadius: 3,
            offset: Offset(0, 3),
            spreadRadius: -2,
          ),
        ],
      ),
      child: Column(
        spacing: 8,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(12),
            child: Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              // textAlign: TextAlign.left,
            ),
          ),
          _RatingItem(
            title: 'Обслуговування',
            feedback: department.service,
            onChanged: onServiceChanged,
          ),
          _RatingItem(
            title: 'Асортимент',
            feedback: department.assortment,
            onChanged: onAssortmentChanged,
          ),
          department.service != null || department.assortment != null
              ? TextField(
                  onChanged: onFeedbackChanged,
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
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}

class _RatingItem extends StatelessWidget {
  const _RatingItem({
    required this.title,
    required this.onChanged,
    this.feedback,
  });

  final String title;
  final LikeRate? feedback;
  final Function(LikeRate?) onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
      decoration: BoxDecoration(
        color: Color(0xFFF6F8FD),
        border: Border.all(color: Color.fromARGB(9, 19, 19, 30), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 12,
        children: [
          Text(title, style: TextStyle(fontSize: 16)),
          Row(
            spacing: 12,
            children: [
              _RatingButton(
                isSelected: feedback == LikeRate.dislike,
                buttonType: LikeRate.dislike,
                onPressed: () => onChanged(
                  feedback == LikeRate.dislike ? null : LikeRate.dislike,
                ),
              ),
              _RatingButton(
                isSelected: feedback == LikeRate.like,
                buttonType: LikeRate.like,
                onPressed: () =>
                    onChanged(feedback == LikeRate.like ? null : LikeRate.like),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _RatingButton extends StatelessWidget {
  _RatingButton({
    required this.buttonType,
    required this.onPressed,
    this.isSelected = false,
  }) : _strokeColor = isSelected ? Colors.white : Color(0xB8202124),
       _fillColor = isSelected ? Colors.white : null;

  final bool isSelected;
  final LikeRate buttonType;
  final VoidCallback onPressed;

  final Color? _strokeColor;
  final Color? _fillColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      // elevation: !isSelected ? 1 : 0,
      borderRadius: BorderRadius.circular(100),
      child: IconButton(
        onPressed: onPressed,
        style: IconButton.styleFrom(
          backgroundColor: isSelected ? Color(0xFF2358D1) : Color(0x0A13131E),
          shadowColor: !isSelected ? null : Color(0xFF000000),
          elevation: isSelected ? 0 : 1,
        ),
        icon: buttonType == LikeRate.like
            ? LikeIcon(strokeColor: _strokeColor)
            : DislikeIcon(strokeColor: _fillColor),
      ),
    );
  }
}
