import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import '../widgets/cudtom_textformfield.dart';
import '../widgets/custom_button.dart';
import '../widgets/snackBar.dart';
import 'ChatPage.dart';
import 'LoginPage.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> formkey = GlobalKey();
  String? email, password;
  bool load = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: load,
      child: Scaffold(
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
                      "Chat App",
                      style: TextStyle(color: kPrimaryColor, fontSize: 30),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      width: double.infinity,
                      child: Text(
                        "Registration",
                        style: TextStyle(fontSize: 30, color: kPrimaryColor),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                        x: false,
                        onchanged: (data) {
                          email = data;
                        },
                        hintText: "Email"),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextFormField(
                        x: true,
                        onchanged: (data) {
                          password = data;
                        },
                        hintText: "Password"),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomButtom(
                      ontap: () async {
                        if (formkey.currentState!.validate()) {
                          try {
                            load = true;
                            setState(() {});
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: email!, password: password!);
                            Navigator.pushAndRemoveUntil<void>(
                              context,
                              MaterialPageRoute<void>(
                                  builder: (BuildContext context) => ChatPage(
                                        email: email,
                                      )),
                              (Route<dynamic> route) => false,
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              showSnackBar(context,
                                  'The password provided is too weak.');
                              print('The password provided is too weak.');
                            } else if (e.code ==
                                'email-already-in-usewrong-password') {
                              showSnackBar(context,
                                  'The account already exists for that email.');
                              print(
                                  'The account already exists for that email.');
                            } else {
                              showSnackBar(
                                  context, 'Error while adding new account');
                              print(e);
                            }
                          }
                          load = false;
                          setState(() {});
                        }
                      },
                      text: "Sign up",
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "oleady have an account ",
                          style: TextStyle(
                              color: kSecondColor, fontWeight: FontWeight.bold),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context, MaterialPageRoute(
                              builder: (context) {
                                return const LoginPage();
                              },
                            ));
                          },
                          child: const Text(
                            "Log in ",
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
        ),
      ),
    );
  }
}
