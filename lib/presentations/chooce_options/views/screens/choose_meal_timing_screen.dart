import 'package:flutter/material.dart';
import 'package:neutria/app/const_colors.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:neutria/presentations/chooce_options/views/widgets/add_meal_widget.dart';
import 'package:neutria/presentations/chooce_options/views/widgets/enter_time_widget.dart';
import 'package:provider/provider.dart';

class ChooseMealTimingScreen extends StatelessWidget {
  const ChooseMealTimingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController mealNameTEC = TextEditingController();
    void addMeal() {
      showDialog(
        context: context,
        builder: (context) {
          return AddMealWidget(mealNameTEC: mealNameTEC);
        },
      );
    }

    void enterMealTime(int index) {
      showDialog(
        context: context,
        builder: (context) {
          return EnterTimeWidget(
            provider: context.read<ChooseOptionProvider>(),
            timeIndex: index,
          );
        },
      );
    }

    return Consumer<ChooseOptionProvider>(
      builder: (context, provider, child) => Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .start,
        children: [
          Text(
            'Enter your Meal timings',
            style: TextStyle(fontWeight: .w600, fontSize: 24),
          ),

          SizedBox(height: 30),
          ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: provider.getMealTiming.isEmpty ? 0 : 400,
            ),

            child: ListView.separated(
              shrinkWrap: true,
              itemCount: provider.getMealTiming.length + 1,
              separatorBuilder: (context, index) => Divider(indent: 10),
              itemBuilder: (context, index) =>
                  provider.getMealTiming.length != index
                  ? ListTile(
                      title: Text(
                        provider.getMealTiming[index].mealName,
                        style: TextStyle(fontSize: 16, fontWeight: .w500),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text(
                          '${provider.getMealTiming[index].hr.toString().padLeft(2, '0')}:${provider.getMealTiming[index].min.toString().padLeft(2, '0')}${provider.getMealTiming[index].isAm ? 'am' : 'pm'}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: .w500,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      trailing: IconButton(
                        onPressed: () => enterMealTime(index),
                        icon: Icon(Icons.watch_later_outlined),
                        color: Colors.grey,
                      ),
                    )
                  : null,
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: GestureDetector(
              onTap: addMeal,
              child: Row(
                children: [
                  SizedBox(
                    width: 30,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: .circle,
                        color: ConstColors.lightBoderColor,
                      ),

                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.add, size: 16),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Add meal',
                    style: TextStyle(fontSize: 16, fontWeight: .w500),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
