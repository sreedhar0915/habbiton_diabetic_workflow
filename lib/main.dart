import 'package:flutter/material.dart';
import 'package:habbiton_diabetic_workflow/screens/diabetic_workflow_screens/Start_screen/Start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartScreen(),
    );
  }
}
