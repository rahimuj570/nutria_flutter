import 'package:flutter/material.dart';
import 'package:neutria/data/choioce_options/enums/what_holding_back_enum.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:neutria/presentations/chooce_options/views/widgets/goal_option_card_widget.dart';
import 'package:provider/provider.dart';

class ChooseWhatHoldingScreen extends StatelessWidget {
  const ChooseWhatHoldingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChooseOptionProvider>(
      builder: (context, provider, child) => Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .center,
        children: [
          Text(
            'What’s holding you back from achieving your goal?',
            style: TextStyle(fontWeight: .w600, fontSize: 24),
          ),

          SizedBox(height: 140),
          GoalOptionCardWidget(
            onTapCard: () => provider.chooseWhatHoldingBack(
              WhatHoldingBackEnum.inconsistent,
            ),
            assets: '',
            goalType: WhatHoldingBackEnum.inconsistent,
            title: 'Inconsistent routine',
            isUnselected:
                provider.getWhatHoldingBack != WhatHoldingBackEnum.inconsistent,
            provider: provider,
          ),
          SizedBox(height: 10),
          GoalOptionCardWidget(
            onTapCard: () =>
                provider.chooseWhatHoldingBack(WhatHoldingBackEnum.poorDietry),
            assets: '',
            goalType: WhatHoldingBackEnum.poorDietry,
            title: 'Poor dietary choices',
            isUnselected:
                provider.getWhatHoldingBack != WhatHoldingBackEnum.poorDietry,
            provider: provider,
          ),
          SizedBox(height: 10),
          GoalOptionCardWidget(
            onTapCard: () => provider.chooseWhatHoldingBack(
              WhatHoldingBackEnum.limitedSuppoirt,
            ),
            assets: '',
            goalType: WhatHoldingBackEnum.limitedSuppoirt,
            title: 'Limited support system',
            isUnselected:
                provider.getWhatHoldingBack !=
                WhatHoldingBackEnum.limitedSuppoirt,
            provider: provider,
          ),
          SizedBox(height: 10),
          GoalOptionCardWidget(
            onTapCard: () => provider.chooseWhatHoldingBack(
              WhatHoldingBackEnum.hecticSuppoirt,
            ),
            assets: '',
            goalType: WhatHoldingBackEnum.hecticSuppoirt,
            title: 'Hectic lifestyle',
            isUnselected:
                provider.getWhatHoldingBack !=
                WhatHoldingBackEnum.hecticSuppoirt,
            provider: provider,
          ),
          SizedBox(height: 10),
          GoalOptionCardWidget(
            onTapCard: () =>
                provider.chooseWhatHoldingBack(WhatHoldingBackEnum.mealIdea),
            assets: '',
            goalType: WhatHoldingBackEnum.mealIdea,
            title: 'Lack of meal ideas',
            isUnselected:
                provider.getWhatHoldingBack != WhatHoldingBackEnum.mealIdea,
            provider: provider,
          ),
        ],
      ),
    );
  }
}
