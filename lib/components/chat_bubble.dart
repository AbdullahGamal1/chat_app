import 'package:chat_app/models/message.dart';
import 'package:flutter/material.dart';

import '../constance/constance.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({required this.message, super.key});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            color: KPrimaryColor,
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(32),
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            message.message,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
