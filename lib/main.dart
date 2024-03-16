import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        LoginScreen.routeName: (context) => LoginScreen(),
        RegisterScreen.routeName: (context) => RegisterScreen(),
      },
      initialRoute: LoginScreen.routeName,
      theme:
          ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.white)),
    );
  }
}
