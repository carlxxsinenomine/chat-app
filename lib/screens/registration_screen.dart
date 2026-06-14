import 'package:flash_chat/components/logo_animation.dart';
import 'package:flash_chat/constants.dart';
import 'package:flash_chat/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../components/main_button.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = "/registration_screen";

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth =
      FirebaseAuth.instance; // We'll use this to authenticate the users

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
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(30.0),
                        child: SizedBox(
                            height: 48,
                            child: Center(child: CircularProgressIndicator()))),
                  )
                : MainButton(
                    buttonColor: Colors.blueAccent,
                    buttonLabel: 'Register',
                    onTap: _isLoading
                        ? null
                        : () async {
                            // print(email);
                            // print(password);
                            if (_isLoading) return;
                            setState(() {
                              _isLoading = true;
                            });
                            try {
                              final new_user =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                            } catch (e) {
                              print(e);
                            } finally {
                              setState(() {
                                _isLoading = false;
                              });
                              Navigator.pop(context);
                            }
                          }),
          ],
        ),
      ),
    );
  }
}
