import 'package:flutter/material.dart';
import 'package:google_maps/constants/strings.dart';
import 'package:google_maps/presentation/screens/login_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginScreen:
        return MaterialPageRoute(
          builder: (context) =>  LoginScreen(),
          settings: settings,
        );
    }
  }
}
