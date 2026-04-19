import 'package:flutter/material.dart';
import 'package:neutria/app/const_colors.dart';
import 'package:neutria/data/choioce_options/enums/height_enums.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:neutria/presentations/chooce_options/views/widgets/height_ruler_widget.dart';
import 'package:neutria/presentations/chooce_options/views/widgets/two_option_group_tab_widget.dart';
import 'package:provider/provider.dart';

class ChooseHeightScreen extends StatelessWidget {
  const ChooseHeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController(
      initialScrollOffset:
          ((context.read<ChooseOptionProvider>().getChooseHeight ?? 0) * 30 -
                  (450 / 2) +
                  (30 / 2))
              .clamp(
                0.0,
                (context.read<ChooseOptionProvider>().heightRangeCm.length *
                        30) -
                    450,
              ),
    );

    scrollController.addListener(() {
      double itemHeight = 30; // must match itemExtent
      double listHeight = 450; // your SizedBox height

      // Index of item at center
      int centerIndex =
          (scrollController.offset / itemHeight + (listHeight / itemHeight) / 2)
              .floor();

      if (centerIndex >= 0 &&
          centerIndex <
              context.read<ChooseOptionProvider>().heightRangeCm.length) {
        context.read<ChooseOptionProvider>().chooseChooseHeightIndex(
          centerIndex,
        );
      }
    });

    return Consumer<ChooseOptionProvider>(
      builder: (context, provider, child) => Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .center,
        children: [
          Text(
            'How Tall are you?',
            style: TextStyle(fontWeight: .w600, fontSize: 24),
          ),
          SizedBox(height: 8),
          Text(
            'This will be utilized to adjust your tailored plan?.',
            style: TextStyle(fontWeight: .w400, fontSize: 12),
          ),
          SizedBox(height: 20),

          Container(
            padding: .all(8),
            decoration: BoxDecoration(
              border: Border.all(color: ConstColors.lightBoderColor),
              borderRadius: .circular(8),
            ),
            child: TwoOptionGroupTabWidget(
              provider: provider,
              fun1: () => provider.changeHeightUnit(HeightEnums.cm),
              fun2: () => provider.changeHeightUnit(HeightEnums.feet),
              title1: 'Centemeter',
              title2: 'Feet',
              fun1Selected: provider.getHeightUnit == HeightEnums.cm,
            ),
          ),

          SizedBox(height: 10),

          HeightRulerWidget(
            scrollController: scrollController,
            provider: provider,
          ),
        ],
      ),
    );
  }
}
