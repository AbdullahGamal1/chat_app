import 'package:chat_app/components/custom_bottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../components/custom_form_filed.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  String? email;
  String? password;

  static String routeName = 'RegisterScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2B475E),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Image.asset('assets/images/scholar.png'),
            const Text(
              'Scholar Chat',
              style: TextStyle(
                fontSize: 32,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Text(
                  'Register ',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomFormField(
              hintText: 'Enter Your Name ',
            ),
            const SizedBox(height: 10),
            CustomFormField(
              hintText: 'Enter Your Email',
              onChange: (data) {
                email = data;
              },
            ),
            const SizedBox(height: 10),
            CustomFormField(
              hintText: 'Enter Your Password',
              onChange: (data) => password = data,
            ),
            const SizedBox(height: 10),
            CustomFormField(
              hintText: 'Confirm  Your Password',
            ),
            const SizedBox(height: 10),
            CustomBottom(
                text: 'Register ',
                onTap: () async {
                  try {
                    await registerUser();
                    showSnakBar(context, "Success Created Account");
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      showSnakBar(context, 'The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      showSnakBar(context,  'The account already exists for that email.');
                    }
                  }
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account ? ",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Login',
                        style: TextStyle(color: Color(0xffC7EDE6))))
              ],
            )
          ],
        ),
      ),
    );
  }

  void showSnakBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<void> registerUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.createUserWithEmailAndPassword(
        email: email!, password: password!);
  }
}
