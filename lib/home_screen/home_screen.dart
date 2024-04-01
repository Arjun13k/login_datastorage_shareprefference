import 'package:flutter/material.dart';
import 'package:login_datastorage/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 100),
          children: [
            InkWell(
              onTap: () async {
                SharedPreferences data = await SharedPreferences.getInstance();
                data.setBool("isLogged", false);
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              child: Container(
                  width: double.infinity,
                  height: 40,
                  child: Text(
                    "Log out",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            )
          ],
        ),
      ),
      body: Center(
        child: Text(
          "Welcome Back",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
        ),
      ),
    );
  }
}
