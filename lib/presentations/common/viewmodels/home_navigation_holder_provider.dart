import 'package:flutter/material.dart';
import 'package:neutria/app/utils/stack.dart';
import 'package:neutria/presentations/analytics/views/screens/analytrics_screen.dart';
import 'package:neutria/presentations/home/views/screens/home_screen.dart';
import 'package:neutria/presentations/meal/views/screens/meal_screen.dart';
import 'package:neutria/presentations/settings/views/screens/settings_screen.dart';

class HomeNavigationHolderProvider extends ChangeNotifier {
  final List<Widget> _screnList = [
    HomeScreen(),
    AnalytricsScreen(),
    MealScreen(),
    SettingsScreen(),
  ];
  final StackDS _screenStack = StackDS()..push(0);

  int _screenIndex = 0;
  int get getScreenIndex => _screenIndex;

  set changeScreen(int index) {
    _screenIndex = index;
    _screenStack.push(index);
    notifyListeners();
  }

  List<Widget> get getScreenList => _screnList;

  void popScreen() {
    _screenStack.pop();
    _screenIndex = _screenStack.peek;
    if (_screenIndex == 0) {
      _screenStack.clear();
      _screenStack.push(0);
    }
    notifyListeners();
  }
}
