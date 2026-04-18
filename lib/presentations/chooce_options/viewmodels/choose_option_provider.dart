import 'package:flutter/material.dart';
import 'package:neutria/app/app.dart';
import 'package:neutria/data/choioce_options/entity/choose_entity.dart';
import 'package:neutria/data/choioce_options/enums/gender_enum.dart';
import 'package:neutria/data/choioce_options/enums/workout_enum.dart';
import 'package:neutria/presentations/chooce_options/views/screens/choose_country_screen.dart';
import 'package:neutria/presentations/chooce_options/views/screens/choose_gender.dart';
import 'package:neutria/presentations/chooce_options/views/screens/choose_workout_screen.dart';
import 'package:neutria/presentations/welcome_screen/views/screens/welcome_screen.dart';

class ChooseOptionProvider extends ChangeNotifier {
  final List<Widget> options = [
    ChooseGender(),
    ChooseWorkoutScreen(),
    ChooseCountryScreen(),
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
}
