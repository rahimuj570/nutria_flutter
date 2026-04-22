import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:neutria/app/const_colors.dart';
import 'package:neutria/presentations/auth/view/screens/login_screen.dart';

class ForgotPasswordVerificationScreen3 extends StatefulWidget {
  static const String name = 'forgot_pass_verification3';
  const ForgotPasswordVerificationScreen3({super.key});

  @override
  State<ForgotPasswordVerificationScreen3> createState() =>
      _ForgotPasswordVerificationScreen3State();
}

class _ForgotPasswordVerificationScreen3State
    extends State<ForgotPasswordVerificationScreen3> {
  bool _firstInputObsecure = true;
  bool _secondInputObsecure = true;
  TextEditingController _firstObsecureTEC = TextEditingController();
  TextEditingController _secondObsecureTEC = TextEditingController();

  @override
  void dispose() {
    _firstObsecureTEC.dispose();
    _secondObsecureTEC.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(title: Text('Verification'), centerTitle: true),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 34),
          child: Column(
            crossAxisAlignment: .center,

            children: [
              Form(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      'New Password *',
                      style: TextStyle(fontSize: 13, fontWeight: .w500),
                    ),
                    SizedBox(height: 4),
                    TextFormField(
                      controller: _firstObsecureTEC,
                      obscureText: _firstInputObsecure,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                          onTap: () => setState(() {
                            _firstInputObsecure = !_firstInputObsecure;
                          }),
                          child: Icon(
                            _firstInputObsecure
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 14),
                    Text(
                      'Confirm New Password *',
                      style: TextStyle(fontSize: 13, fontWeight: .w500),
                    ),
                    SizedBox(height: 4),
                    TextFormField(
                      controller: _secondObsecureTEC,
                      obscureText: _secondInputObsecure,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: GestureDetector(
                          onTap: () => setState(() {
                            _secondInputObsecure = !_secondInputObsecure;
                          }),
                          child: Icon(
                            _firstInputObsecure
                                ? Icons.remove_red_eye
                                : Icons.remove_red_eye_outlined,
                          ),
                        ),
                      ),
                      onChanged: (value) => setState(() {}),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14),
              FilledButton(
                onPressed:
                    _secondObsecureTEC.text.isEmpty ||
                        _firstObsecureTEC.text != _secondObsecureTEC.text
                    ? null
                    : () {
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          LoginScreen.name,
                          (route) => false,
                        );
                      },
                child: Text('Save Password'),
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
      ),
    );
  }
}
