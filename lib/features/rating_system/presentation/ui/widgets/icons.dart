import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class RatingStarIcon extends StatelessWidget {
  const RatingStarIcon({super.key, this.isSelected = false});

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: isSelected
          ? BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0x4AFF8200),
                  blurRadius: 10,
                  spreadRadius: -10,
                ),
              ],
            )
          : null,
      child: SvgPicture.asset(
        'assets/images/rating-star.svg',
        colorFilter: ColorFilter.mode(
          isSelected ? Color(0xFFFF8200) : Color(0xFFE0E0E0),
          BlendMode.srcIn,
        ),
        width: 52,
        height: 52,
        semanticsLabel: 'Rating Star',
      ),
    );
  }
}

class LikeIcon extends StatelessWidget {
  const LikeIcon({super.key, this.strokeColor, this.fillColor});

  final Color? strokeColor;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    'assets/images/like.svg',
    colorFilter: ColorFilter.mode(
      strokeColor ?? Color(0xB8202124),
      BlendMode.srcIn,
    ),
    width: 20,
    height: 19,
    semanticsLabel: 'Like',
  );
}

class DislikeIcon extends StatelessWidget {
  const DislikeIcon({super.key, this.strokeColor, this.fillColor});

  final Color? strokeColor;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) => SvgPicture.asset(
    'assets/images/dislike.svg',
    colorFilter: ColorFilter.mode(
      strokeColor ?? Color(0xB8202124),
      BlendMode.srcIn,
    ),
    width: 20,
    height: 19,
    semanticsLabel: 'Dislike',
  );
}
