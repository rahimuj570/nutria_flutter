import 'package:flutter/material.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';

class CustomDatePickerWidget extends StatelessWidget {
  final ChooseOptionProvider provider;
  const CustomDatePickerWidget({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    FixedExtentScrollController monthController = FixedExtentScrollController(
      initialItem: provider.selectedMonth == null
          ? 30
          : provider.selectedMonth! - 1,
    );

    FixedExtentScrollController dayController = FixedExtentScrollController(
      initialItem: provider.selectedDay == null
          ? 31
          : provider.selectedDay! - 1,
    );

    FixedExtentScrollController yearController = FixedExtentScrollController(
      initialItem: provider.selectedYear == null
          ? DateTime.now().year - 1972
          : provider.years.indexOf(provider.selectedYear!),
    );

    int daysInMonth = provider.getDaysInMonth(
      provider.selectedYear ?? 0,
      provider.selectedMonth ?? 0,
    );

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Month wheel
        Expanded(
          child: ListWheelScrollView.useDelegate(
            controller: monthController,
            itemExtent: 50,
            physics: FixedExtentScrollPhysics(),
            onSelectedItemChanged: (index) {
              provider.changeMonth(index + 1);
            },
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                if (index < provider.months.length) {
                  final isSelected = (index + 1) == provider.selectedMonth;
                  return isSelected
                      ? Center(
                          child: Container(
                            width: 100,
                            padding: .all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(blurRadius: .1)],
                            ),
                            child: Text(
                              textAlign: .center,
                              provider.months[index],
                              style: TextStyle(fontSize: 14, fontWeight: .w500),
                            ),
                          ),
                        )
                      : Center(
                          child: Text(
                            provider.months[index],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        );
                }
                return null;
              },
              childCount: DateTime.now().year == provider.selectedYear
                  ? DateTime.now().month
                  : provider.months.length,
            ),
          ),
        ),

        // Day wheel
        Expanded(
          child: ListWheelScrollView.useDelegate(
            controller: dayController,
            itemExtent: 50,
            physics: FixedExtentScrollPhysics(),
            onSelectedItemChanged: (index) {
              provider.changeDate(index + 1);
            },
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                if (index < daysInMonth) {
                  final day = index + 1;
                  final isSelected = day == provider.selectedDay;
                  return isSelected
                      ? Center(
                          child: Container(
                            width: 80,
                            padding: .all(8),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [BoxShadow(blurRadius: .1)],
                            ),
                            child: Text(
                              textAlign: .center,
                              '$day'.padLeft(2, '0'),
                              style: TextStyle(fontSize: 14, fontWeight: .w500),
                            ),
                          ),
                        )
                      : Center(
                          child: Text(
                            '$day'.padLeft(2, '0'),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        );
                }
                return null;
              },
              childCount: daysInMonth,
            ),
          ),
        ),

        // Year wheel
        Expanded(
          child: ListWheelScrollView.useDelegate(
            controller: yearController,
            itemExtent: 50,
            physics: FixedExtentScrollPhysics(),
            onSelectedItemChanged: (index) {
              provider.changeYear(provider.years[index]);
            },
            childDelegate: ListWheelChildBuilderDelegate(
              builder: (context, index) {
                final year = provider.years[index];
                final isSelected = year == provider.selectedYear;
                return isSelected
                    ? Center(
                        child: Container(
                          width: 80,
                          padding: .all(8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [BoxShadow(blurRadius: .1)],
                          ),
                          child: Text(
                            textAlign: .center,
                            '$year',
                            style: TextStyle(fontSize: 14, fontWeight: .w500),
                          ),
                        ),
                      )
                    : Center(
                        child: Text(
                          '$year',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      );
              },
              childCount: provider.years.length,
            ),
          ),
        ),
      ],
    );
  }
}
