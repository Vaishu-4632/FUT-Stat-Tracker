import 'package:flutter/material.dart';
import 'package:stat_tracker/splash_screen/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
    home: IntroScreen(),
      );
    
    
  }
}

