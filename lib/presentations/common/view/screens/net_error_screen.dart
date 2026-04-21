import 'package:flutter/material.dart';
import 'package:neutria/app/app_assets_path.dart';
import 'package:neutria/app/services/net_checker_service.dart';

class NetErrorScreen extends StatelessWidget {
  static String name = "net_error_screen";
  const NetErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Image.asset(AppAssetsPath.netError),
            SizedBox(height: 14),
            Text(
              'No Internet connection!!',
              style: TextStyle(fontSize: 20, fontWeight: .w600),
            ),
            SizedBox(height: 4),
            Text(
              'Please check your connection.',
              style: TextStyle(fontSize: 12, fontWeight: .w500),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 50.0, left: 30, right: 30),
        child: ElevatedButton(
          onPressed: () async {
            print(await NetCheckerService().isConnectedWithInternet());
          },
          child: Text('Try again'),
        ),
      ),
    );
  }
}
