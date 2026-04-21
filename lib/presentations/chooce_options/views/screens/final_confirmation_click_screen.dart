import 'package:flutter/material.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:provider/provider.dart';

class FinalConfirmationClickScreen extends StatelessWidget {
  const FinalConfirmationClickScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ChooseOptionProvider>(
      builder: (context, provider, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          children: [
            SizedBox(height: 190),
            Row(
              mainAxisAlignment: .center,
              children: [
                Icon(Icons.check_circle_rounded, size: 22),
                SizedBox(width: 1),
                Text(
                  'All set',
                  style: TextStyle(fontSize: 14, fontWeight: .w500),
                ),
              ],
            ),
            SizedBox(height: 14),
            Text(
              'Thank you for your confidence in us.',
              textAlign: .center,
              style: TextStyle(fontWeight: .w600, fontSize: 24),
            ),
            SizedBox(height: 70),
            Text(
              'Your privacy and security are our top priorities',
              textAlign: .center,
            ),
          ],
        ),
      ),
    );
  }
}
