import 'dart:async';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:neutria/app/const_colors.dart';
import 'package:neutria/presentations/auth/view/screens/forgot_password_verification_screen_1.dart';
import 'package:neutria/presentations/auth/view/screens/forgot_password_verification_screen_3.dart';
import 'package:neutria/presentations/auth/view/screens/login_screen.dart';
import 'package:pinput/pinput.dart';

class ForgotPasswordVerificationScreen2 extends StatefulWidget {
  static const String name = 'forgot_pass_verification2';
  const ForgotPasswordVerificationScreen2({super.key});

  @override
  State<ForgotPasswordVerificationScreen2> createState() =>
      _ForgotPasswordVerificationScreen2State();
}

class _ForgotPasswordVerificationScreen2State
    extends State<ForgotPasswordVerificationScreen2> {
  int second = 30;
  Timer? _timer;
  bool isComplete = false;
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
  void dispose() {
    if (_timer != null && _timer!.isActive) {
      _timer!.cancel();
    }
    // TODO: implement dispose
    super.dispose();
  }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600,
    ),
    decoration: BoxDecoration(
      shape: .circle,
      border: Border.all(color: ConstColors.lightBoderColor),
    ),
  );

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
              'We have sent you an activation code.',
              style: TextStyle(fontSize: 14, fontWeight: .w500),
            ),
            SizedBox(height: 11),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'A SMS has been sent to your phone number containing a code to activate your account',
                textAlign: .center,
                style: TextStyle(
                  fontSize: 12,
                  color: ConstColors.lightGreyTextColor,
                ),
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Enter verification code',
              style: TextStyle(fontSize: 16, fontWeight: .bold),
            ),
            SizedBox(height: 17),
            Pinput(
              obscureText: true,
              obscuringWidget: Center(
                child: Text('*', style: TextStyle(fontSize: 30)),
              ),

              defaultPinTheme: defaultPinTheme,
              validator: (s) {
                return s == '1111' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => {
                if (pin == '1111')
                  {
                    setState(() {
                      isComplete = true;
                    }),
                  },
              },
            ),
            SizedBox(height: 26),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: ConstColors.lightGreyTextColor,
                  fontSize: 12,
                ),
                text: 'if you didn’t receive a code! ',
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacementNamed(
                          context,
                          ForgotPasswordVerificationScreen1.name,
                        );
                      },
                    text: ' click here.',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: .bold,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: ConstColors.lightGreyTextColor,
                  fontSize: 12,
                ),
                text: 'Code will expire soon.',
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

            SizedBox(height: 14),
            FilledButton(
              onPressed: isComplete == false
                  ? null
                  : () {
                      Navigator.pushNamed(
                        context,
                        ForgotPasswordVerificationScreen3.name,
                      );
                    },
              child: Text('Continue'),
            ),
            SizedBox(height: 14),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: .w500,
                  color: ConstColors.lightGreyTextColor,
                ),
                text: 'Already have an account?',
                children: [
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, LoginScreen.name);
                      },
                    text: '  Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: .w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
