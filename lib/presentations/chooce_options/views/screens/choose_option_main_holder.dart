import 'package:flutter/material.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:provider/provider.dart';

class ChooseOptionMainHolder extends StatefulWidget {
  static const name = 'ChooseOptionMainHoldermainHolder_choose_option';

  const ChooseOptionMainHolder({super.key});

  @override
  State<ChooseOptionMainHolder> createState() => _ChooseOptionMainHolderState();
}

class _ChooseOptionMainHolderState extends State<ChooseOptionMainHolder> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ChooseOptionProvider>(
      builder: (context, provider, child) => Scaffold(
        body: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            provider.onClickBack();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsetsGeometry.symmetric(horizontal: 32),
              child: Column(
                mainAxisAlignment: .center,
                children: [
                  SizedBox(height: 50),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: provider.onClickBack,
                        child: Icon(Icons.arrow_back, color: Colors.black),
                      ),
                      SizedBox(width: 10),
                      Text('Back'),
                    ],
                  ),
                  SizedBox(height: 10),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double barWidth = constraints.maxWidth;
                      double dotX = barWidth * provider.getCurrentProgress;

                      return Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SizedBox(
                            height: 5,
                            child: LinearProgressIndicator(
                              value: provider.getCurrentProgress,
                              backgroundColor: Colors.grey[300],
                              color: Colors.black,
                              borderRadius: .circular(5),
                            ),
                          ),

                          // Dot marker floating above
                          Positioned(
                            left: dotX - 8,
                            top: -6,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(height: 30),
                  provider.getScreen,
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 60),
          child: ElevatedButton(
            onPressed: provider.getIsNextBtnDisabled
                ? null
                : provider.onClickNext,
            child: const Text("Next"),
          ),
        ),
      ),
    );
  }
}
