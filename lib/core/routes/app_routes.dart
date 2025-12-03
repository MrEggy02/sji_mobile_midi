// core/routes/app_routes.dart
import 'package:flutter/material.dart';
import 'package:sji_mobile/feature/asset/page/asset.dart';
import 'package:sji_mobile/feature/auth/login/page/login.dart';
import 'package:sji_mobile/feature/auth/splash.dart';
import 'package:sji_mobile/feature/home/page/home.dart';

class AppRoutes {
  // ເສັ້ນທາງສຳລັບແອັບ
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String asset = '/asset';

  // ການກຳນົດເສັ້ນທາງ
  static Map<String, Widget Function(BuildContext)> get routes => {
    splash: (context) => SplashScreen(),
    login: (context) => LoginPage(),
    home: (context) => HomePage(),
    asset: (context) => AssetPage(),
  };
}