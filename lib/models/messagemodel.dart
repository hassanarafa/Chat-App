import '../constants.dart';

class Message {
  final String textmessage;
  final String id;

  Message(this.textmessage, this.id);

  factory Message.fromjson(jsonData) {
    return Message(jsonData[kMessage], jsonData['id']);
  }
}
