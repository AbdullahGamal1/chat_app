import 'package:chat_app/constance/constance.dart';

class Message {
  final String message;

  Message(this.message);

  factory Message.fromJson(jsonData) {
    return Message(jsonData[KMessage]);
  }
}
