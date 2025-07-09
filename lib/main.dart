import 'package:flutter/material.dart';
import 'package:bookly_app/Features/splash/presentation/splash_view.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashView(),
    );
  }
}