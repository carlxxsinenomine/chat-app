import 'package:flash_chat/contants.dart';
import 'package:flutter/material.dart';

class LogoAnimation extends StatelessWidget {
  const LogoAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: logoAnimationTag,
      child: Container(
        height: 200.0,
        child: Image.asset('images/logo.png'),
      ),
    );
  }
}
