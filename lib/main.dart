import 'package:flutter/material.dart';
import 'package:learning_flutter/features/homeworks/lesson_13/homework_13_screen.dart';
import 'package:learning_flutter/features/homeworks/lesson_14/homework_14_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
      routes: {
        '/lesson_13': (context) => const Lesson13(),
        '/lesson_14': (context) => const Lesson14(),
      },
    );
  }
}

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
            ElevatedButton(
              child: const Text('Lesson 13'),
              onPressed: () {
                Navigator.pushNamed(context, '/lesson_13');
              },
            ),
            ElevatedButton(
              child: const Text('Lesson 14'),
              onPressed: () {
                Navigator.pushNamed(context, '/lesson_14');
              },
            ),
          ],
        ),
      ),
    );
  }
}
