import 'package:neutria/data/home/entity/weekly_day_entity.dart';

class WeeklyDataViewService {
  WeeklyDataViewService._();
  static final WeeklyDataViewService _instance = WeeklyDataViewService._();
  factory WeeklyDataViewService() => _instance;

  final List<String> _weekDayName = [
    'Sat',
    'Sun',
    'Mon',
    'Tue',
    'Wed',
    'Thu',
    'Fri',
  ];

  List<WeeklyDayEntity> getWeeklyDayDate() {
    final int currentWeekDay = DateTime.now().weekday;
    final int needSubstract = (currentWeekDay - 6) % 7;
    final DateTime firstWeekDay = DateTime.now().subtract(
      Duration(days: needSubstract),
    );

    List<WeeklyDayEntity> fullWeeklyDate = List.generate(7, (index) {
      return WeeklyDayEntity(
        dayName: _weekDayName[index],
        date: firstWeekDay.add(Duration(days: index)).day,
        isToday:
            firstWeekDay.add(Duration(days: index)).day == DateTime.now().day,
      );
    });

    return fullWeeklyDate;
  }
}
