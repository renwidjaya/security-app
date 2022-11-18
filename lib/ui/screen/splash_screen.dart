import 'package:flutter/material.dart';
import 'package:security_app/ui/screen/login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //delay
    Future.delayed(
      const Duration(milliseconds: 3500),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
        ),
      ),
    );
    //end delay

    return Scaffold(
      body: Center(
        child: Image.asset("assets/img_security.png"),
      ),
    );
  }
}
