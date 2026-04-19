import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:neutria/app/app_assets_path.dart';
import 'package:neutria/data/choioce_options/enums/goal_enum.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:neutria/presentations/chooce_options/views/widgets/goal_option_card_widget.dart';
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
                      getTitlesWidget: (value, meta) {
                        switch (value.toInt()) {
                          case 1:
                            return Text("1 Month");
                          case 6:
                            return Text("6 Month");
                          default:
                            return Text("");
                        }
                      },
                    ),
                  ),
                ),
                lineBarsData: [
                  // Cal Z line
                  LineChartBarData(
                    spots: [FlSpot(1, 130), FlSpot(6, 100)],
                    isCurved: true,
                    color: Colors.green,
                    belowBarData: BarAreaData(
                      show: true,
                      color: Colors.green.withOpacity(0.3),
                    ),
                  ),
                  // Traditional line
                  LineChartBarData(
                    spots: [FlSpot(1, 125), FlSpot(6, 105)],
                    isCurved: true,
                    color: Colors.red,
                  ),
                ],
                minX: 1,
                maxX: 6,
                minY: 0,
                maxY: 140,
                gridData: FlGridData(show: true),
                borderData: FlBorderData(show: true),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
