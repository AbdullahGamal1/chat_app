import 'package:chat_app/components/chat_bubble.dart';
import 'package:chat_app/constance/constance.dart';
import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  static String routeName = 'ChatPage';
  TextEditingController controller = TextEditingController();
  final ScrollController _myController = ScrollController();

  ChatPage({super.key});

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessageCollection);

  @override
  Widget build(BuildContext context) {
    var email = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(KCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagesList = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagesList.add(Message.fromJson(snapshot.data!.docs[i]));
          }
          ;
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
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      reverse: true,
                      controller: _myController,
                      itemBuilder: (_, index) => messagesList[index].id == email
                          ? ChatBubble(message: messagesList[index])
                          : ChatBubbleForFreind(message: messagesList[index]),
                      itemCount: messagesList.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      autofocus: true,
                      controller: controller,
                      onSubmitted: (data) {
                        messages.add({
                          KMessage: data,
                          KCreatedAt: DateTime.now(),
                          'id': email
                        });
                        animated();
                        controller.clear();
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.send)),
                    ),
                  )
                ],
              ));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  void jumpTo() {
    _myController.jumpTo(
      _myController.position.maxScrollExtent,
    );
  }

  void animated() {
    _myController.animateTo(0,
        duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }
}
