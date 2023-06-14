import 'package:flutter/material.dart';

import '../constants.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({super.key, this.ontap, required this.text});
  final void Function()? ontap;
  final String text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.white,
        ),
        height: 50,
        width: double.infinity,
        child: Center(
            child: Text(
          text,
          style: const TextStyle(color: kPrimaryColor, fontSize: 20),
        )),
      ),
    );
  }
}
