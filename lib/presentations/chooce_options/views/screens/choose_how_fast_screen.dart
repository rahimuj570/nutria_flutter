import 'package:flutter/material.dart';
import 'package:neutria/app/app_assets_path.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:provider/provider.dart';

class ChooseHowFastScreen extends StatelessWidget {
  const ChooseHowFastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChooseOptionProvider>(
      builder: (context, provider, child) => Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .start,
        children: [
          Text(
            'How fast you want to catch your target?',
            style: TextStyle(fontWeight: .w600, fontSize: 24),
          ),

          SizedBox(height: 160),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text('Slow', style: TextStyle(fontSize: 14, fontWeight: .w600)),
                Text(
                  'Medium',
                  style: TextStyle(fontSize: 14, fontWeight: .w600),
                ),
                Text('Fast', style: TextStyle(fontSize: 14, fontWeight: .w600)),
              ],
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: .spaceEvenly,
            children: [
              Image.asset(AppAssetsPath.slow),
              Image.asset(AppAssetsPath.leftVerticleArrow),
              Image.asset(AppAssetsPath.medium),
              Image.asset(AppAssetsPath.rightVerticleArrow),
              Image.asset(AppAssetsPath.fast),
            ],
          ),
          SizedBox(height: 8),
          Slider(
            divisions: 2,
            padding: .symmetric(vertical: 0, horizontal: 5),
            max: 100,
            min: 0,
            value: provider.getHowFastWant,
            onChanged: (value) {
              provider.chooseHowFastWant(value);
            },
            activeColor: Colors.black,
          ),
          Align(
            alignment: AlignmentGeometry.directional(
              provider.getHowFastWant / 50 - 1,
              0,
            ),
            child: Column(
              crossAxisAlignment: .center,
              mainAxisAlignment: .start,
              children: [
                Container(
                  padding: .all(0),
                  margin: .all(0),
                  height: 50,
                  width: 4,
                  color: Colors.black,
                ),
                Image.asset(AppAssetsPath.topSelctedRulerPonter),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
