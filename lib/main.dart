import 'package:flutter/material.dart';
import 'package:stream_demo/gender_hobby_app_stream/gender_hobby_ui.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GenderHobbyDemoUi(),
    );
  }
}
