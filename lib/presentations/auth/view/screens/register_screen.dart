import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:neutria/app/app_assets_path.dart';
import 'package:neutria/app/const_colors.dart';
import 'package:neutria/presentations/auth/view/screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String name = 'register_screen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isCheck = false;
  bool isPassHidden = true;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  mainAxisAlignment: .center,
                  crossAxisAlignment: .center,
                  children: [
                    Image.asset(AppAssetsPath.registerHero),
                    SizedBox(height: 45),
                    Text(
                      'Sign up',
                      style: TextStyle(fontSize: 30, fontWeight: .bold),
                    ),
                    Text(
                      'Create your new account',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: .w600,
                        color: ConstColors.lightGreyTextColor,
                      ),
                    ),
                    SizedBox(height: 50),
                    Form(
                      child: Column(
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'user@mail.com',
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          SizedBox(height: 17),
                          TextFormField(
                            obscureText: isPassHidden,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              prefixIcon: Icon(Icons.lock),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isPassHidden = !isPassHidden;
                                  });
                                },
                                child: Icon(
                                  isPassHidden
                                      ? Icons.remove_red_eye
                                      : Icons.remove_red_eye_outlined,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Row(
                            children: [
                              Transform.scale(
                                scale: .8,
                                child: Checkbox(
                                  value: isCheck,
                                  fillColor: WidgetStatePropertyAll(
                                    Colors.black,
                                  ),
                                  onChanged: (value) {
                                    setState(() {
                                      isCheck = value!;
                                    });
                                  },
                                  materialTapTargetSize: .shrinkWrap,
                                ),
                              ),
                              Text(
                                'Remember me',
                                style: TextStyle(
                                  color: ConstColors.lightGreyTextColor,
                                  fontWeight: .w600,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 48),
                          FilledButton(onPressed: () {}, child: Text('Create')),
                          SizedBox(height: 8),
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
                                      Navigator.pushNamed(
                                        context,
                                        LoginScreen.name,
                                      );
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
