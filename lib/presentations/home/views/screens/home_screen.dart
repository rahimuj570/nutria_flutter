import 'package:flutter/material.dart';
import 'package:neutria/app/app_assets_path.dart';
import 'package:neutria/app/const_colors.dart';
import 'package:neutria/data/home/entity/weekly_day_entity.dart';
import 'package:neutria/data/home/services/weekly_data_view_service.dart';
import 'package:neutria/presentations/common/view/screens/custom_app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<WeeklyDayEntity> weeklyDays = WeeklyDataViewService()
        .getWeeklyDayDate();
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Cal Z'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: weeklyDays
                    .map(
                      (e) => Column(
                        children: [
                          Text(e.dayName, style: TextStyle(fontSize: 12)),
                          SizedBox(height: 7),
                          Container(
                            height: 25,
                            width: 25,
                            decoration: BoxDecoration(
                              color: e.isToday ? Colors.black : null,
                              shape: .circle,
                            ),
                            child: Center(
                              child: Text(
                                '${e.date}',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: e.isToday
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 18),
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(19.0),
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: .start,
                        children: [
                          Text(
                            '2300',
                            style: TextStyle(fontSize: 36, fontWeight: .bold),
                          ),
                          Text(
                            'Calories left',
                            style: TextStyle(fontSize: 12, fontWeight: .w500),
                          ),
                          Text(
                            '(Intake)',
                            style: TextStyle(fontSize: 10, fontWeight: .w400),
                          ),
                        ],
                      ),
                      Spacer(),
                      Image.asset(AppAssetsPath.calUp),
                      SizedBox(width: 24),
                      Column(
                        children: [
                          Text(
                            'Burned',
                            style: TextStyle(
                              color: ConstColors.lightGreyTextColor,
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 6),
                          Container(
                            decoration: BoxDecoration(
                              shape: .circle,
                              color: Colors.grey.shade300,
                            ),
                            child: Icon(
                              Icons.add,
                              color: ConstColors.lightGreyTextColor,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            '100',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                              fontWeight: .w500,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'KCal',
                            style: TextStyle(
                              color: ConstColors.lightGreyTextColor,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
