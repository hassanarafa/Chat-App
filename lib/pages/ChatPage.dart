import 'package:chatapp/models/messagemodel.dart';
import 'package:chatapp/widgets/chatbubble_user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../constants.dart';
import '../widgets/chatbubble_me.dart';

class ChatPage extends StatelessWidget {
  ChatPage({required this.email, super.key});

  final controller = ScrollController();
  final String? email;
  final CollectionReference messages =
      FirebaseFirestore.instance.collection(kCollection);

  final TextEditingController Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy('CreatedAt', descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagelist = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagelist.add(Message.fromjson(snapshot.data!.docs[i]));
          }
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
                    child: ListView.builder(
                        reverse: true,
                        controller: controller,
                        itemCount: messagelist.length,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            (messagelist[index].id == email)
                                ? chatbubble_me(message: messagelist[index])
                                : chatbubble_user(message: messagelist[index])),
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
                                    messages.add({
                                      'message': Controller.text,
                                      'CreatedAt': DateTime.now(),
                                      "id": email,
                                    });
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
                            messages.add({
                              'message': value,
                              'CreatedAt': DateTime.now(),
                              "id": email,
                            });
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
        } else {
          return Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
            color: kPrimaryColor,
          )));
        }
      },
    );
  }
}
