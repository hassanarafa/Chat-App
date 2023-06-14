import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import '../widgets/cudtom_textformfield.dart';
import '../widgets/custom_button.dart';
import 'HomePage.dart';
import 'RegisterPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> formkey = GlobalKey();
  String? email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            toolbarHeight: 0,
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.white,
            )),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formkey,
                child: Column(
                  children: [
                    Container(
                        width: 200, height: 200, child: Image.asset(logo)),
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Scholar Chat",
                      style: TextStyle(color: kPrimaryColor, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Sign In",
                        style: TextStyle(fontSize: 30, color: kPrimaryColor),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                        onchanged: (data) {
                          email = data;
                        },
                        hintText: "Email"),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                        onchanged: (data) {
                          password = data;
                        },
                        hintText: "Password"),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomButtom(
                      text: "Sign in",
                      ontap: () async {
                        if (formkey.currentState!.validate()) {
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email: email!, password: password!);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(),
                                ));
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'No user found for that email.')));
                              print('No user found for that email.');
                            } else if (e.code == 'wrong-password') {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text(
                                          'Wrong password provided for that user.')));
                              print('Wrong password provided for that user.');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Error')));
                              print(e);
                            }
                          }
                        }
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "don't have an account ",
                          style: TextStyle(
                              color: kSecondColor, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return RegisterPage();
                              },
                            ));
                          },
                          child: const Text(
                            "Sign Up ",
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
