import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeworkLesson22 extends StatefulWidget {
  const HomeworkLesson22({super.key});

  @override
  State<HomeworkLesson22> createState() => _HomeworkLesson22State();
}

class _HomeworkLesson22State extends State<HomeworkLesson22>
    with TickerProviderStateMixin {
  late AnimationController _positionController;
  late AnimationController _rotationController;
  late Animation<double> _positionAnimation;
  late Animation<double> _rotationAnimation;

  bool get _isAnimating => _positionController.isAnimating;

  @override
  void initState() {
    super.initState();

    _positionController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    _rotationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );

    _positionAnimation = Tween<double>(begin: 1.0, end: -1.0).animate(
      CurvedAnimation(parent: _positionController, curve: Curves.easeOut),
    );

    _rotationAnimation = Tween<double>(begin: 0.0, end: 3.0).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _positionController.dispose();
    _rotationController.dispose();
    super.dispose();
  }

  void _startBallAnimation() {
    if (_isAnimating) return;

    _positionController.reset();
    _rotationController
      ..reset()
      ..forward();

    _positionController.animateTo(
      1.0,
      duration: Duration(milliseconds: 600),
      curve: Curves.easeOut,
    );

    Future.delayed(Duration(milliseconds: 700), () {
      if (mounted) {
        _positionController.animateTo(
          0.0,
          duration: Duration(milliseconds: 800),
          curve: Curves.bounceOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animated Ball',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF1097F6),
        elevation: 0,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedBuilder(
              animation: Listenable.merge([
                _positionController,
                _rotationController,
              ]),
              builder: (context, child) {
                return Container(
                  alignment: Alignment(0.0, _positionAnimation.value),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color(0xFF8dcdfe), Color(0xFF8fcdfc)],
                    ),
                  ),
                  child: Transform.rotate(
                    angle: _rotationAnimation.value * pi,
                    child: GestureDetector(
                      onTap: _isAnimating ? null : _startBallAnimation,
                      child: SvgPicture.asset(
                        'assets/images/soccer_ball.svg',
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            height: 150,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFFa3d7aa), Color(0xFF0d5b11)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
