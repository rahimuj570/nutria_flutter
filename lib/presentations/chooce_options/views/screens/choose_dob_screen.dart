import 'package:flutter/material.dart';
import 'package:neutria/app/const_colors.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:neutria/presentations/chooce_options/views/widgets/custom_datepicker_widget.dart';
import 'package:provider/provider.dart';

class ChooseDobScreen extends StatelessWidget {
  const ChooseDobScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChooseOptionProvider>(
      builder: (context, provider, child) => Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .start,
        children: [
          Text(
            'When you were born?',
            style: TextStyle(fontWeight: .w600, fontSize: 24),
          ),
          SizedBox(height: 8),
          Text(
            'This will be utilized to adjust your tailored plan?',
            style: TextStyle(fontWeight: .w400, fontSize: 12),
          ),
          SizedBox(height: 20),

          SizedBox(height: 160),
          SizedBox(
            height: 200,
            child: Stack(
              children: [
                CustomDatePickerWidget(provider: provider),

                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    height: 60,
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
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          ConstColors.lightScafoldColor.withOpacity(.5),
                          ConstColors.lightScafoldColor,
                        ],
                      ),
                    ),
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
