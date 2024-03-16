import 'package:chat_app/components/custom_bottom.dart';
import 'package:chat_app/components/custom_form_filed.dart';
import 'package:chat_app/screens/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String routeName = 'LoginScreen';

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
                  fontSize: 32, color: Colors.white, fontFamily: 'pacifico'),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                 Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10),
            CustomFormField(
              hintText: 'Enter Your Email',
            ),
            const SizedBox(height: 10),
            CustomFormField(
              hintText: 'Enter Your Password',
            ),
            const SizedBox(height: 10),
            CustomBottom(
              text: 'LOGIN',
              onTap: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have account ? ",
                  style: TextStyle(color: Colors.white),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, RegisterScreen.routeName);
                    },
                    child: const Text('Create Account',
                        style: TextStyle(color: Color(0xffC7EDE6))))
              ],
            )
          ],
        ),
      ),
    );
  }
}
