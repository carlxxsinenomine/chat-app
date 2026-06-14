import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/logo_animation.dart';
import 'package:flutter/material.dart';

import '../components/main_button.dart';
import '../constants.dart';
import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = "login_screen";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  bool _isLoading = false;

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
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDeco.copyWith(hintText: "Enter your email"),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration:
                  kTextFieldDeco.copyWith(hintText: "Enter your password"),
            ),
            SizedBox(
              height: 24.0,
            ),
            _isLoading
                ? Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    child: Material(
                        elevation: 5.0,
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(30.0),
                        child: SizedBox(
                            height: 48,
                            child: Center(child: CircularProgressIndicator()))),
                  )
                : MainButton(
                    buttonColor: Colors.lightBlueAccent,
                    buttonLabel: 'Log In',
                    onTap: _isLoading
                        ? null
                        : () async {
                            if (_isLoading) return;
                            setState(() {
                              _isLoading = true;
                            });
                            try {
                              final user =
                                  await _auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              if (user != "") {
                                Navigator.popAndPushNamed(context, ChatScreen.id);
                              }
                            } on Exception catch (e) {
                              print(e);
                            } finally {
                              setState(() {
                                _isLoading = false;
                              });
                            }
                          }),
          ],
        ),
      ),
    );
  }
}
