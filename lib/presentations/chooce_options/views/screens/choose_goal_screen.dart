import 'package:flutter/material.dart';
import 'package:neutria/app/app_assets_path.dart';
import 'package:neutria/data/choioce_options/enums/goal_enum.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:neutria/presentations/chooce_options/views/widgets/goal_option_card_widget.dart';
import 'package:provider/provider.dart';

class ChooseGoadScreen extends StatelessWidget {
  const ChooseGoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChooseOptionProvider>(
      builder: (context, provider, child) => Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .center,
        children: [
          Text(
            'Choose your Goal?',
            style: TextStyle(fontWeight: .w600, fontSize: 24),
          ),

          SizedBox(height: 160),
          GoalOptionCardWidget(
            assets: AppAssetsPath.goal1,
            goalType: GoalEnum.gain,
            title: 'Gain Weight',
            isUnselected: provider.getGoal != GoalEnum.gain,
            provider: provider,
          ),
          SizedBox(height: 10),
          GoalOptionCardWidget(
            assets: AppAssetsPath.goal2,
            goalType: GoalEnum.loss,
            title: 'Loss weight',
            isUnselected: provider.getGoal != GoalEnum.loss,
            provider: provider,
          ),
          SizedBox(height: 10),
          GoalOptionCardWidget(
            assets: AppAssetsPath.goal3,
            goalType: GoalEnum.maintain,
            title: 'Maintain weight',
            isUnselected: provider.getGoal != GoalEnum.maintain,
            provider: provider,
          ),
          SizedBox(height: 10),
          GoalOptionCardWidget(
            assets: AppAssetsPath.goal4,
            goalType: GoalEnum.gain,
            title: 'Just exploring',
            isUnselected: provider.getGoal != GoalEnum.explore,
            provider: provider,
          ),
        ],
      ),
    );
  }
}
