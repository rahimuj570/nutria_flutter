import 'package:flutter/material.dart';
import 'package:neutria/app/app.dart';
import 'package:neutria/data/choioce_options/entity/meal_timing_entity.dart';
import 'package:neutria/data/choioce_options/enums/gender_enum.dart';
import 'package:neutria/data/choioce_options/enums/goal_enum.dart';
import 'package:neutria/data/choioce_options/enums/height_enums.dart';
import 'package:neutria/data/choioce_options/enums/previous_exp_enum.dart';
import 'package:neutria/data/choioce_options/enums/weight_enum.dart';
import 'package:neutria/data/choioce_options/enums/workout_enum.dart';
import 'package:neutria/presentations/chooce_options/views/screens/choose_country_screen.dart';
import 'package:neutria/presentations/chooce_options/views/screens/choose_dob_screen.dart';
import 'package:neutria/presentations/chooce_options/views/screens/choose_gender.dart';
import 'package:neutria/presentations/chooce_options/views/screens/choose_goal_screen.dart';
import 'package:neutria/presentations/chooce_options/views/screens/choose_height_screen.dart';
import 'package:neutria/presentations/chooce_options/views/screens/choose_meal_timing_screen.dart';
import 'package:neutria/presentations/chooce_options/views/screens/choose_weight_screen.dart';
import 'package:neutria/presentations/chooce_options/views/screens/choose_workout_screen.dart';
import 'package:neutria/presentations/chooce_options/views/screens/desired_weight_sceen.dart';
import 'package:neutria/presentations/chooce_options/views/screens/line_chart_screen.dart';
import 'package:neutria/presentations/chooce_options/views/screens/previous_exp_screen.dart';
import 'package:neutria/presentations/welcome_screen/views/screens/welcome_screen.dart';

class ChooseOptionProvider extends ChangeNotifier {
  final List<Widget> options = [
    ChooseGender(),
    ChooseWorkoutScreen(),
    ChooseCountryScreen(),
    PreviousExpScreen(),
    ChooseHeightScreen(),
    ChooseWeightScreen(),
    ChooseDobScreen(),
    ChooseGoadScreen(),
    LineChartScreen(),
    DesiredWeightSceen(),
    ChooseMealTimingScreen(),
  ];
  final _totalScreen = 15;

  bool _isNextBtnDisabled = true;
  int _index = 0;

  bool get getIsNextBtnDisabled => _isNextBtnDisabled;
  int get getIndex => _index;
  Widget get getScreen => options[_index];
  double get getCurrentProgress => (_index + 1) / _totalScreen;

  void onClickNext() {
    _isNextBtnDisabled = _isEmptyValue(_index + 1);
    if (_index != 14) {
      _index++;
      notifyListeners();
    }
  }

  void onClickBack() {
    _isNextBtnDisabled = _isEmptyValue(_index - 1);
    if (_index != 0) {
      _index--;
    } else {
      _allValueReset();
      Neutria.navKey.currentState!.pushNamedAndRemoveUntil(
        WelcomeScreen.name,
        (_) => false,
      );
    }
    notifyListeners();
  }

  void _onValueChange() {
    _isNextBtnDisabled = false;
    notifyListeners();
  }

  void _allValueReset() {
    _genderChoose = null;
    _workoutChoose = null;
    _country = null;
    _prevExp = null;
    _chooseHeightIndex = null;
    _weight = null;
    selectedDay = null;
    selectedMonth = null;
    selectedYear = null;
    _goal = null;
    _desiredWeightIndex = null;
    _mealTimings.clear();
    _isNextBtnDisabled = true;
    notifyListeners();
  }

  ///CHECK EMPTY VALUE OF A SPECIFIC OPTION
  bool _isEmptyValue(int index) {
    if (index == 0) {
      return _genderChoose == null;
    } else if (index == 1) {
      return _workoutChoose == null;
    } else if (index == 2) {
      return _country == null || _country!.isEmpty;
    } else if (index == 3) {
      return _prevExp == null;
    } else if (index == 4) {
      return _chooseHeightIndex == null;
    } else if (index == 5) {
      return _weight == null;
    } else if (index == 6) {
      return selectedDay == null ||
          selectedYear == null ||
          selectedMonth == null;
    } else if (index == 7) {
      return _goal == null;
    } else if (index == 9) {
      return _desiredWeightIndex == null;
    } else if (index == 10) {
      return _mealTimings.isEmpty;
    } else {
      ///need to be chnage later
      return false;
    }
  }

  ////GENDER OPERATIONS
  GenderEnum? _genderChoose;
  GenderEnum? get getGenderChoose => _genderChoose;
  void chooseGender(GenderEnum gender) {
    _genderChoose = gender;
    _onValueChange();
  }

  ////WORKOUT OPERATIONS
  WorkoutEnum? _workoutChoose;
  WorkoutEnum? get getWorkoutChoose => _workoutChoose;
  void chooseWorkout(WorkoutEnum workout) {
    _workoutChoose = workout;
    _onValueChange();
  }

  ////COUNTRY SEARCH OPERATION
  String? _country;
  String? get getCountry => _country;
  void chooseCountry(String country) {
    if (country.isEmpty) {
      _isNextBtnDisabled = true;
      notifyListeners();
    }
    _country = country;

    if (country.isNotEmpty) {
      _onValueChange();
    }
  }

