import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: const Text('robot-dreams-code homeworks'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('.....'),
            Text('...Dart homeworks in another project...'),
            ElevatedButton(
              child: const Text('Lesson 13: Widgets pt.1'),
              onPressed: () {
                context.go('/lesson_13');
              },
            ),
            ElevatedButton(
              child: const Text('Lesson 14: Widgets pt.2'),
              onPressed: () {
                context.go('/lesson_14');
              },
            ),
            Text('Lesson 15: Widgets composition (w/o h/w)'),
            Text('Lesson 16: Navigation Basics (w/o h/w)'),
            Text('Lesson 17: Popular packages of Nav (w/o visible h/w)'),
          ],
        ),
      ),
    );
  }
}
