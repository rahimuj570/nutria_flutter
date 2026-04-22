import 'package:flutter/material.dart';
import 'package:neutria/app/app_assets_path.dart';
import 'package:neutria/presentations/auth/view/screens/forgot_password_verification_screen_1.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static const String name = 'forgot_pass';
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Forgot Password'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 34),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: .circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(AppAssetsPath.forgotPass),
                    SizedBox(width: 25),
                    Column(
                      crossAxisAlignment: .start,
                      children: [
                        Text(
                          'By email',
                          style: TextStyle(fontSize: 14, fontWeight: .w500),
                        ),
                        Text(
                          '*****sajbkla@*****',
                          style: TextStyle(fontSize: 12, fontWeight: .w500),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'We will sent a email to verify.....',
              style: TextStyle(fontSize: 12, fontWeight: .w500),
            ),
            SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  ForgotPasswordVerificationScreen1.name,
                );
              },
              child: Text('Continue'),
            ),
          ],
        ),
      ),
    );
  }
}
