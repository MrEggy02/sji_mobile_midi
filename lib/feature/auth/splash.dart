import 'package:flutter/material.dart';
import 'package:sji_mobile/core/routes/app_routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Center(
          child: Image(image: const AssetImage('assets/images/splash.png')),
        ),
      ),
    );
  }
}