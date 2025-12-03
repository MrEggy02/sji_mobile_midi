import 'package:flutter/material.dart';
import 'package:sji_mobile/core/routes/app_routes.dart';
import 'package:sji_mobile/core/styles/theme/theme_service.dart';
import 'package:sji_mobile/feature/home/page/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: ThemeService.isDarkMode,
      builder: (context, isDarkMode, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: "sji_mobile",
          theme: ThemeService.currentTheme,
          home: const HomePage(),
          initialRoute: AppRoutes.splash,
          routes: AppRoutes.routes,
        );
      },
    );
  }
}