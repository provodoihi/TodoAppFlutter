import 'dart:async';

import 'package:flutter/material.dart';
import 'onboarding.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  void _navigate() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OnboardingPage(),
      ),
    );
  }

  @override
  void didChangeDependencies() {
    Timer(const Duration(seconds: 3), _navigate);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Vector.png',
              width: 95,
              height: 80,
              fit: BoxFit.cover,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 32),
              child: Text(
                'UpTodo',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
