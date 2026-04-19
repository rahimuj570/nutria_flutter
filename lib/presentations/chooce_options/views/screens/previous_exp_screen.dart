import 'package:flutter/material.dart';
import 'package:neutria/data/choioce_options/enums/previous_exp_enum.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:provider/provider.dart';

class PreviousExpScreen extends StatelessWidget {
  const PreviousExpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChooseOptionProvider>(
      builder: (context, provider, child) => Column(
        mainAxisAlignment: .center,
        children: [
          Text(
            'Have you Tried any other calorie tracking app?',
            style: TextStyle(fontWeight: .w600, fontSize: 24),
          ),

          SizedBox(height: 160),
          ElevatedButton(
            onPressed: () {
              provider.choosePrevoiusExp(PreviousExpEnum.yes);
            },
            style:
                provider.getPrevExp == null ||
                    provider.getPrevExp == PreviousExpEnum.no
                ? Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    foregroundColor: WidgetStatePropertyAll(Colors.black),
                  )
                : null,
            child: const Text(
              'Yes',
              style: TextStyle(fontWeight: .w500, fontSize: 16),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              provider.choosePrevoiusExp(PreviousExpEnum.no);
            },
            style:
                provider.getPrevExp == null ||
                    provider.getPrevExp == PreviousExpEnum.yes
                ? Theme.of(context).elevatedButtonTheme.style!.copyWith(
                    backgroundColor: WidgetStatePropertyAll(Colors.white),
                    foregroundColor: WidgetStatePropertyAll(Colors.black),
                  )
                : null,
            child: const Text(
              'No',
              style: TextStyle(fontSize: 16, fontWeight: .w500),
            ),
          ),
        ],
      ),
    );
  }
}
