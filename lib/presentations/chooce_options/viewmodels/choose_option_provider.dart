import 'package:flutter/material.dart';
import 'package:neutria/app/app.dart';
import 'package:neutria/data/choioce_options/enums/gender_enum.dart';
import 'package:neutria/data/choioce_options/enums/height_enums.dart';
import 'package:neutria/data/choioce_options/enums/previous_exp_enum.dart';
import 'package:neutria/data/choioce_options/enums/weight_enum.dart';
import 'package:neutria/data/choioce_options/enums/workout_enum.dart';
import 'package:neutria/presentations/chooce_options/views/screens/choose_country_screen.dart';
import 'package:neutria/presentations/chooce_options/views/screens/choose_gender.dart';
import 'package:neutria/presentations/chooce_options/views/screens/choose_height_screen.dart';
import 'package:neutria/presentations/chooce_options/views/screens/choose_weight_screen.dart';
import 'package:neutria/presentations/chooce_options/views/screens/choose_workout_screen.dart';
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

  // Range in feet (approx 4.6 ft to 7.2 ft)
  List<double> get heightRangeFeet => heightRangeCm
      .map((cm) => cm / 30.48) // convert cm to feet
      .toList();

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

  /////CHOOSE WIRGHT OPERATION
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
}
