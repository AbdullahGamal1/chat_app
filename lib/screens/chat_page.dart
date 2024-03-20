import 'package:chat_app/components/chat_bubble.dart';
import 'package:chat_app/constance/constance.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatelessWidget {
  static String routeName = 'ChatPage';

  const ChatPage({super.key});

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
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: 
    ListView.builder(
      itemBuilder: (_, index) => ChatBubble(),
      itemCount: 10,
    
    )
    );
  }
}
