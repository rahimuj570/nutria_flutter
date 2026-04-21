import 'package:flutter/material.dart';
import 'package:neutria/presentations/auth/view/screens/login_screen.dart';
import 'package:neutria/presentations/chooce_options/views/screens/choose_option_main_holder.dart';
import 'package:neutria/presentations/common/view/screens/net_error_screen.dart';
import 'package:neutria/presentations/welcome_screen/views/screens/welcome_screen.dart';

class AppRoutes {
  static Route<dynamic>? appRoutes(RouteSettings settings) {
    Widget widget = Placeholder();

    if (settings.name == WelcomeScreen.name) {
      widget = WelcomeScreen();
    } else if (settings.name == ChooseOptionMainHolder.name) {
      widget = ChooseOptionMainHolder();
    } else if (settings.name == NetErrorScreen.name) {
      widget = NetErrorScreen();
    } else if (settings.name == LoginScreen.name) {
      widget = LoginScreen();
    }
    return MaterialPageRoute(builder: (context) => widget);
  }
}
