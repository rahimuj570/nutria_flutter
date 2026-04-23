import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

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
                              maxY: 100,
                              barGroups: [
                                BarChartGroupData(
                                  x: 15,
                                  groupVertically: true,
                                  barRods: [
                                    BarChartRodData(
                                      width: 24,
                                      rodStackItems: [
                                        BarChartRodStackItem(
                                          40,
                                          75,
                                          protienColor,
                                        ),
                                        BarChartRodStackItem(75, 100, fatColor),
                                      ],
                                      toY: 100,
                                      color: carbsColor,
                                    ),
                                  ],
                                ),
                                BarChartGroupData(
                                  x: 16,
                                  groupVertically: true,
                                  barRods: [
                                    BarChartRodData(
                                      width: 24,
                                      rodStackItems: [
                                        BarChartRodStackItem(
                                          30,
                                          60,
                                          protienColor,
                                        ),
                                        BarChartRodStackItem(60, 100, fatColor),
                                      ],
                                      toY: 100,
                                      color: carbsColor,
                                    ),
                                  ],
                                ),

                                BarChartGroupData(
                                  x: 17,
                                  groupVertically: true,
                                  barRods: [
                                    BarChartRodData(
                                      width: 24,
                                      rodStackItems: [
                                        BarChartRodStackItem(
                                          45,
                                          80,
                                          protienColor,
                                        ),
                                        BarChartRodStackItem(80, 100, fatColor),
                                      ],
                                      toY: 100,
                                      color: carbsColor,
                                    ),
                                  ],
                                ),
                                BarChartGroupData(
                                  x: 17,
                                  groupVertically: true,
                                  barRods: [
                                    BarChartRodData(
                                      width: 24,
                                      rodStackItems: [
                                        BarChartRodStackItem(
                                          30,
                                          60,
                                          protienColor,
                                        ),
                                        BarChartRodStackItem(60, 100, fatColor),
                                      ],
                                      toY: 100,
                                      color: carbsColor,
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
              ),
              SizedBox(height: 135),
            ],
          ),
        ),
      ),
    );
  }
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
