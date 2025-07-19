import 'package:flutter/material.dart';
import 'package:learning_flutter/features/homeworks/lesson_13/custom_box.dart';

class Lesson13 extends StatefulWidget {
  const Lesson13({super.key});

  @override
  State<Lesson13> createState() => _Lesson13State();
}

class _Lesson13State extends State<Lesson13> {
  int? _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = _selectedIndex == index ? null : index;
    });
  }

  final colors = [Colors.blue, Colors.green, Colors.red];
  final alignments = [
    Alignment.topLeft,
    Alignment.center,
    Alignment.bottomRight,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lesson 13')),
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(
            colors.length,
            (index) => index == _selectedIndex
                ? Expanded(
                    child: CustomBox(
                      color: colors[index],
                      onTap: () => _onTap(index),
                      textAlignment: alignments[index],
                    ),
                  )
                : CustomBox(
                    color: colors[index],
                    onTap: () => _onTap(index),
                    textAlignment: alignments[index],
                  ),
          ),
        ),
      ),
    );
  }
}
