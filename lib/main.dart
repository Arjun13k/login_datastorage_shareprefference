import 'package:flutter/material.dart';
import 'package:login_datastorage/spalsh_screen/splash_screen.dart';

void main() {
  runApp(DataLogin());
}

class DataLogin extends StatelessWidget {
  const DataLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
