import 'package:flutter/material.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';

class TwoOptionGroupTabWidget extends StatelessWidget {
  final ChooseOptionProvider provider;
  final VoidCallback fun1;
  final VoidCallback fun2;
  final String title1;
  final String title2;
  final bool fun1Selected;
  const TwoOptionGroupTabWidget({
    super.key,
    required this.provider,
    required this.fun1,
    required this.fun2,
    required this.title1,
    required this.title2,
    required this.fun1Selected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: FilledButton(
            style: FilledButton.styleFrom(
              padding: .symmetric(vertical: 4),
              backgroundColor: fun1Selected == false
                  ? Colors.transparent
                  : null,
              foregroundColor: fun1Selected == false
                  ? Colors.black
                  : Colors.white,
            ),
            onPressed: fun1,
            child: Text(
              title1,
              style: TextStyle(fontWeight: .w600, fontSize: 14),
            ),
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: FilledButton(
            style: FilledButton.styleFrom(
              padding: .symmetric(vertical: 4),
              backgroundColor: fun1Selected == true ? Colors.transparent : null,
              foregroundColor: fun1Selected == true
                  ? Colors.black
                  : Colors.white,
            ),
            onPressed: fun2,
            child: Text(
              title2,
              style: TextStyle(fontWeight: .w600, fontSize: 14),
            ),
          ),
        ),
      ],
    );
  }
}
