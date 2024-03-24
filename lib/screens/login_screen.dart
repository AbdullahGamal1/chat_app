import 'package:chat_app/components/custom_bottom.dart';
import 'package:chat_app/components/custom_form_filed.dart';
import 'package:chat_app/constance/constance.dart';
import 'package:chat_app/screens/chat_page.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../helper/helper.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = 'LoginScreen';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formKey = GlobalKey();

  String? email;

  String? password;

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: KPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/scholar.png',
                  height: 100,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Scholar Chat',
                      style: TextStyle(
                        fontSize: 32,
                        fontFamily: 'Pacifico',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Text(
                      'Login ',
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
                  hintText: 'Enter Your Email',
                  onChange: (data) {
                    email = data;
                  },
                ),
                const SizedBox(height: 10),
                CustomFormField(
                  isPassword: true,
                  hintText: 'Enter Your Password',
                  onChange: (data) => password = data,
                ),
                const SizedBox(height: 10),
                CustomBottom(
                    text: 'LOGIN ',
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        isLoading = true;
                        setState(() {});
                        try {
                          await loginUser();
                          showSnakBar(context, "Success Login Account");
                          Navigator.pushNamed(context, ChatPage.routeName,
                              arguments: email);
                        } on FirebaseAuthException catch (e) {
                          String message = '';
                          if (e.code == 'user-not-found') {
                            message = 'No user found for that email.';
                          } else if (e.code == 'wrong-password') {
                            message = 'Wrong password provided for that user.';
                          } else {
                            message = 'An error occurred during login.';
                          }
                          showSnakBar(context, message);
                        } catch (error) {
                          showSnakBar(context, 'An unexpected error occurred.');
                        } finally {
                          isLoading = false;
                          setState(() {});
                        }
                      }
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account ? ",
                      style: TextStyle(color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, RegisterScreen.routeName,
                              arguments: email);
                        },
                        child: const Text('Create Account ',
                            style: TextStyle(color: Color(0xffC7EDE6))))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential user = await auth.signInWithEmailAndPassword(
        email: email!, password: password!);
  }
}
