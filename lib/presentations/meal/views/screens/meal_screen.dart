import 'package:flutter/material.dart';
import 'package:neutria/presentations/common/view/screens/custom_app_bar_widget.dart';
import 'package:neutria/presentations/common/viewmodels/home_navigation_holder_provider.dart';
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
      ),
    );
  }
}
