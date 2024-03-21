import 'package:chat_app/components/chat_bubble.dart';
import 'package:chat_app/constance/constance.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  static String routeName = 'ChatPage';
  TextEditingController controller = TextEditingController();

  ChatPage({super.key});
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference message =
      FirebaseFirestore.instance.collection(kMessageCollection);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: KPrimaryColor,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                KLogo,
                height: 50,
              ),
              const Text(
                'Chat ',
                style: TextStyle(color: Colors.white, fontFamily: 'Pacifico'),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemBuilder: (_, index) => ChatBubble(),
                itemCount: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: controller,
                onSubmitted: (data) {
                  message.add({'message': data});
                  controller.clear();
                },
                decoration: InputDecoration(
                    border: OutlineInputBorder(), suffixIcon: Icon(Icons.send)),
              ),
            )
          ],
        ));
  }
}
