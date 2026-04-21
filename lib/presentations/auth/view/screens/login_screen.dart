import 'package:flutter/material.dart';
import 'package:neutria/app/app_assets_path.dart';
import 'package:neutria/app/const_colors.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login_screen';
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  Text(
                    'Let’s follow Cal Z',
                    style: TextStyle(fontSize: 22, fontWeight: .w500),
                  ),
                  Text(
                    'Eat healthy, Stay healthy',
                    style: TextStyle(fontSize: 12, fontWeight: .w300),
                  ),
                  SizedBox(height: 44),
                  Image.asset(AppAssetsPath.loginHero),
                  SizedBox(height: 45),
                  Text(
                    'Login',
                    style: TextStyle(fontSize: 30, fontWeight: .bold),
                  ),
                  Text(
                    'Login to your account',
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
                          decoration: InputDecoration(
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.lock),
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Transform.scale(
                              scale: .8,
                              child: Checkbox(
                                value: true,
                                fillColor: WidgetStatePropertyAll(Colors.black),
                                onChanged: (value) {},
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
                            Spacer(),
                            Text(
                              'Forgot Password?',
                              style: TextStyle(
                                color: ConstColors.lightGreyTextColor,
                                fontWeight: .w600,
                                fontSize: 12,
                              ),
                            ),
                          ],
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
    );
  }
}
