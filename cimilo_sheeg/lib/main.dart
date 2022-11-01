import 'package:cimilo_sheeg/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String cimilo = "C i m i l o - s h e e g";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: cimilo,
      theme: ThemeData.dark(),
      home: MyHomePage(
        title: cimilo,
      ),
    );
  }
}
