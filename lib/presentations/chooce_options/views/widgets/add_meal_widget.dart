import 'package:flutter/material.dart';
import 'package:neutria/data/choioce_options/entity/meal_timing_entity.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:provider/provider.dart';

class AddMealWidget extends StatelessWidget {
  const AddMealWidget({super.key, required this.mealNameTEC});

  final TextEditingController mealNameTEC;

  @override
  Widget build(BuildContext context) {
    return Consumer<ChooseOptionProvider>(
      builder: (context, provider, child) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: .circular(8)),
        backgroundColor: Colors.white,
        content: Column(
          crossAxisAlignment: .start,
          mainAxisSize: .min,
          children: [
            Text(
              'Enter meal name',
              style: TextStyle(fontSize: 16, fontWeight: .w500),
            ),
            SizedBox(height: 14),
            TextField(
              controller: mealNameTEC,
              decoration: InputDecoration(
                hintText: 'Input here',
                filled: false,
                border: UnderlineInputBorder(),
              ),
              onChanged: (value) {
                if (value.isEmpty) {
                  provider.setIsEnableAddMeal = false;
                } else {
                  provider.setIsEnableAddMeal = true;
                }
              },
            ),
            SizedBox(height: 23),
            Center(
              child: FilledButton(
                onPressed: provider.getIsEnableAddMeal == false
                    ? null
                    : () {
                        provider.addMealTiming(
                          MealTimingEntity(
                            mealName: mealNameTEC.text,
                            hr: 00,
                            min: 00,
                            isAm: true,
                          ),
                        );
                        Navigator.pop(context);
                      },
                style: FilledButton.styleFrom(
                  fixedSize: Size(54, 28),
                  padding: EdgeInsets.all(0),
                ),
                child: const Text('Done'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
