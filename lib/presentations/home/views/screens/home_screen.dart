import 'package:flutter/material.dart';
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Row(
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
            ),
          ],
        ),
      ),
    );
  }
}
