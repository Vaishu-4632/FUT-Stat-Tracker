import 'package:flutter/material.dart';
import 'package:stat_tracker/utils/background.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
           height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              hexStringToColor("#2C5364"),
              hexStringToColor("#203A43"),
              hexStringToColor("#0F2027")
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Container(
              child: Image.asset('assets/images/images/Logo.png', alignment: Alignment.center),
            )
          ],
        ),
        ),
      ),
    );
  }
}