import 'package:flutter/material.dart';
import 'package:neutria/data/choioce_options/enums/workout_enum.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:neutria/presentations/chooce_options/views/widgets/workout_elevated_btn_widget.dart';
import 'package:provider/provider.dart';

class ChooseWorkoutScreen extends StatelessWidget {
  const ChooseWorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChooseOptionProvider>(
      builder: (context, provider, child) => Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            'How many workouts Do you do per weeks?',
            style: TextStyle(fontWeight: .w600, fontSize: 20),
          ),
          Text(
            'It will be used to calibrate your custom plan.',
            style: TextStyle(fontWeight: .w400, fontSize: 12),
          ),
          SizedBox(height: 160),
          WorkoutElevatedBtnWidget(
            provider: provider,
            workout: WorkoutEnum.light,
          ),
          SizedBox(height: 10),
          WorkoutElevatedBtnWidget(
            provider: provider,
            workout: WorkoutEnum.moderate,
          ),
          SizedBox(height: 10),
          WorkoutElevatedBtnWidget(
            provider: provider,
            workout: WorkoutEnum.heavy,
          ),
          SizedBox(height: 10),
          WorkoutElevatedBtnWidget(
            provider: provider,
            workout: WorkoutEnum.rest,
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
