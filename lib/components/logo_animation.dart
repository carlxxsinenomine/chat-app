import 'package:flutter/material.dart';

import '../constants.dart';

class LogoAnimation extends StatelessWidget {
  const LogoAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Hero(
        tag: logoAnimationTag,
        child: Container(
          height: 200.0,
          child: Image.asset('images/logo.png'),
        ),
      ),
    );
  }
}
