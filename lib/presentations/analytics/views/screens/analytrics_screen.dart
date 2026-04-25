import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:neutria/app/const_colors.dart';

class AnalytricsScreen extends StatelessWidget {
  const AnalytricsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Color carbsColor = Color(0xffFF938B);
    Color protienColor = Color(0xffFFAE4C);
    Color fatColor = Color(0xff6ADEF5);
    final List<String> options = ["Calorie", "Nutrition", "Vitamins"];
    final List<FlSpot> intakeData = [
      FlSpot(15, 2800),
      FlSpot(16, 2600),
      FlSpot(17, 2700),
      FlSpot(18, 2900),
      FlSpot(19, 2500),
      FlSpot(20, 2700),
    ];

    final List<FlSpot> goalData = [
      FlSpot(15, 2700),
      FlSpot(16, 2700),
      FlSpot(17, 2700),
      FlSpot(18, 2700),
      FlSpot(19, 2700),
      FlSpot(20, 2700),
    ];
    final List<String> elements = ["P", "Mg", "Na", "K", "Ca", "Cl", "S"];
    final List<double> values = [61.45, 50.19, 38.45, 31.76, 44.32, 63.6, 63.6];

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 31.0, vertical: 76),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Analytics',
                    style: TextStyle(fontSize: 20, fontWeight: .w600),
                  ),
                  Container(
                    height: 30,
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: Colors.grey.shade400,
                      ), // subtle border
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        // value: selectedValue,
                        hint: Text("Filter"),
                        icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                        items: options
                            .map(
                              (e) => DropdownMenuItem(child: Text(e), value: e),
                            )
                            .toList(),
                        onChanged: (newValue) {},
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              AnalyticsLineChart(intakeData: intakeData, goalData: goalData),
              SizedBox(height: 16),
              MicroNutrientWidget(
                carbsColor: carbsColor,
                protienColor: protienColor,
                fatColor: fatColor,
              ),
              SizedBox(height: 16),
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: .circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: .start,
                      children: [
                        Row(
                          mainAxisAlignment: .spaceBetween,
                          children: [
                            Text(
                              'Macrominerals',
                              style: TextStyle(fontSize: 14, fontWeight: .w600),
                            ),
                            Spacer(),
                            Text(
                              '18 July',
                              style: TextStyle(fontSize: 12, fontWeight: .w400),
                            ),
                            SizedBox(width: 8),
                            Container(
                              padding: .all(4),
                              decoration: BoxDecoration(
                                shape: .circle,
                                color: ConstColors.lightBoderColor,
                              ),
                              child: Icon(
                                Icons.calendar_month_rounded,
                                color: ConstColors.lightGreyTextColor,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 28),
                        Center(
                          child: Text(
                            'Daily intake (mg)',
                            style: TextStyle(
                              fontSize: 12,
                              color: ConstColors.lightGreyTextColor,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),

                        Expanded(
                          child: BarChart(
                            BarChartData(
                              maxY: 100,
                              alignment: BarChartAlignment.spaceAround,
                              titlesData: FlTitlesData(
                                leftTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 40,
                                  ),
                                ),
                                bottomTitles: AxisTitles(
                                  sideTitles: SideTitles(
                                    showTitles: true,
                                    reservedSize: 30,
                                    getTitlesWidget: (value, meta) {
                                      int index = value.toInt();
                                      if (index >= 0 &&
                                          index < elements.length) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                            top: 8.0,
                                          ),
                                          child: Text(
                                            '(${elements[index]})',
                                            style: TextStyle(fontSize: 12),
                                          ),
                                        );
                                      }
                                      return const SizedBox.shrink();
                                    },
                                  ),
                                ),
                                topTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                                rightTitles: AxisTitles(
                                  sideTitles: SideTitles(showTitles: false),
                                ),
                              ),
                              barGroups: List.generate(elements.length, (i) {
                                return BarChartGroupData(
                                  x: i,
                                  barRods: [
                                    BarChartRodData(
                                      toY: values[i],
                                      color: Color(0xffBDE87C),
                                      width: 22,
                                      borderRadius: .only(
                                        topLeft: .circular(10),
                                        topRight: .circular(10),
                                      ),
                                    ),
                                  ],
                                  showingTooltipIndicators: [
                                    0,
                                  ], // show tooltip above each bar
                                );
                              }),
                              barTouchData: BarTouchData(
                                enabled: true,
                                touchTooltipData: BarTouchTooltipData(
                                  tooltipBorder: BorderSide(
                                    width: 0,
                                    color: Colors.transparent,
                                  ),
                                  tooltipBorderRadius: .zero,
                                  tooltipMargin: 0,
                                  tooltipPadding: .zero,

                                  getTooltipColor: (group) =>
                                      Colors.transparent,
                                  getTooltipItem:
                                      (group, groupIndex, rod, rodIndex) {
                                        return BarTooltipItem(
                                          values[group.x].toStringAsFixed(2),
                                          TextStyle(
                                            color: Colors.black,
                                            fontSize: 10,
                                          ),
                                        );
                                      },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 135),
            ],
          ),
        ),
      ),
    );
  }
}

