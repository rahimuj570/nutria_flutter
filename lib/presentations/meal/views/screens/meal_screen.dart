import 'package:flutter/material.dart';
import 'package:neutria/app/app_assets_path.dart';
import 'package:neutria/presentations/common/view/screens/custom_app_bar_widget.dart';
import 'package:neutria/presentations/common/viewmodels/home_navigation_holder_provider.dart';
import 'package:neutria/presentations/meal/views/screens/view_all_meal_screen.dart';
import 'package:neutria/presentations/meal/views/widgets/meal_card_widget.dart';
import 'package:provider/provider.dart';

class MealScreen extends StatelessWidget {
  const MealScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNavigationHolderProvider>(
      builder: (context, provider, child) => Scaffold(
        appBar: CustomAppBarWidget(
          title: 'Meal items',
          leadingType: LeadingTypeEnum.back,
          customLeadingAction: () => provider.popScreen(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Text(
                'Your meals',
                style: TextStyle(fontSize: 16, fontWeight: .w500),
              ),
              SizedBox(height: 16),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height - 190,
                ),
                child: ListView(
                  children: [
                    MealCardWidget(
                      imgPath: AppAssetsPath.breakfast,
                      title: 'Breakfast',
                      subTitle: '1100Kcal',
                      onTapAction: () => Navigator.pushNamed(
                        context,
                        ViewAllMealScreen.name,
                        arguments: 0,
                      ),
                    ),
                    MealCardWidget(
                      imgPath: AppAssetsPath.lunch,
                      title: 'Lunch',
                      subTitle: '1100Kcal',
                      onTapAction: () => Navigator.pushNamed(
                        context,
                        ViewAllMealScreen.name,
                        arguments: 1,
                      ),
                    ),
                    MealCardWidget(
                      imgPath: AppAssetsPath.snacks,
                      title: 'Snacks',
                      subTitle: '1100Kcal',
                      onTapAction: () => Navigator.pushNamed(
                        context,
                        ViewAllMealScreen.name,
                        arguments: 2,
                      ),
                    ),
                    MealCardWidget(
                      imgPath: AppAssetsPath.dinner,
                      title: 'Dinner',
                      subTitle: '1100Kcal',
                      onTapAction: () => Navigator.pushNamed(
                        context,
                        ViewAllMealScreen.name,
                        arguments: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
