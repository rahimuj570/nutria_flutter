import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:neutria/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    value,
  ) {
    runApp(const Neutria());
  });
}
