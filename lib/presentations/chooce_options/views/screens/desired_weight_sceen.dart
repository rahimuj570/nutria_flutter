import 'package:flutter/material.dart';
import 'package:neutria/app/app_assets_path.dart';
import 'package:neutria/app/const_colors.dart';
import 'package:neutria/data/choioce_options/enums/weight_enum.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:neutria/presentations/chooce_options/views/widgets/two_option_group_tab_widget.dart';
import 'package:neutria/presentations/chooce_options/views/widgets/weight_text_input.dart';
import 'package:provider/provider.dart';

class DesiredWeightSceen extends StatelessWidget {
  const DesiredWeightSceen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isscrollingFromTextField = false;
    final TextEditingController weightTEC = TextEditingController();
    double itemExtent = 45; // width of each item
    final ScrollController scrollController = ScrollController(
      initialScrollOffset:
          context.read<ChooseOptionProvider>().getDesiredWeightIndex != null
          ? context.read<ChooseOptionProvider>().getDesiredWeightIndex! *
                    itemExtent -
                (itemExtent / 2 + 250 / 2)
          : 0.0,
    );

    if (context.read<ChooseOptionProvider>().getDesiredWeightIndex != null) {
      if (context.read<ChooseOptionProvider>().getDesiredWeightType ==
          WeightEnum.pound) {
        weightTEC.text =
            '${context.read<ChooseOptionProvider>().desiredWeightRangePound[context.read<ChooseOptionProvider>().getDesiredWeightIndex!]}';
      } else {
        weightTEC.text =
            '${context.read<ChooseOptionProvider>().desiredWeightRangeKg[context.read<ChooseOptionProvider>().getDesiredWeightIndex!]}';
      }
    }

    scrollController.addListener(() {
      if (isscrollingFromTextField) return;
      ChooseOptionProvider provider = context.read<ChooseOptionProvider>();

      // Index of item at center
      int centerIndex =
          (scrollController.offset / itemExtent +
                  (context.size!.width / itemExtent) / 2)
              .floor();

      if (centerIndex >= 0 &&
          centerIndex < provider.desiredWeightRangeKg.length) {
        provider.chooseDesiredWeightIndex(centerIndex);
      }
      if (provider.getDesiredWeightType == WeightEnum.pound) {
        weightTEC.text =
            '${provider.desiredWeightRangePound[provider.getDesiredWeightIndex!]}';
      } else {
        weightTEC.text =
            '${provider.desiredWeightRangeKg[provider.getDesiredWeightIndex!]}';
      }
    });

    // Helper: scroll to index
    void scrollToIndex(int index) async {
      isscrollingFromTextField = true;
      await scrollController.animateTo(
        index * itemExtent - (itemExtent / 2 + 250 / 2),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      isscrollingFromTextField = false;
    }

    return Consumer<ChooseOptionProvider>(
      builder: (context, provider, child) => Column(
        crossAxisAlignment: .center,
        mainAxisAlignment: .center,
        children: [
          Text(
            'Enter your Desired weight',
            style: TextStyle(fontWeight: .w600, fontSize: 24),
          ),
          SizedBox(height: 50),

          Container(
            padding: .all(8),
            decoration: BoxDecoration(
              border: Border.all(color: ConstColors.lightBoderColor),
              borderRadius: .circular(8),
            ),
            child: TwoOptionGroupTabWidget(
              provider: provider,
              fun1: () {
                if (provider.getDesiredWeightIndex != null) {
                  weightTEC.text =
                      '${provider.desiredWeightRangeKg[provider.getDesiredWeightIndex!]}';
                }

                provider.chooseDesiredWeightEnum(WeightEnum.kg);
              },
              fun2: () {
                if (provider.getDesiredWeightIndex != null) {
                  weightTEC.text =
                      '${provider.desiredWeightRangePound[provider.getDesiredWeightIndex!]}';
                }
                provider.chooseDesiredWeightEnum(WeightEnum.pound);
              },
              title1: 'Kilogram',
              title2: 'Pounds',
              fun1Selected: provider.getDesiredWeightType == WeightEnum.kg,
            ),
          ),

          // SizedBox(height: 10),
          SizedBox(
            height: 200,
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemExtent: itemExtent,
              itemCount: 31,
              itemBuilder: (context, index) {
                bool isKgUnit = provider.getDesiredWeightType == WeightEnum.kg;
                int value = provider.getDesiredWeightType == WeightEnum.kg
                    ? 45 + index
                    : 99 + index;
                bool isMajorTick = value % 5 == 0;
                if (provider.getDesiredWeightIndex == index) {
                  return Align(
                    alignment: .bottomCenter,
                    child: Column(
                      mainAxisAlignment: .end,
                      children: [
                        Text(
                          '$value ${isKgUnit ? 'kg' : 'lbs'}',
                          textAlign: .center,
                          style: TextStyle(fontWeight: .bold),
                        ),
                        Container(width: 3, height: 32, color: Colors.black),
                        Image.asset(AppAssetsPath.topSelctedRulerPonter),
                      ],
                    ),
                  );
                }

                return GestureDetector(
                  onTap: () {
                    weightTEC.text = '${provider.desiredWeightRangeKg[index]}';
                    provider.chooseDesiredWeightIndex(index);
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (isMajorTick)
                        Text(
                          '$value ${isKgUnit ? 'kg' : 'lbs'}',
                          style: const TextStyle(fontSize: 12),
                        ),
                      Container(
                        width: 2,
                        height: isMajorTick ? 30 : 15,
                        color: Colors.black,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(width: .infinity, height: 2, color: Colors.black),
          SizedBox(height: 16),
          Image.asset(AppAssetsPath.horizontalArrow),
          SizedBox(height: 50),
          WeightInputWedget(
            weightTEC: weightTEC,
            onInputChange: (a) {
              provider.chooseDesiredWeightIndexByText(weightTEC.text);
              if (provider.getDesiredWeightIndex != null) {
                scrollToIndex(provider.getDesiredWeightIndex!);
              }
            },
          ),
        ],
      ),
    );
  }
}
