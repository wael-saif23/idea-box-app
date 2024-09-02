import 'package:flutter/material.dart';

void main() {
  runApp(const IdeaBoxApp());
}

class IdeaBoxApp extends StatelessWidget {
  const IdeaBoxApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
