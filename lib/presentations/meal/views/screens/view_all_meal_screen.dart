import 'package:flutter/material.dart';
import 'package:neutria/app/const_colors.dart';
import 'package:neutria/presentations/common/view/screens/custom_app_bar_widget.dart';
import 'package:neutria/presentations/meal/viewmodels/view_all_meal_provider.dart';
import 'package:neutria/presentations/meal/views/widgets/meal_card_widget.dart';
import 'package:provider/provider.dart';

class ViewAllMealScreen extends StatelessWidget {
  static const String name = "view_all_meal_screen";
  final int mealId;
  const ViewAllMealScreen({super.key, required this.mealId});

  @override
  Widget build(BuildContext context) {
    return Consumer<ViewAllMealProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: CustomAppBarWidget(
          title: provider.getMealName(mealId),
          leadingType: LeadingTypeEnum.back,
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Meal items',
                    style: TextStyle(fontSize: 16, fontWeight: .w500),
                  ),
                  Spacer(),
                  Text(
                    'Total:',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: .w400,
                      color: ConstColors.lightGreyTextColor,
                    ),
                  ),
                  SizedBox(width: 4),
                  Text(
                    '1100 kcal',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: .w400,
                      color: ConstColors.lightGreyTextColor.withValues(
                        alpha: .8,
                      ),
                    ),
                  ),
                ],
              ),
              // MealCardWidget(imgPath: imgPath, title: title, subTitle: subTitle)
            ],
          ),
        ),
      ),
    );
  }
}