  ////PREVIOUS EXPERIENCE OPERATION
  PreviousExpEnum? _prevExp;
  PreviousExpEnum? get getPrevExp => _prevExp;
  void choosePrevoiusExp(PreviousExpEnum prevExp) {
    _prevExp = prevExp;
    _onValueChange();
  }

  ////CHOSE HEIGHT OPERATION
  // Range in centimeters (140 cm to 220 cm)
  final List<double> heightRangeCm = List<double>.generate(
    (220 - 140) + 1, // count
    (i) => 140.0 + i, // start at 140 cm
  );

  // cm array stepping by 0.1 cm
  // final List<double> heightRangeCm = List<double>.generate(
  //   (((220.0 - 140.0) / 0.1).round()) + 1, // number of steps
  //   (i) => double.parse((140.0 + (i * 0.1)).toStringAsFixed(1)),
  // );

  // Range in feet (approx 4.6 ft to 7.2 ft)
  List<double> get heightRangeFeet => heightRangeCm
      .map((cm) => cm / 30.48) // convert cm to feet
      .toList();

  // List<double> get heightRangeFeet => heightRangeCm
  //     .map((cm) => double.parse((cm / 30.48).toStringAsFixed(4)))
  //     .toList();

  ///
  HeightEnums _unit = HeightEnums.cm;
  HeightEnums get getHeightUnit => _unit;
  void changeHeightUnit(HeightEnums unit) {
    _unit = unit;
    notifyListeners();
  }

  int? _chooseHeightIndex;
  int? get getChooseHeight => _chooseHeightIndex;
  void chooseChooseHeightIndex(int height) {
    _chooseHeightIndex = height;
    _onValueChange();
  }

  /////CHOOSE WEIGHT OPERATION
  ///

  WeightEnum _weightUnit = WeightEnum.kg;
  WeightEnum get getWeightEnum => _weightUnit;
  void chooseWeightUnit(WeightEnum unit) {
    _weightUnit = unit;
    notifyListeners();
  }

  double? _weight;
  double? get getWeight => _weight;
  void chooseWeight(double weight) {
    if (weight == 0) {
      _isNextBtnDisabled = true;
      notifyListeners();
    }
    _weight = weight;
    if (weight != 0) {
      _onValueChange();
    }
  }

  ////CHOOSE DOB OPERATION
  int? selectedMonth;
  int? selectedDay;
  int? selectedYear;

  final List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];

  final List<int> years = List<int>.generate(
    DateTime.now().year - 1971,
    (i) => 1972 + i,
  );

  int getDaysInMonth(int year, int month) {
    if (month == DateTime.now().month) {
      return DateTime.now().day - 1;
    }
    if (month == 2) {
      // Leap year check
      if ((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)) {
        return 29;
      } else {
        return 28;
      }
    }
    if ([4, 6, 9, 11].contains(month)) return 30;
    return 31;
  }

  void changeMonth(int index) {
    selectedMonth = index;
    _isNextBtnDisabled =
        selectedDay == null || selectedYear == null || selectedMonth == null;
    notifyListeners();
  }

  void changeDate(int index) {
    selectedDay = index;
    _isNextBtnDisabled =
        selectedDay == null || selectedYear == null || selectedMonth == null;
    notifyListeners();
  }

  void changeYear(int year) {
    selectedYear = year;
    _isNextBtnDisabled =
        selectedDay == null || selectedYear == null || selectedMonth == null;
    notifyListeners();
  }

  ////CHOOSE GOAL OPERATION
  GoalEnum? _goal;
  GoalEnum? get getGoal => _goal;

  void chooseGoal(GoalEnum goal) {
    _goal = goal;
    _onValueChange();
  }

  ////DESIRED WEIGHT SCREEN
  int? _desiredWeightIndex;
  int? get getDesiredWeightIndex => _desiredWeightIndex;

  WeightEnum _desiredWeightType = WeightEnum.kg;
  WeightEnum get getDesiredWeightType => _desiredWeightType;
  void chooseDesiredWeightEnum(WeightEnum weight) {
    _desiredWeightType = weight;
    notifyListeners();
  }

  void chooseDesiredWeightIndex(int index) {
    _desiredWeightIndex = index;
    _onValueChange();
  }

  void chooseDesiredWeightIndexByText(String w) {
    if (w.isNotEmpty) {
      int ind = _desiredWeightType == WeightEnum.kg
          ? desiredWeightRangeKg.indexOf(int.parse(w.split('.')[0]))
          : desiredWeightRangePound.indexOf(int.parse(w.split('.')[0]));
      if (ind != -1) {
        _desiredWeightIndex = ind;
        _onValueChange();
      } else {
        _isNextBtnDisabled = true;
        notifyListeners();
      }
    } else {
      _isNextBtnDisabled = true;
      notifyListeners();
    }
  }

  final List<int> desiredWeightRangeKg = List<int>.generate(
    (75 - 45) + 1, // count
    (i) => 45 + i,
  );

  // Pounds range (converted from 45–75 kg)
  final List<int> desiredWeightRangePound = List<int>.generate(
    (165 - 99) + 1, // count
    (i) => 99 + i,
  );

  ////// MEAL TIMING OPERATION
  ///
  final List<MealTimingEntity> _mealTimings = [];
  List<MealTimingEntity> get getMealTiming => _mealTimings;

  void addMealTiming(MealTimingEntity time) {
    _mealTimings.add(time);
    _onValueChange();
  }
}
