import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neutria/presentations/viewes/screens/welcome_screen.dart';

class AppRoutes {
  static Route<dynamic>? appRoutes(RouteSettings settings) {
    Widget widget = Placeholder();

    if (settings.name == WelcomeScreen.name) {
      widget = WelcomeScreen();
    }
    return MaterialPageRoute(builder: (context) => widget);
  }
}
