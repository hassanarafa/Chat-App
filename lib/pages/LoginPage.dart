import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import '../widgets/cudtom_textformfield.dart';
import '../widgets/custom_button.dart';
import 'RegisterPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
              child: Column(
                children: [
                  Container(
                      width: 200,
                      height: 200,
                      child: Image.asset("assets/images/logo.png")),
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
                  CustomTextFormField(hintText: "Email"),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormField(hintText: "Password"),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomButtom(
                    text: "Sign in",
                    ontap: () {},
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
        ));
  }
}
