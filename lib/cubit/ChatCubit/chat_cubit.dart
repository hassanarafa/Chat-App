import 'package:bloc/bloc.dart';
import 'package:chatapp/models/messagemodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../constants.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  final CollectionReference messages =
      FirebaseFirestore.instance.collection(kCollection);
  List<Message> messagelist = [];

  void sendMessage({required String message, required String email}) {
    try {
      messages.add({
        'message': message,
        'CreatedAt': DateTime.now(),
        "id": email,
      });
    } catch (e) {}
  }

  void getmessage() {
    messages.orderBy('CreatedAt', descending: true).snapshots().listen((event) {
      messagelist.clear();
      for (var doc in event.docs) {
        messagelist.add(Message.fromjson(doc));
      }
      emit(ChatSuccess(messages: messagelist));
    });
  }
}
