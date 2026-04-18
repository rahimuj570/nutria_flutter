import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:neutria/presentations/chooce_options/views/choose_option_main_holder.dart';
import 'package:neutria/presentations/welcome_screen/views/screens/welcome_screen.dart';

class AppRoutes {
  static Route<dynamic>? appRoutes(RouteSettings settings) {
    Widget widget = Placeholder();

    if (settings.name == WelcomeScreen.name) {
      widget = WelcomeScreen();
    } else if (settings.name == ChooseOptionMainHolder.name) {
      widget = ChooseOptionMainHolder();
    }
    return MaterialPageRoute(builder: (context) => widget);
  }
}
