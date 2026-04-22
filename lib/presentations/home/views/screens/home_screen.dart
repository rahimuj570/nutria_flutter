import 'package:flutter/material.dart';
import 'package:neutria/presentations/common/view/screens/custom_app_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBarWidget(title: 'Cal Z'),
      body: Container(color: Colors.red, height: .maxFinite),
    );
  }
}
