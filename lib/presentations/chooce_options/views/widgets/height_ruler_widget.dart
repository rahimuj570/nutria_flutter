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
                  itemCount: provider.getHeightUnit == HeightEnums.feet
                      ? provider.heightRangeFeet.length
                      : provider.heightRangeCm.length,
                  itemBuilder: (context, index) {
                    // Base height in cm
                    double heightCm = provider.getHeightUnit == HeightEnums.cm
                        ? provider.heightRangeCm[index]
                        : provider.heightRangeCm[index]; // keep cm base

                    // Convert to feet if needed
                    double heightFeet = heightCm / 30.48;

                    // Highlight rules
                    bool isFullCm =
                        provider.getHeightUnit == HeightEnums.cm &&
                        index % 10 == 0;
                    bool isFullFoot =
                        provider.getHeightUnit == HeightEnums.feet &&
                        ((heightFeet - heightFeet.round()).abs() < 0.001);

                    // Selected item
                    if (provider.getChooseHeight == index) {
                      return Row(
                        children: [
                          Image.asset(AppAssetsPath.selctedRulerPonter),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            width: (isFullCm || isFullFoot) ? 60 : 40,
                            height: 3,
                            color: Colors.black,
                          ),
                          Text(
                            provider.getHeightUnit == HeightEnums.cm
                                ? ' ${heightCm.toStringAsFixed(1)}'
                                : ' ${heightFeet.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                          ),
                          Text(
                            ' ${provider.getHeightUnit.name}',
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      );
                    }

                    // Normal ticks
                    return GestureDetector(
                      onTap: () => provider.chooseChooseHeightIndex(index),
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 10),
                              width: (isFullCm || isFullFoot) ? 50 : 25,
                              height: (isFullCm || isFullFoot) ? 4 : 2,
                              color: Colors.black,
                            ),
                          ),
                          if (isFullCm || isFullFoot)
                            Text(
                              provider.getHeightUnit == HeightEnums.cm
                                  ? ' ${heightCm.toStringAsFixed(1)}'
                                  : ' ${heightFeet.toStringAsFixed(2)}',
                            ),
                        ],
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
                          ConstColors.lightScafoldColor.withValues(alpha: .5),
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
