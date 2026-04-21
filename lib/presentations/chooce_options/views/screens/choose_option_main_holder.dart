import 'package:flutter/material.dart';
import 'package:neutria/app/services/net_checker_service.dart';
import 'package:neutria/presentations/auth/view/screens/login_screen.dart';
import 'package:neutria/presentations/chooce_options/viewmodels/choose_option_provider.dart';
import 'package:neutria/presentations/common/view/screens/net_error_screen.dart';
import 'package:provider/provider.dart';

class ChooseOptionMainHolder extends StatefulWidget {
  static const name = 'ChooseOptionMainHoldermainHolder_choose_option';

  const ChooseOptionMainHolder({super.key});

  @override
  State<ChooseOptionMainHolder> createState() => _ChooseOptionMainHolderState();
}

class _ChooseOptionMainHolderState extends State<ChooseOptionMainHolder> {
  void _goNextPhase() async {
    bool isOnline = await NetCheckerService().isConnectedWithInternet();
    if (isOnline) {
      Navigator.pushNamed(context, LoginScreen.name);
    } else {
      Navigator.pushNamed(context, NetErrorScreen.name);
    }
  }

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
                  Visibility(
                    visible: provider.getIndex != 15,

                    child: LayoutBuilder(
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
                  ),
                  SizedBox(height: 48),
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
            onPressed: provider.getIndex == 15
                ? _goNextPhase
                : provider.getIsNextBtnDisabled
                ? null
                : provider.onClickNext,
            child: Text(
              provider.getIndex == 14
                  ? "Develop your plan"
                  : provider.getIndex == 15
                  ? "Let's Begin!"
                  : "Next",
            ),
          ),
        ),
      ),
    );
  }
}
