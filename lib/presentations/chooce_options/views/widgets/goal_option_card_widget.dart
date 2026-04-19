import 'package:flutter/material.dart';
import 'package:neutria/data/choioce_options/enums/goal_enum.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';

class GoalOptionCardWidget extends StatelessWidget {
  final String title;
  final bool isUnselected;
  final String assets;
  final GoalEnum goalType;
  final ChooseOptionProvider provider;
  const GoalOptionCardWidget({
    super.key,
    required this.title,
    required this.isUnselected,
    required this.assets,
    required this.goalType,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        provider.chooseGoal(goalType);
      },
      child: Container(
        padding: .symmetric(horizontal: 18, vertical: 10),
        width: .infinity,
        decoration: BoxDecoration(
          color: isUnselected ? Colors.white : Colors.black,
          // color: Colors.black,
          borderRadius: .circular(8),
        ),
        child: Row(
          crossAxisAlignment: .center,
          children: [
            Image.asset(assets, width: 32),
            SizedBox(width: 16),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: .w500,
                color: isUnselected ? Colors.black : Colors.white,
                // color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
