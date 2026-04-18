import 'package:flutter/material.dart';

class ChooseCountryScreen extends StatelessWidget {
  const ChooseCountryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Enter your country name',
          style: TextStyle(fontSize: 20, fontWeight: .w600),
        ),
      ],
    );
  }
}
