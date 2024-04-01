import 'package:flutter/material.dart';
import 'package:login_datastorage/home_screen/home_screen.dart';
import 'package:login_datastorage/registration_screen/registration_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController pass = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
                key: formKey,
                child: Column(
                  children: [
                    Text("Welcome back",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 35)),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Sign in to your account",
                      style: TextStyle(
                          color: Colors.black.withOpacity(.4),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          filled: true,
                          hintText: "Email",
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(.4),
                          )),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      controller: pass,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          filled: true,
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(.4),
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Spacer(),
                        TextButton(
                            onPressed: () {},
                            child: Text("Forgot password?",
                                style: TextStyle(
                                  color: Colors.black.withOpacity(.5),
                                )))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    InkWell(
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          SharedPreferences data =
                              await SharedPreferences.getInstance();
                          String? savedEmail = data.getString("email");
                          String? savedPassw = data.getString("password");
                          String enteredname = name.text;
                          String enteredpass = pass.text;

                          if (savedEmail == enteredname &&
                              savedPassw == enteredpass) {
                            data.setBool("isLogged", true);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ));
                          }
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 15),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10)),
                        child: Center(
                            child: Text("LOGIN",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15))),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            endIndent: 15,
                          ),
                        ),
                        Text("Or continue with",
                            style: TextStyle(
                              color: Colors.black.withOpacity(.5),
                            )),
                        Expanded(
                            child: Divider(
                          indent: 15,
                        ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        InkWell(
                          child: Container(
                            height: 50,
                            width: 160,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Icon(
                              Icons.g_mobiledata_rounded,
                              color: Colors.white,
                              size: 35,
                            )),
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          child: Container(
                            height: 50,
                            width: 160,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Icon(
                              Icons.facebook,
                              color: Colors.white,
                            )),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Not A Member?"),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RegistrationScreen(),
                    ));
              },
              child: Text("Join Now", style: TextStyle(color: Colors.amber)))
        ],
      ),
    );
  }
}
