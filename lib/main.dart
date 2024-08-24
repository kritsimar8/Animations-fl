import 'package:flutter/material.dart';
import 'package:nike/animation/animation2.dart';
import 'package:nike/animation/animation_1.dart';
import 'package:nike/shoe_home.dart';
import 'package:nike/shoe_main.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const Animation2(),
    );
  }
}

