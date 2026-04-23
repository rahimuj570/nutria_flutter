import 'package:flutter/material.dart';
import 'package:neutria/data/meal/services/view_all_meal_searvice.dart';

class ViewAllMealProvider extends ChangeNotifier {
  final ViewAllMealSearvice _service = ViewAllMealSearvice();
  String getMealName(int mealId) {
    return _service.getTitle(mealId);
  }
}
