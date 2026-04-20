import 'package:flutter/material.dart';
import 'package:neutria/app/app_assets_path.dart';
import 'package:neutria/app/const_colors.dart';
import 'package:neutria/data/choioce_options/enums/gender_enum.dart';
import 'package:neutria/data/choioce_options/enums/height_enums.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';

class HeightRulerWidget extends StatelessWidget {
  final ChooseOptionProvider provider;
  const HeightRulerWidget({
    super.key,
    required this.scrollController,
    required this.provider,
  });

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    int divisor = provider.getHeightUnit == HeightEnums.cm ? 5 : 12;
    debugPrint(provider.heightRangeFeet.toString());
    return Row(
      children: [
        Image.asset(AppAssetsPath.verticleArrow),
        SizedBox(width: 30),
        Container(
          height: 450,
          width: 2,
          color: Colors.black,
          padding: .all(0),
          margin: .all(0),
        ),
        Expanded(
          child: SizedBox(
            height: 450,
            child: Stack(
              children: [
                ListView.builder(
                  itemExtent: 30,
                  controller: scrollController,
                  padding: .all(0),
                  scrollDirection: .vertical,
                  itemCount: provider.heightRangeFeet.length,
                  itemBuilder: (context, index) {
                    ////
                    ///
                    ///
                    ///
                    bool isMajorTick;
                    if (provider.getHeightUnit == HeightEnums.cm) {
                      isMajorTick = index % 5 == 0;
                    } else {
                      // Highlights every 0.5 feet (e.g., 4.5, 5.0, 5.5...)
                      // We use a small epsilon (0.02) because of floating point precision
                      double val = provider.heightRangeFeet[index];
                      isMajorTick =
                          (val * 2 % 1.0 < 0.03) || (val * 2 % 1.0 > 0.97);
                    }

                    ///
                    ///
                    ///
                    ///

                    double height = provider.getHeightUnit == HeightEnums.cm
                        ? provider.heightRangeCm[index]
                        : double.parse(
                            provider.heightRangeFeet[index].toStringAsFixed(2),
                          );

                    if (provider.getChooseHeight == index) {
                      return Row(
                        children: [
                          Image.asset(AppAssetsPath.selctedRulerPonter),
                          Container(
                            margin: .symmetric(vertical: 10),
                            width: isMajorTick ? 50 : 40,
                            height: 3,
                            color: Colors.black,
                          ),
                          Text(
                            ' $height',
                            style: TextStyle(fontWeight: .w600, fontSize: 20),
                          ),
                          Text(
                            ' ${provider.getHeightUnit.name}',
                            style: TextStyle(fontWeight: .w500, fontSize: 12),
                          ),
                        ],
                      );
                    }

                    if (isMajorTick) {
                      return GestureDetector(
                        onTap: () => provider.chooseChooseHeightIndex(index),
                        child: Row(
                          children: [
                            Align(
                              alignment: .centerLeft,
                              child: Container(
                                margin: .symmetric(vertical: 10),
                                width: isMajorTick ? 50 : 25,
                                height: 4,
                                color: Colors.black,
                              ),
                            ),
                            Text(' $height'),
                          ],
                        ),
                      );
                    }

                    return GestureDetector(
                      onTap: () => provider.chooseChooseHeightIndex(index),
                      child: Align(
                        alignment: .centerLeft,
                        child: Container(
                          margin: .symmetric(vertical: 10),
                          width: isMajorTick ? 50 : 25,
                          height: 2,
                          color: Colors.black,
                        ),
                      ),
                    );
                  },
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          ConstColors.lightScafoldColor.withValues(alpha: .5),
                          ConstColors.lightScafoldColor,
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          ConstColors.lightScafoldColor,
                          ConstColors.lightScafoldColor.withOpacity(.5),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Image.asset(
          provider.getGenderChoose == GenderEnum.male
              ? AppAssetsPath.maleHeightFigure
              : AppAssetsPath.femaleHeightFigure,
        ),
      ],
    );
  }
}
