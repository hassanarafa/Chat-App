import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants.dart';
import '../cubit/RegisterCubit/register_cubit.dart';
import '../widgets/cudtom_textformfield.dart';
import '../widgets/custom_button.dart';
import '../widgets/snackBar.dart';
import 'ChatPage.dart';
import 'LoginPage.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formkey = GlobalKey();
    String? email, password;
    bool load = false;
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterCubitLoading) {
          load = true;
        } else if (state is RegisterCubitSuccess) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute<void>(
                builder: (BuildContext context) => ChatPage(
                      email: email,
                    )),
            (Route<dynamic> route) => false,
          );
          load = false;
        } else if (state is RegisterCubitFailure) {
          showSnackBar(context, state.errorMessage);
          load = false;
        }
      },
      builder: (context, state) {
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
                            style:
                                TextStyle(fontSize: 30, color: kPrimaryColor),
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
                              BlocProvider.of<RegisterCubit>(context)
                                  .Register(email: email!, password: password!);
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
                                  color: kSecondColor,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context, MaterialPageRoute(
                                  builder: (context) {
                                    return LoginPage();
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
      },
    );
  }
}
