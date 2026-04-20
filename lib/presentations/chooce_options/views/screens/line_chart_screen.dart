import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:provider/provider.dart';

class LineChartScreen extends StatelessWidget {
  const LineChartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChooseOptionProvider>(
      builder: (context, provider, child) => Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .center,
        children: [
          Text(
            'Choose your Goal?',
            style: TextStyle(fontWeight: .w600, fontSize: 24),
          ),

          SizedBox(height: 160),
          Padding(
            padding: const EdgeInsets.only(left: 30.0, bottom: 10),
            child: Text(
              'Weight Maintain',
              style: TextStyle(fontSize: 16, fontWeight: .w600),
            ),
          ),
          SizedBox(
            height: 300,
            width: .infinity,
            child: LineChart(
              LineChartData(
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 40,
                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 1:
                            return Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text(
                                "1 Month",
                                style: TextStyle(fontWeight: .w500),
                              ),
                            );
                          case 6:
                            return Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: Text(
                                "6 Month",
                                style: TextStyle(fontWeight: .w500),
                              ),
                            );
                          default:
                            return Text("");
                        }
                      },
                    ),
                  ),
                ),
                betweenBarsData: [
                  BetweenBarsData(
                    fromIndex: 0,
                    toIndex: 1,
                    color: Colors.green.withValues(alpha: .2),
                  ),
                ],
                lineBarsData: [
                  // Cal Z line
                  LineChartBarData(
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        begin: .topCenter,
                        end: .bottomCenter,
                        colors: [
                          Colors.red.withValues(alpha: .2),
                          Colors.red.withValues(alpha: 0),
                        ],
                      ),
                    ),
                    spots: [
                      FlSpot(1, 130),
                      FlSpot(3, 130),
                      FlSpot(4, 100),
                      FlSpot(6, 105),
                    ],
                    dotData: FlDotData(
                      checkToShowDot: (spot, barData) =>
                          spot.x == 1 || spot.x == 6 ? true : false,
                    ),
                    isCurved: true,
                    color: Colors.red,
                  ),
                  LineChartBarData(
                    dotData: FlDotData(
                      checkToShowDot: (spot, barData) =>
                          spot.x == 1 || spot.x == 6 ? true : false,
                    ),
                    spots: [
                      FlSpot(1, 130),
                      FlSpot(3, 110),
                      FlSpot(4, 120),
                      FlSpot(6, 100),
                    ],
                    isCurved: true,
                    color: Colors.green,
                    belowBarData: BarAreaData(
                      show: true,
                      // color: Colors.green.withOpacity(0.3),
                      color: Colors.lightGreenAccent.withValues(alpha: .3),
                    ),
                  ),
                  // Traditional line
                ],
                minX: 1,
                maxX: 6,
                minY: 0,
                maxY: 140,
                gridData: FlGridData(show: true, horizontalInterval: 30),
                borderData: FlBorderData(show: true),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
