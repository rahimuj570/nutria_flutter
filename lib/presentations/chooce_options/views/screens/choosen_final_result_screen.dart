import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:neutria/app/app_assets_path.dart';
import 'package:neutria/app/const_colors.dart';
import 'package:neutria/data/choioce_options/entity/pie_chart_entiry.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:provider/provider.dart';

class ChoosenFinalResultScreen extends StatefulWidget {
  const ChoosenFinalResultScreen({super.key});

  @override
  State<ChoosenFinalResultScreen> createState() =>
      _ChoosenFinalResultScreenState();
}

class _ChoosenFinalResultScreenState extends State<ChoosenFinalResultScreen> {
  double _healthScore = 0;

  late final List<PieChartEntiry> _pieData = [
    PieChartEntiry(title: 'Carbs', color: Colors.grey, value: 1),
    PieChartEntiry(title: 'Protien', color: Color(0xffFFAE4C), value: 0),
    PieChartEntiry(title: 'Fats', color: Color(0xff6ADEF5), value: 0),
  ];

  void updateHEaltScore(double healthScore) async {
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      _healthScore = healthScore;
    });
  }

  void updatePieScore() async {
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      _pieData[0].color = Color(0xffFF938B);
      _pieData[0].value = 50;
      _pieData[1].value = 30;
      _pieData[2].value = 20;
    });
  }

  @override
  void initState() {
    updateHEaltScore(70);
    updatePieScore();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> strategies = [
      "Boost your routine with health scores.",
      "Monitor your meals.",
      "Maintain your recommended calorie intake.",
      "Maintain the right balance of carbs, protein, and fat.",
    ];

    return Consumer<ChooseOptionProvider>(
      builder: (context, provider, child) => Column(
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        children: [
          Icon(Icons.check_circle_rounded, size: 40),
          SizedBox(height: 8),
          Text(
            'Great news! Your personalized plan is ready!',
            textAlign: .center,
            style: TextStyle(fontWeight: .w600, fontSize: 20),
          ),
          SizedBox(height: 28),
          Text(
            'Your weight gaining schedule:',
            style: TextStyle(fontSize: 14, fontWeight: .w500),
          ),
          SizedBox(height: 15),
          Container(
            decoration: BoxDecoration(
              borderRadius: .circular(8),
              color: Colors.white,
            ),
            padding: .all(8),
            child: Text(
              'Lose 8kg by July 25, 2025',
              style: TextStyle(fontSize: 12, fontWeight: .w400),
            ),
          ),
          SizedBox(height: 20),
          AspectRatio(
            aspectRatio: 2 / 1.4,
            child: Container(
              padding: .all(5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: .circular(8),
              ),
              child: Column(
                children: [
                  Text(
                    'Your Daily recommendation',
                    style: TextStyle(fontSize: 14, fontWeight: .w500),
                  ),
                  Text(
                    'You can modify anything',
                    style: TextStyle(fontSize: 11, fontWeight: .w400),
                  ),
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: .spaceBetween,
                    crossAxisAlignment: .center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: SizedBox(
                          width: 150,
                          height: 150,
                          child: PieChart(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            PieChartData(
                              sectionsSpace: 0,
                              sections: _pieData
                                  .map(
                                    (e) => PieChartSectionData(
                                      radius: 28,
                                      value: e.value,
                                      color: e.color,
                                      showTitle: false,
                                      badgePositionPercentageOffset: .9,
                                      badgeWidget: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: .circular(8),
                                          color: Colors.grey.shade200,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Column(
                                            mainAxisSize: .min,
                                            children: [
                                              Text(
                                                e.title,
                                                style: TextStyle(
                                                  fontSize: 10,
                                                  fontWeight: .w500,
                                                ),
                                              ),
                                              Text(
                                                '${e.value}%',
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: .w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 120,
                        child: Column(
                          mainAxisSize: .min,
                          children: [
                            ListTile(
                              dense: true,
                              leading: Icon(
                                Icons.circle,
                                size: 12,
                                color: Colors.cyanAccent.shade400,
                              ),
                              minLeadingWidth: 1,
                              title: Text(
                                'Fats',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            ListTile(
                              dense: true,
                              leading: Icon(
                                Icons.circle,
                                size: 12,
                                color: const Color.fromARGB(255, 224, 151, 141),
                              ),
                              minLeadingWidth: 1,
                              title: Text(
                                'Carbs',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                            ListTile(
                              dense: true,
                              leading: Icon(
                                Icons.circle,
                                size: 12,
                                color: const Color.fromARGB(255, 250, 174, 74),
                              ),
                              minLeadingWidth: 1,
                              title: Text(
                                'Protien',
                                style: TextStyle(fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            padding: .all(10),
            width: .maxFinite,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: .circular(8),
            ),
            child: Row(
              crossAxisAlignment: .center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: .all(),
                    borderRadius: .circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image.asset(AppAssetsPath.healthScore),
                  ),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'Health Score',
                      style: TextStyle(fontSize: 12, fontWeight: .w500),
                    ),
                    Text(
                      '7/10',
                      style: TextStyle(fontSize: 12, fontWeight: .w400),
                    ),
                  ],
                ),
                Spacer(),
                TweenAnimationBuilder(
                  duration: Duration(milliseconds: 300),
                  tween: Tween(begin: 0, end: _healthScore),
                  builder: (context, value, child) => CircularProgressIndicator(
                    value: value / 100,
                    backgroundColor: Colors.grey.shade300,
                    color: Colors.black,
                    strokeWidth: 10,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Align(
            alignment: .centerStart,
            child: const Text(
              "Strategies to reach your goal",
              textAlign: .start,
              style: TextStyle(fontSize: 16, fontWeight: .w600),
            ),
          ),
          const SizedBox(height: 12),
          ListView.separated(
            padding: .all(0),
            shrinkWrap: true, // only take needed space
            physics: NeverScrollableScrollPhysics(), // no scrolling inside
            itemCount: strategies.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) => Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "• ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Expanded(
                  child: Text(
                    strategies[index],
                    textAlign: .justify,
                    style: const TextStyle(fontSize: 14, fontWeight: .w400),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
