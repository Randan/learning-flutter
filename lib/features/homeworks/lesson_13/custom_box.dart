import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  const CustomBox({
    required this.color,
    required this.onTap,
    required this.textAlignment,
    super.key,
  });

  final Color color;
  final void Function() onTap;
  final Alignment textAlignment;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 300,
          height: 150,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: Align(
            alignment: textAlignment,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                spacing: 10,
                mainAxisAlignment: textAlignment == Alignment.topLeft
                    ? MainAxisAlignment.start
                    : textAlignment == Alignment.center
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                  const Text(
                    'Привіт, Flutter!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
