import 'package:flutter/material.dart';
import 'package:tire_management/ui/screens/login/login_screen.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return _materialRoute(LoginScreen());
      default:
        // If there is no such named route in the switch statement, e.g. /third
        return _materialRoute(
          const Scaffold(
            body: SafeArea(
              child: Center(
                child: Text('Route Error'),
              ),
            ),
          ),
        );
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
