import 'package:flutter/material.dart';
import 'package:neutria/data/choioce_options/enums/gender_enum.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:provider/provider.dart';

class ChooseGoadScreen extends StatelessWidget {
  const ChooseGoadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChooseOptionProvider>(
      builder: (context, provider, child) => Column(
        mainAxisAlignment: .center,
        children: [
          Text(
            'Choose your Gender',
            style: TextStyle(fontWeight: .w600, fontSize: 24),
          ),
          Text(
            'It will be used to calibrate your custom plan.',
            style: TextStyle(fontWeight: .w400, fontSize: 12),
          ),
          SizedBox(height: 160),
          ElevatedButton(
            onPressed: () {
              provider.chooseGender(GenderEnum.male);
            },
            style:
                provider.getGenderChoose == null ||
                    provider.getGenderChoose == GenderEnum.female
                ? Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    foregroundColor: WidgetStatePropertyAll(Colors.black),
                  )
                : null,
            child: const Text(
              'Male',
              style: TextStyle(fontWeight: .w500, fontSize: 16),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              provider.chooseGender(GenderEnum.female);
            },
            style:
                provider.getGenderChoose == null ||
                    provider.getGenderChoose == GenderEnum.male
                ? Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    foregroundColor: WidgetStatePropertyAll(Colors.black),
                  )
                : null,
            child: const Text(
              'Female',
              style: TextStyle(fontSize: 16, fontWeight: .w500),
            ),
          ),
        ],
      ),
    );
  }
}