class MicroNutrientWidget extends StatelessWidget {
  const MicroNutrientWidget({
    super.key,
    required this.carbsColor,
    required this.protienColor,
    required this.fatColor,
  });

  final Color carbsColor;
  final Color protienColor;
  final Color fatColor;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: .circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Macronutrients',
                    style: TextStyle(fontSize: 14, fontWeight: .w600),
                  ),
                  Text(
                    'Weekly Intake',
                    style: TextStyle(fontSize: 12, fontWeight: .w400),
                  ),
                ],
              ),
              SizedBox(height: 13),
              Divider(),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: .start,
                children: [
                  Icon(Icons.circle, size: 12, color: carbsColor),
                  SizedBox(width: 5),
                  Text(
                    'Carbs',
                    style: TextStyle(fontSize: 12, fontWeight: .w500),
                  ),
                  SizedBox(width: 18),
                  Icon(Icons.circle, size: 12, color: protienColor),
                  SizedBox(width: 5),
                  Text(
                    'Protien',
                    style: TextStyle(fontSize: 12, fontWeight: .w500),
                  ),
                  SizedBox(width: 18),
                  Icon(Icons.circle, size: 12, color: fatColor),
                  SizedBox(width: 5),
                  Text(
                    'Fat',
                    style: TextStyle(fontSize: 12, fontWeight: .w500),
                  ),
                  SizedBox(width: 18),
                ],
              ),
              SizedBox(height: 34),
              Wrap(
                children: [
                  SizedBox(width: 47),
                  Text(
                    'Nutrition Goal',
                    style: TextStyle(fontSize: 12, fontWeight: .w500),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '- - - -',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.lightGreen,
                      fontWeight: .bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: BarChart(
                  BarChartData(
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          reservedSize: 40,
                          interval: 25,
                          showTitles: true,
                          getTitlesWidget: (value, meta) =>
                              value % 25 == 0 && value != 0
                              ? Text('${value.toInt()}')
                              : Text(''),
                        ),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    maxY: 100,
                    extraLinesData: ExtraLinesData(
                      horizontalLines: [
                        HorizontalLine(
                          y: 100,
                          dashArray: [5, 5],
                          color: Colors.lightGreen,
                        ),
                      ],
                    ),

                    barTouchData: BarTouchData(
                      enabled: true,
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipColor: (group) => Colors.white,
                        tooltipBorder: BorderSide(
                          color: ConstColors.lightBoderColor,
                        ),

                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          final stacks = rod.rodStackItems;
                          double fat = stacks[0].toY - stacks[0].fromY;
                          double protein = stacks[1].toY - stacks[1].fromY;
                          double carbs = stacks[2].toY - stacks[2].fromY;
                          return BarTooltipItem(
                            textAlign: .start,
                            textDirection: .ltr,
                            '',
                            TextStyle(),
                            children: [
                              TextSpan(
                                text: "• ",
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                  height: 1.0,
                                  fontWeight: .bold,
                                ),
                              ),
                              TextSpan(
                                text: "Fat: ${fat.toInt()}%\n",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: "• ",
                                style: TextStyle(
                                  color: Colors.pink,
                                  fontSize: 18,
                                  height: 1.0,
                                  fontWeight: .bold,
                                ),
                              ),
                              TextSpan(
                                text: "Carbs: ${carbs.toInt()}%\n",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                              TextSpan(
                                text: "• ",
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 18,
                                  height: 1.0,
                                  fontWeight: .bold,
                                ),
                              ),
                              TextSpan(
                                text: "Protein: ${protein.toInt()}%",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    barGroups: [
                      getBarChartGroupData(
                        fatColor: fatColor,
                        protienColor: protienColor,
                        carbsColor: carbsColor,
                        toY: 100,
                        x: 15,
                        fatStart: 60,
                        fatEnd: 100,
                        protienStart: 45,
                        protienEnd: 60,
                        carbsStart: 0,
                        carbsEnd: 45,
                      ),
                      getBarChartGroupData(
                        fatColor: fatColor,
                        protienColor: protienColor,
                        carbsColor: carbsColor,
                        toY: 100,
                        x: 16,
                        fatStart: 55,
                        fatEnd: 100,
                        protienStart: 30,
                        protienEnd: 55,
                        carbsStart: 0,
                        carbsEnd: 30,
                      ),
                      getBarChartGroupData(
                        fatColor: fatColor,
                        protienColor: protienColor,
                        carbsColor: carbsColor,
                        toY: 100,
                        x: 17,
                        fatStart: 80,
                        fatEnd: 100,
                        protienStart: 45,
                        protienEnd: 80,
                        carbsStart: 0,
                        carbsEnd: 45,
                      ),
                      getBarChartGroupData(
                        fatColor: fatColor,
                        protienColor: protienColor,
                        carbsColor: carbsColor,
                        toY: 100,
                        x: 18,
                        fatStart: 60,
                        fatEnd: 100,
                        protienStart: 30,
                        protienEnd: 60,
                        carbsStart: 0,
                        carbsEnd: 30,
                      ),
                      getBarChartGroupData(
                        fatColor: fatColor,
                        protienColor: protienColor,
                        carbsColor: carbsColor,
                        toY: 100,
                        x: 19,
                        fatStart: 70,
                        fatEnd: 100,
                        protienStart: 40,
                        protienEnd: 70,
                        carbsStart: 0,
                        carbsEnd: 40,
                      ),
                      getBarChartGroupData(
                        fatColor: fatColor,
                        protienColor: protienColor,
                        carbsColor: carbsColor,
                        toY: 89,
                        x: 19,
                        fatStart: 60,
                        fatEnd: 89,
                        protienStart: 20,
                        protienEnd: 60,
                        carbsStart: 0,
                        carbsEnd: 20,
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

BarChartGroupData getBarChartGroupData({
  required Color fatColor,
  required protienColor,
  required carbsColor,
  required double toY,
  required int x,
  required double fatStart,
  required double fatEnd,
  required double protienStart,
  required double protienEnd,
  required double carbsStart,
  required double carbsEnd,
}) {
  return BarChartGroupData(
    x: x,
    groupVertically: true,
    barRods: [
      BarChartRodData(
        width: 24,
        rodStackItems: [
          BarChartRodStackItem(fatStart, fatEnd, fatColor),
          BarChartRodStackItem(protienStart, protienEnd, protienColor),
          BarChartRodStackItem(carbsStart, carbsEnd, carbsColor),
        ],
        toY: toY,
        color: Colors.transparent,
      ),
    ],
  );
}

class AnalyticsLineChart extends StatelessWidget {
  const AnalyticsLineChart({
    super.key,
    required this.intakeData,
    required this.goalData,
  });

  final List<FlSpot> intakeData;
  final List<FlSpot> goalData;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: .circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    'Calorie (Kcal)',
                    style: TextStyle(fontSize: 14, fontWeight: .w600),
                  ),
                  Text(
                    'Weekly Intake',
                    style: TextStyle(fontSize: 12, fontWeight: .w400),
                  ),
                ],
              ),
              SizedBox(height: 13),
              Divider(),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    'Yesterday',
                    style: TextStyle(fontSize: 12, fontWeight: .w500),
                  ),
                  SizedBox(width: 5),
                  Icon(Icons.circle, size: 12, color: Colors.lightGreen),
                  SizedBox(width: 18),
                  Text(
                    'Calorie Goal',
                    style: TextStyle(fontSize: 12, fontWeight: .w500),
                  ),
                  SizedBox(width: 5),
                  Text(
                    '- - - -',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.lightGreen,
                      fontWeight: .bold,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                child: LineChart(
                  LineChartData(
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 50,
                          interval: 500,
                          getTitlesWidget: (value, meta) => Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text('${value.toInt()}'),
                          ),
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          reservedSize: 50,
                          getTitlesWidget: (value, meta) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: Text(value.toInt().toString()),
                            );
                          },
                        ),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            begin: .topCenter,
                            end: .bottomCenter,
                            colors: [
                              Colors.lightGreenAccent.shade100,
                              Colors.white,
                            ],
                          ),
                        ),
                        spots: intakeData,
                        isCurved: true,
                        color: Colors.lightGreen,
                        barWidth: 3,
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, ibdex) {
                            if (spot.x == 20) {
                              return FlDotCirclePainter(
                                color: Colors.lightGreen,
                                strokeWidth: 2,
                              );
                            } else {
                              return FlDotCirclePainter(
                                color: Colors.white,
                                strokeColor: Colors.lightGreen,
                                strokeWidth: 2,
                              );
                            }
                          },
                        ),
                      ),
                      LineChartBarData(
                        spots: goalData,
                        isCurved: false,
                        color: Colors.green,
                        barWidth: 2,
                        dashArray: [5, 5], // dashed effect
                        dotData: FlDotData(show: false),
                      ),
                    ],
                    minY: 500,
                    maxY: 3000,
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
