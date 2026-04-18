import 'package:flutter/material.dart';
import 'package:neutria/app/app_routes.dart';
import 'package:neutria/app/app_theme.dart';
import 'package:neutria/app/state_management/theme_provider.dart';
import 'package:neutria/presentations/welcome_screen/views/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

class Neutria extends StatelessWidget {
  const Neutria({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => ThemeProvider())],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
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
