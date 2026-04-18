import 'package:flutter/material.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:provider/provider.dart';

class ChooseCountryScreen extends StatelessWidget {
  const ChooseCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController countryTEC = TextEditingController();

    return Consumer<ChooseOptionProvider>(
      builder: (context, provider, child) {
        countryTEC.text = provider.getCountry ?? '';
        return Column(
          crossAxisAlignment: .start,
          children: [
            Text(
              'Enter your country name',
              style: TextStyle(fontSize: 20, fontWeight: .w600),
            ),
            const SizedBox(height: 144),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: countryTEC,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search name',
                    ),
                    onChanged: (value) {
                      provider.chooseCountry(value.trim());
                    },
                  ),
                ),
                SizedBox(width: 18),
                Icon(Icons.check_circle_sharp, size: 30),
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Rewrite country name please*',
              style: TextStyle(fontSize: 12, fontWeight: .w400),
            ),
          ],
        );
      },
    );
  }
}
