import 'package:chatapp/models/messagemodel.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class chatbubble_me extends StatelessWidget {
  const chatbubble_me({
    super.key,
    required this.message,
  });
  final Message message;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                  topRight: Radius.circular(15))),
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              message.textmessage,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
