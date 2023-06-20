import 'package:chatapp/widgets/chatbubble_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../constants.dart';
import '../cubit/ChatCubit/chat_cubit.dart';
import '../widgets/chatbubble_me.dart';

class ChatPage extends StatelessWidget {
  ChatPage({required this.email, super.key});

  final controller = ScrollController();
  final String? email;

  final TextEditingController Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(logo),
              )
            ],
            backgroundColor: Colors.white,
            title: Text(
              "ChatApp",
              style: TextStyle(color: kPrimaryColor),
            ),
            elevation: 0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarIconBrightness: Brightness.dark,
              statusBarColor: Colors.white,
            )),
        body: Column(
          children: [
            Expanded(
              child: BlocConsumer<ChatCubit, ChatState>(
                listener: (context, state) {
                  if (state is ChatSuccess) {}
                },
                builder: (context, state) {
                  var messagelist =
                      BlocProvider.of<ChatCubit>(context).messagelist;

                  return ListView.builder(
                      reverse: true,
                      controller: controller,
                      itemCount: messagelist.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) =>
                          (messagelist[index].id == email)
                              ? chatbubble_me(message: messagelist[index])
                              : chatbubble_user(message: messagelist[index]));
                },
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: Controller,
                  decoration: InputDecoration(
                      hintText: "Send Message",
                      suffixIcon: IconButton(
                          onPressed: () {
                            if (Controller.text != "") {
                              BlocProvider.of<ChatCubit>(context).sendMessage(
                                  email: email!, message: Controller.text);
                              Controller.clear();
                              controller.animateTo(0,
                                  duration: Duration(milliseconds: 10),
                                  curve: Curves.easeOutQuint);
                            }
                          },
                          icon: Icon(Icons.send)),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: kPrimaryColor),
                          borderRadius: BorderRadius.circular(15))),
                  onSubmitted: (value) {
                    if (Controller.text != "") {
                      BlocProvider.of<ChatCubit>(context)
                          .sendMessage(email: email!, message: value);
                      Controller.clear();
                      controller.animateTo(0,
                          duration: Duration(milliseconds: 10),
                          curve: Curves.easeOutQuint);
                    }
                  },
                ),
              ),
            )
          ],
        ));
  }
}
