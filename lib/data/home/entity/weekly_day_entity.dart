class WeeklyDayEntity {
  final String dayName;
  final int date;
  final bool isToday;

  WeeklyDayEntity({
    required this.dayName,
    required this.date,
    required this.isToday,
  });

  @override
  String toString() {
    // TODO: implement toString
    return '$date $isToday';
  }
}
