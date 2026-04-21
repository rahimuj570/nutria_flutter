import 'package:flutter/material.dart';
import 'package:neutria/app/app_assets_path.dart';
import 'package:neutria/data/choioce_options/enums/diet_enum.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:neutria/presentations/chooce_options/views/widgets/goal_option_card_widget.dart';
import 'package:provider/provider.dart';

class ChooseDietScreen extends StatelessWidget {
  const ChooseDietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChooseOptionProvider>(
      builder: (context, provider, child) => Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .center,
        children: [
          Text(
            'What is the type of your diet?',
            style: TextStyle(fontWeight: .w600, fontSize: 24),
          ),

          SizedBox(height: 140),
          GoalOptionCardWidget(
            onTapCard: () => provider.chooseDiet(DietEnum.balanced),
            assets: AppAssetsPath.balance,
            goalType: DietEnum.balanced,
            title: 'Balanced',
            isUnselected: provider.getDietType != DietEnum.balanced,
            provider: provider,
          ),
          SizedBox(height: 10),
          GoalOptionCardWidget(
            onTapCard: () => provider.chooseDiet(DietEnum.pescatarian),
            assets: AppAssetsPath.pescatarian,
            goalType: DietEnum.pescatarian,
            title: 'Pescatarian',
            isUnselected: provider.getDietType != DietEnum.pescatarian,
            provider: provider,
          ),
          SizedBox(height: 10),
          GoalOptionCardWidget(
            onTapCard: () => provider.chooseDiet(DietEnum.vegetarian),
            assets: AppAssetsPath.vegetarian,
            goalType: DietEnum.vegetarian,
            title: 'Vegetarian',
            isUnselected: provider.getDietType != DietEnum.vegetarian,
            provider: provider,
          ),
          SizedBox(height: 10),
          GoalOptionCardWidget(
            onTapCard: () => provider.chooseDiet(DietEnum.vegan),
            assets: AppAssetsPath.vegan,
            goalType: DietEnum.vegan,
            title: 'Vegan',
            isUnselected: provider.getDietType != DietEnum.vegan,
            provider: provider,
          ),
          SizedBox(height: 10),
          GoalOptionCardWidget(
            onTapCard: () => provider.chooseDiet(DietEnum.flexible),
            assets: AppAssetsPath.flexible,
            goalType: DietEnum.flexible,
            title: 'Flexible Eating',
            isUnselected: provider.getDietType != DietEnum.flexible,
            provider: provider,
          ),
        ],
      ),
    );
  }
}
