import 'package:flutter/material.dart';
import 'package:neutria/app/const_colors.dart';
import 'package:neutria/data/choioce_options/enums/weight_enum.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:neutria/presentations/chooce_options/views/widgets/two_option_group_tab_widget.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ChooseWeightScreen extends StatelessWidget {
  const ChooseWeightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController weightTEC = TextEditingController();
    weightTEC.text = context.read<ChooseOptionProvider>().getWeight == null
        ? ''
        : context.read<ChooseOptionProvider>().getWeight.toString();
    return Consumer<ChooseOptionProvider>(
      builder: (context, provider, child) => Column(
        crossAxisAlignment: .start,
        mainAxisAlignment: .center,
        children: [
          Text(
            'Enter your weight',
            style: TextStyle(fontWeight: .w600, fontSize: 24),
          ),
          SizedBox(height: 8),
          Text(
            'This will be utilized to adjust your tailored plan?',
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
              fun1: () => provider.chooseWeightUnit(WeightEnum.kg),
              fun2: () => provider.chooseWeightUnit(WeightEnum.pound),
              title1: 'Kilograms',
              title2: 'Pounds',
              fun1Selected: provider.getWeightEnum == WeightEnum.kg,
            ),
          ),

          SizedBox(height: 70),

          SfRadialGauge(
            axes: <RadialAxis>[
              RadialAxis(
                minimum: 0,
                maximum: provider.getWeightEnum == WeightEnum.kg
                    ? 180
                    : (180 * 2.20462),
                interval: 20,
                pointers: <GaugePointer>[
                  NeedlePointer(
                    value: provider.getWeightEnum == WeightEnum.kg
                        ? provider.getWeight ?? 0
                        : ((provider.getWeight ?? 0) * 2.20462),
                  ),
                ],
                annotations: <GaugeAnnotation>[
                  GaugeAnnotation(
                    widget: Text(
                      '${provider.getWeightEnum == WeightEnum.kg ? provider.getWeight ?? 0 : ((provider.getWeight ?? 0) * 2.20462).toStringAsFixed(2)} ${provider.getWeightEnum.name}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    angle: 90,
                    positionFactor: 0.9,
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: .center,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: .only(
                    topLeft: .circular(8),
                    bottomLeft: .circular(8),
                  ),
                  boxShadow: [BoxShadow(color: Colors.black, blurRadius: 1)],
                ),
                padding: .all(10),
                child: Text(
                  'Weight:',
                  style: TextStyle(fontSize: 16, fontWeight: .w500),
                ),
              ),
              SizedBox(
                width: 120,
                height: 45,
                child: TextField(
                  keyboardType: .number,
                  controller: weightTEC,
                  decoration: InputDecoration(
                    hintText: 'Enter here',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: .w500,
                      color: Colors.grey.shade400,
                    ),
                    fillColor: ConstColors.lightBoderColor,
                    border: OutlineInputBorder(
                      borderRadius: .only(
                        topLeft: .circular(0),
                        topRight: .circular(8),
                        bottomLeft: .circular(0),
                        bottomRight: .circular(8),
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    provider.chooseWeight(double.parse(value));
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
