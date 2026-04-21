import 'package:flutter/material.dart';
import 'package:neutria/app/app_assets_path.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:provider/provider.dart';

class ChoosenFinalResultScreen extends StatelessWidget {
  const ChoosenFinalResultScreen({super.key});

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
            aspectRatio: 2 / 1.6,
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
                      Image.asset(AppAssetsPath.pieChartResult),
                      SizedBox(
                        height: 200,
                        width: 120,
                        child: Column(
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
                CircularProgressIndicator(
                  value: .7,
                  backgroundColor: Colors.grey.shade300,
                  color: Colors.black,
                  strokeWidth: 10,
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
            separatorBuilder: (_, __) => const SizedBox(height: 8),
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
