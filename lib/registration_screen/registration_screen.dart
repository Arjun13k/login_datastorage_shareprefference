import 'package:flutter/material.dart';
import 'package:login_datastorage/home_screen/home_screen.dart';
import 'package:login_datastorage/login_screen/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController email = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Text("Sign up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 35)),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Create a account",
                        style: TextStyle(
                            color: Colors.black.withOpacity(.4),
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: username,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none),
                          filled: true,
                          hintText: "Username",
                          labelText: "Username",
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(.4),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value == "") {
                            return "Username is empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: email,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            filled: true,
                            hintText: "Email",
                            labelText: "Email",
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(.4),
                            )),
                        validator: (value) {
                          if (value == null || value == "") {
                            return "Email is empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        controller: password,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide.none),
                            filled: true,
                            hintText: "Password",
                            labelText: "Password",
                            labelStyle: TextStyle(fontWeight: FontWeight.bold),
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(.4),
                            )),
                        validator: (value) {
                          if (value == null || value == "") {
                            return "password is empty";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          if (formKey.currentState!.validate()) {
                            SharedPreferences data =
                                await SharedPreferences.getInstance();
                            await data.setString("email", email.text);
                            await data.setString("password", password.text);
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ));
                          }
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.amber,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text("REGISTER NOW",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15))),
                        ),
                      ),
                      SizedBox(
                        height: 30,
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
                        height: 30,
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Already Have An Account"),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ));
              },
              child: Text("Log In", style: TextStyle(color: Colors.amber)))
        ],
      ),
    );
  }
}
