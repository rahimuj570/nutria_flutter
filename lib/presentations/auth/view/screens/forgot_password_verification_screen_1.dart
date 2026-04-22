import 'dart:async';

import 'package:flutter/material.dart';
import 'package:neutria/app/const_colors.dart';

class ForgotPasswordVerificationScreen1 extends StatefulWidget {
  static const String name = 'forgot_pass_verification1';
  const ForgotPasswordVerificationScreen1({super.key});

  @override
  State<ForgotPasswordVerificationScreen1> createState() =>
      _ForgotPasswordVerificationScreen1State();
}

class _ForgotPasswordVerificationScreen1State
    extends State<ForgotPasswordVerificationScreen1> {
  int second = 30;
  Timer? _timer;
  void startCountDown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (second == 1) {
          timer.cancel();
        }
        second--;
      });
    });
  }

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      startCountDown();
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Verification'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 34),
        child: Column(
          crossAxisAlignment: .center,

          children: [
            Text(
              'We have sent you an activation email.',
              style: TextStyle(fontSize: 14, fontWeight: .w500),
            ),
            SizedBox(height: 22),
            Text(
              'An email has been sent to your *****sajbkla@***** containing a code to activate your account',
              textAlign: .center,
              style: TextStyle(
                fontSize: 12,
                color: ConstColors.lightGreyTextColor,
              ),
            ),
            SizedBox(height: 8),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: ConstColors.lightGreyTextColor,
                  fontSize: 12,
                ),
                text: 'Wait for a while if you didn’t get code',
                children: [
                  TextSpan(
                    text: ' 00:${second.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: .bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: second != 0
                  ? null
                  : () {
                      setState(() {
                        second = 30;
                        startCountDown();
                      });
                    },
              child: Text(
                'Resend',
                style: TextStyle(fontSize: 12, fontWeight: .bold),
              ),
            ),
            SizedBox(height: 20),
            FilledButton(onPressed: () {}, child: Text('Continue')),
          ],
        ),
      ),
    );
  }
}
