import 'package:flutter/material.dart';
import 'package:neutria/app/app_routes.dart';
import 'package:neutria/app/app_theme.dart';
import 'package:neutria/app/state_management/theme_provider.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:neutria/presentations/common/viewmodels/home_navigation_holder_provider.dart';
import 'package:neutria/presentations/meal/viewmodels/view_all_meal_provider.dart';
import 'package:neutria/presentations/welcome_screen/views/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

class Neutria extends StatelessWidget {
  static GlobalKey<NavigatorState> navKey = GlobalKey();
  const Neutria({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => ChooseOptionProvider()),
        ChangeNotifierProvider(create: (context) => ViewAllMealProvider()),
        ChangeNotifierProvider(
          create: (context) => HomeNavigationHolderProvider(),
        ),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
            navigatorKey: navKey,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.getCurrentTheme,
            initialRoute: WelcomeScreen.name,
            onGenerateRoute: AppRoutes.appRoutes,
          );
        },
      ),
    );
  }
}
