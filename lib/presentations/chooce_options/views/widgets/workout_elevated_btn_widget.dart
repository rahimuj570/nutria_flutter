import 'package:flutter/material.dart';
import 'package:neutria/data/choioce_options/enums/workout_enum.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';

class WorkoutElevatedBtnWidget extends StatelessWidget {
  final ChooseOptionProvider provider;
  final WorkoutEnum workout;
  const WorkoutElevatedBtnWidget({
    super.key,
    required this.provider,
    required this.workout,
  });

  @override
  Widget build(BuildContext context) {
    String title = switch (workout) {
      WorkoutEnum.light => 'Light',
      WorkoutEnum.moderate => 'Moderate',
      WorkoutEnum.heavy => 'Heavy',
      WorkoutEnum.rest => 'Rest and Recovery',
    };

    String description = switch (workout) {
      WorkoutEnum.light => 'Physical activity level (1.2 to1.3)',
      WorkoutEnum.moderate => 'Physical activity level (1.2 to1.3)',
      WorkoutEnum.heavy => 'Physical activity level (1.2 to1.3)',
      WorkoutEnum.rest => 'Physical activity level (1.00 to 1.01)',
    };
    bool isUnSelected =
        provider.getWorkoutChoose == null ||
        provider.getWorkoutChoose != workout;
    return GestureDetector(
      onTap: () => provider.chooseWorkout(workout),
      child: Container(
        padding: .symmetric(horizontal: 18, vertical: 10),
        width: .infinity,
        decoration: BoxDecoration(
          color: isUnSelected ? Colors.white : Colors.black,
          borderRadius: .circular(8),
        ),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: .w500,
                color: isUnSelected ? Colors.black : Colors.white,
              ),
            ),
            Text(
              description,
              style: TextStyle(
                fontSize: 12,
                fontWeight: .w400,
                color: isUnSelected ? Colors.black : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
