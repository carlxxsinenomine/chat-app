import 'package:flash_chat/components/logo_animation.dart';
import 'package:flash_chat/components/main_text_field.dart';
import 'package:flutter/material.dart';

import '../components/main_button.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            LogoAnimation(),
            SizedBox(
              height: 48.0,
            ),
            MainTextField(hintLabel: "Enter your email", onChange: (value) {

            }),
            SizedBox(
              height: 8.0,
            ),
            MainTextField(hintLabel: "Enter your password", onChange: (value) {

            }),
            SizedBox(
              height: 24.0,
            ),
            MainButton(
                buttonColor: Colors.lightBlueAccent,
                buttonLabel: 'Log In',
                onTap: () {

                }),
          ],
        ),
      ),
    );
  }
}
